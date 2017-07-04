( a rewrite and cleanup of my previous code. )
( dara "thallia" klinkner 2017 )

( define all elements )
( so the problem here with redefining elements is that I'll
lose the functionality of CR, I, N, K, TH, but looking those
up now they aren't horribly useful to me :P)

: H   1.01e ;    : He   4.00e ;   : Li   6.94e ;   : Be   9.01e ;
: B   10.81e ;   : C   12.01e ;   : N    14.01e ;  : O    16.00e ;
: F   19.00e ;   : N   20.18e ;  : Na   22.99e ;  : Mg   24.31e ;
: Al   26.98e ;  : Si   28.09e ;  : P    30.97e ;  : S    32.06e ;
: Cl   35.45e ;  : Ar   39.45e ;  : K    39.10e ;  : Ca   40.08e ;
: Sc   44.96e ;  : Ti   47.87e ;  : V    50.94e ;  : Cr   52.00e ; 
: Mn   54.94e ;  : Fe   55.85e ;  : Co   58.93e ;  : Ni   58.69 ;
: Cu   63.55e ;  : Zn   65.38e ;  : Ga   69.72e ;  : Ge  72.63e ; 
: As   107.87e ; : Se   78.96e ;  : Br   79.90e ;  : Kr   83.80e ;
: Rb   85.47e ;  : Sr   87.62e ;  : Y    88.91e ;  : Zr   91.22e ;
: Nb   92.91e ;  : Mo   95.96e ;  : Tc   98.00e ;  : Ru   101.07e ;
: Rh   102.91e ; : Pd   106.42e ; : Ag   107.87e ; : Cd   112.41e ;
: In   114.82e ; : Sn   118.71e ; : Sb   121.76e ; : Te   127.60e ;
: I   126.90e ;  : Xe   131.29e ; : Cs   132.91e ; : Ba   137.33e ;
: La   138.91e ; : Ce   140.12e ; : Pr   140.91 ;  : Nd   144.24e ;
: Pm   145.00e ; : Sm   150.36e ; : Eu   151.96e ; : Gd   157.25e ;
: Tb   158.93e ; : Dy   162.50e ; : Ho   164.93e ; : Er   167.26e ;
: Tm   168.93e ; : Yb   173.05e ; : Lu   174.97e ; : Hf   178.49e ;
: Ta   180.95e ; : W   183.84e ;  : Re   186.21e ; : Os   190.23e ;
: Ir   192.22e ; : Pt   195.08e ; : Au   196.97e ; : Hg   200.59e ;
: Tl   204.38 ; : Pb   207.20e ;  : Bi   208.98e ; : Po   209.99e ;
: At   209.99e ; : Rn   222.02e ; : Fr   223.02e ; : Ra   226.03e ;
: Ac   227.03e ; : Th   232.04e ; : Pa   231.04e ; : U    238.03e ;
: Np   237.05e ; : Pu   244.06e ; : Am   243.06e ; : Cm   247.07e ;
: Bk   247.07e ; : Cf   251.08e ; : Es   254.00e ; : Fm   257.10e ;
: Md   258.10e ; : No   259.10e ; : Lr   262.00e ; : Rf   261.00e ;
: Db   262.00e ; : Sg   266.00e ; : Bh   264.00e ; : Hs   269.00e ;
: Mt   268.00e ; : Ds   269.00e ; : Rg   272.00e ; : Cn   277.00e ;
: Nh   286.00e ; : Fl   289.00e ; : Mc   288.00e ; : Lv   298.00e ;
: Ts   294.00e ; : Og   294.00e ;

( POLYATOMIc IONS )
: NH4   N H 4e f* f+ ; ( ammonium )
: H3O   O H 3e f* f+ ; ( hydronium )
: C2H3O2   C H O 2e f* fswap 3e f* frot 2e f* f+ f+ ; ( acetate )
: CN:  C N f+ ; ( cyanide )
: HCO3   H C O 3e f* f+ f+ ; ( bicarbonate )
: CO3_2   C O 3e f* f+ ; ( carbonate )
: OH   O H f+ ; ( hydroxide ) 
: NO2   N O 2e f* f+ ; ( nitrite )
: NO3   N O 3e f* f+ ; ( nitrate )
: SO3_2   S O 3e f* f+ ; ( sulfite )
: SO4_2   S O 4e f* f+ ; ( sulfate )
: PO4_3   P O 4e f* f+ ; ( phosphate )
( subscripts)
: ^2   2e f* ; : ^3   3e f* ; : ^4   4e f* ; : ^5   5e f* ;
: ^6   6e f* ; : ^7   7e f* ; : ^8   8e f* ; : ^9   9e f* ;
: ^10   10e f* ; : ^11   11e f* ; : ^12   12e f* ; : ^13   13e f* ;
: ^14   14e f* ; : ^15   15e f* ; : ^16   16e f* ; : ^17   17e f* ;
: ^18   18e f* ; : ^19   19e f* ; : ^20   20e f* ; : ^21   21e f* ;

: newcr   newline type ; ( rewrites cr)

: g-m   f/ fdup newcr newcr f. ." moles of element A "
    newcr
    ." Next, please enter the ratio of element B to element A, inputting B first and A second: B A "
    newcr
    ." Execute m-m. " ; ( n-molesA n-ratioB n-ratioA --  )

: ratio   s>f s>f ;

: m-m   ratio frot f* fswap f/ fdup newcr newcr f. ." moles of element B "
    newcr newcr
    ." Finally, please enter the symbol of element B and insert f+ e-1 times (e.g. H ^2 O f+ ) "
    newcr
    ." Execute m-g. " ;  ( n-molesA n-ratioB n-ratioA -- n-molesB )

: m-g   f* newcr newcr f. ." grams of element B "
    newcr newcr
    ." You have successfully performed gmmg! " ;


newcr newcr
." Welcome to stoichiometry! "
newcr newcr
." First, please input the amount of grams of the element you wish to convert with the format: 150e "
newcr newcr
." After, please input the chemical formula of the element or molecule, like so: HCl = H Cl. "
newcr newcr
." If there are multiple atoms within a molecule, input the information like so: C ^6 H ^12 O ^6 "
newcr newcr
." Here's the last tricky part: However many elements are in your molecule, count them, and subtract one from that number (e-1). Whatever the difference is, input f+ that many times with a space inbetween each entry. "
newcr newcr
." Execute g-m." quit
