( this is a forth program that performs stoichiometry for any element, given the user provides the ratios and chemical formulas; gm-mm-mg )

( dara "thallia" klinkner 2017  define all elements for usage in the program )

( define all elements )
: H_   1.01e ;    : He_   4.00e ;   : Li_   6.94e ;   : Be_   9.01e ;
: B_   10.81e ;   : C_   12.01e ;   : N_    14.01e ;  : O_    16.00e ;
: F_   19.00e ;   : Ne_   20.18e ;  : Na_   22.99e ;  : Mg_   24.31e ;
: Al_   26.98e ;  : Si_   28.09e ;  : P_    30.97e ;  : S_    32.06e ;
: Cl_   35.45e ;  : Ar_   39.45e ;  : K_    39.10e ;  : Ca_   40.08e ;
: Sc_   44.96e ;  : Ti_   47.87e ;  : V_    50.94e ;  : Cr_   52.00e ; 
: Mn_   54.94e ;  : Fe_   55.85e ;  : Co_   58.93e ;  : Ni_   58.69 ;
: Cu_   63.55e ;  : Zn_   65.38e ;  : Ga_   69.72e ;  : Ge_   72.63e ; 
: As_   107.87e ; : Se_   78.96e ;  : Br_   79.90e ;  : Kr_   83.80e ;
: Rb_   85.47e ;  : Sr_   87.62e ;  : Y_    88.91e ;  : Zr_   91.22e ;
: Nb_   92.91e ;  : Mo_   95.96e ;  : Tc_   98.00e ;  : Ru_   101.07e ;
: Rh_   102.91e ; : Pd_   106.42e ; : Ag_   107.87e ; : Cd_   112.41e ;
: In_   114.82e ; : Sn_   118.71e ; : Sb_   121.76e ; : Te_   127.60e ;
: I_   126.90e ;  : Xe_   131.29e ; : Cs_   132.91e ; : Ba_   137.33e ;
: La_   138.91e ; : Ce_   140.12e ; : Pr_   140.91 ;  : Nd_   144.24e ;
: Pm_   145.00e ; : Sm_   150.36e ; : Eu_   151.96e ; : Gd_   157.25e ;
: Tb_   158.93e ; : Dy_   162.50e ; : Ho_   164.93e ; : Er_   167.26e ;
: Tm_   168.93e ; : Yb_   173.05e ; : Lu_   174.97e ; : Hf_   178.49e ;
: Ta_   180.95e ; : W_   183.84e ;  : Re_   186.21e ; : Os_   190.23e ;
: Ir_   192.22e ; : Pt_   195.08e ; : Au_   196.97e ; : Hg_   200.59e ;
: Tl_   204.38 ; : Pb_   207.20e ;  : Bi_   208.98e ; : Po_   209.99e ;
: At_   209.99e ; : Rn_   222.02e ; : Fr_   223.02e ; : Ra_   226.03e ;
: Ac_   227.03e ; : Th_   232.04e ; : Pa_   231.04e ; : U_    238.03e ;
: Np_   237.05e ; : Pu_   244.06e ; : Am_   243.06e ; : Cm_   247.07e ;
: Bk_   247.07e ; : Cf_   251.08e ; : Es_   254.00e ; : Fm_   257.10e ;
: Md_   258.10e ; : No_   259.10e ; : Lr_   262.00e ; : Rf_   261.00e ;
: Db_   262.00e ; : Sg_   266.00e ; : Bh_   264.00e ; : Hs_   269.00e ;
: Mt_   268.00e ; : Ds_   269.00e ; : Rg_   272.00e ; : Cn_   277.00e ;
: Nh_   286.00e ; : Fl_   289.00e ; : Mc_   288.00e ; : Lv_   298.00e ;
: Ts_   294.00e ; : Og_   294.00e ;
( POLYATOMIC IONS )
: NH4+   N_ H_ 4e f* f+ ; ( ammonium )
: H3O+   O_ H_ 3e f* f+ ; ( hydronium )
: C2H3O2-   C_ H_ O_ 2e f* fswap 3e f* frot 2e f* f+ f+ ; ( acetate )
: CN-   C_ N_ f+ ; ( cyanide )
: HCO3-   H_ C_ O_ 3e f* f+ f+ ; ( bicarbonate )
: CO3_2-   C_ O_ 3e f* f+ ; ( carbonate )
: OH-   O_ H_ f+ ; ( hydroxide ) 
: NO2-   N_ O_ 2e f* f+ ; ( nitrite )
: NO3s   N_ O_ 3e f* f+ ; ( nitrate )
: SO3_2-   S_ O_ 3e f* f+ ; ( sulfite )
: SO4_2-   S_ O_ 4e f* f+ ; ( sulfate )
: PO4_3-   P_ O_ 4e f* f+ ; ( phosphate )
( subscripts)
: ^2   2e f* ; : ^3   3e f* ; : ^4   4e f* ; : ^5   5e f* ;
: ^6   6e f* ; : ^7   7e f* ; : ^8   8e f* ; : ^9   9e f* ;
: ^10   10e f* ; : ^11   11e f* ; : ^12   12e f* ; : ^13   13e f* ;
: ^14   14e f* ; : ^15   15e f* ; : ^16   16e f* ; : ^17   17e f* ;
: ^18   18e f* ; : ^19   19e f* ; : ^20   20e f* ; : ^21   21e f* ;

( opening display )
CR CR
." Welcome to stoichiometry! "
CR CR
." First, please input the amount of grams of the element you wish to convert with the format: 150e" ( -- n-grams )

CR CR
." After, please input the chemical formula of the element or molecule, with a '_' after each element, like so: HCl = H_ Cl_ " ( n-grams -- n-H n-Cl n-grams )
CR CR
." If there are multiple atoms within a molecule, input the information like so (glucose):  C_ ^6 H_ ^12 O_ ^6 "
CR CR
." Here's the last tricky part: However many elements are in your molecule, count them, and subtract one from that number (e-1). Whatever the difference is, input 'f+' that many times." 
CR CR
." Execute g-m. " ( n-grams n-amu -- n-molesA )


: g-m   f/ fdup CR CR  f. ." moles of element A "
    CR CR
    ." Next, please enter the ratio of element B to element A, inputting B first and A second: B A "
    CR
    ." Execute m-m. " ; ( n-molesA n-ratioB n-ratioA --  )

: ratio   s>f s>f ;

: m-m   ratio frot f* fswap f/ fdup CR CR f. ." moles of element B "
    CR CR
    ." Finally, please enter the symbol of element B and insert f+ e-1 times (e.g. H_ ^2 O_ f+ ) "
    CR CR
    ." Execute m-g. " ;  ( n-molesA n-ratioB n-ratioA -- n-molesB )

: m-g   f* CR CR f. ." grams of element B "
    CR CR
    ." You have successfully performed gmmg! " ;
