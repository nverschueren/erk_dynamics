!---------------------------------------------------------------------- 
!---------------------------------------------------------------------- 
!   ERK :   Erk dynamics model, including rho
!---------------------------------------------------------------------- 
!---------------------------------------------------------------------- 

      SUBROUTINE FUNC(NDIM,U,ICP,PAR,IJAC,F,DFDU,DFDP) 
!     ---------- ---- 

      IMPLICIT NONE
      INTEGER, INTENT(IN) :: NDIM, ICP(*), IJAC
      DOUBLE PRECISION, INTENT(IN) :: U(NDIM), PAR(*)
      DOUBLE PRECISION, INTENT(OUT) :: F(NDIM)
      DOUBLE PRECISION, INTENT(INOUT) :: DFDU(NDIM,NDIM), DFDP(NDIM,*)
! the field names start with capitol. parameters lower case
      DOUBLE PRECISION R, Er, M,Rho
      DOUBLE PRECISION k1cat, rasgtp, kf
      DOUBLE PRECISION totraf,totmek,toterk
      DOUBLE PRECISION km1,km4,efe,v4max,v8max
      DOUBLE PRECISION km8,km5,k5cat,v12max,km12
      DOUBLE PRECISION k9cat,km9
      !I will write the rhs in pieces called alphai, i for the equation
      DOUBLE PRECISION alpha1,alpha2,alpha3
      DOUBLE PRECISION rho0,beta,alpha

      R=U(1)
      M=U(2)
      Er=U(3)
      Rho=U(4)

      efe=PAR(1)
      kf=PAR(2)
      k1cat=PAR(3)
      

      !par values
      !k1cat=1.0
      rasgtp=10.0
      !kf=1.0
      totraf=300.0
      totmek=300.0
      toterk=300.0
      km1=100.0
      km4=100.0
      !f=efe
      v4max=3.75
      v8max=3.75
      km8=80.0
      km5=250.0
      k5cat=2.5
      v12max=5.0
      km12=20.0
      k9cat=0.125
      km9=250.0
      rho0=10.0
      alpha=0.1
      beta=0.1





      alpha1=k1cat*rasgtp*(1+efe*Er/kf)*(totraf-R)
      alpha1=alpha1/(km1*(1+Er/kf)*(1+(totraf-R)/km1))
      alpha1=alpha1-v4max*R/(km4*(1+R/km4))

      alpha2=k5cat*(totmek-M)*R/(km5*(1+(totmek-M)/km5))
      alpha2=alpha2-v8max*M/(km8*(1+M/km8))

      alpha3=k9cat*(toterk-Er)*M/(km9*(1+(toterk-Er)/km9))
      alpha3=alpha3-v12max*Er/(km12*(1+Er/km12))

  
       F(1)= alpha1
       F(2)= alpha2
       F(3)= alpha3-beta*Rho
       F(4)=-(Rho-rho0)**2+alpha*Er

      END SUBROUTINE FUNC

      SUBROUTINE STPNT(NDIM,U,PAR,T)
!     ---------- ----- 

      IMPLICIT NONE
      INTEGER, INTENT(IN) :: NDIM
      DOUBLE PRECISION, INTENT(INOUT) :: U(NDIM),PAR(*)
      DOUBLE PRECISION, INTENT(IN) :: T

       PAR(1)=1.0 !efe
       PAR(2)= 1.0!kf
       PAR(3)=1.0!k1cat
       


       U(1)=262.71058385
       U(2)=298.86888705
       U(3)=250.90935095
       U(4)=15.00908526

      END SUBROUTINE STPNT

      SUBROUTINE BCND 
      END SUBROUTINE BCND

      SUBROUTINE ICND 
      END SUBROUTINE ICND

      SUBROUTINE FOPT 
      END SUBROUTINE FOPT

      SUBROUTINE PVLS
      END SUBROUTINE PVLS
