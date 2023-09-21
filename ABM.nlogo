extensions [csv]
breed [persons person]

globals [
  emprate_mo emprate_na emprate_sa emprate_bots emprate_zim
  fdi_mo fdi_na fdi_sa fdi_bots fdi_zim
  gini_mo gini_na gini_sa gini_bots gini_zim
  sigmagini_mo sigmagini_na sigmagini_sa sigmagini_bots sigmagini_zim
  income_mo income_na income_sa income_bots income_zim
  muincome_mo muincome_na muincome_sa muincome_bots muincome_zim
  cons_mo cons_na cons_sa cons_bots cons_zim
  mucons_mo mucons_na mucons_sa mucons_bots mucons_zim
  emprate
  gini
  wage
  con
  eduT
  mor
  fer
  monaflows mosaflows mobotsflows mozimflows
  namoflows nasaflows nabotsflows nazimflows
  samoflows sanaflows sabotsflows sazimflows
  botsmoflows botsnaflows botssaflows botszimflows
  zimmoflows zimnaflows zimsaflows zimbotsflows
  monarate mosarate mobotsrate mozimrate
  namorate nasarate nabotsrate nazimrate
  samorate sanarate sabotsrate sazimrate
  botsmorate botsnarate botssarate botszimrate
  zimmorate zimnarate zimsarate zimbotsrate
  moedu naedu saedu botsedu zimedu
  mofer nafer safer botsfer zimfer
  momor namor samor botsmor zimmor
  monastock mosastock mobotsstock mozimstock
  namostock nasastock nabotsstock nazimstock
  samostock sanastock sabotsstock sazimstock
  botsmostock botsnastock botssastock botszimstock
  zimmostock zimnastock zimsastock zimbotsstock

]

patches-own [
  region
  joboppor
  fdi
  wage-here
  consumption-here
]

persons-own[
  age
  sex
  edu
  emp
  country
  agefactor
  sexfactor
  edufactor
  empfactor
  moving-intentions
  migrant
  wage-earning
  person-consume
  wealth
  saving1
  saving2
  saving3
  saving4
  saving5
  intention1
  intention2
  intention3
  intention4
  intention5
  attitude1
  SN1
  PBC1
  attitude2
  SN2
  PBC2
  attitude3
  SN3
  PBC3
  attitude4
  SN4
  PBC4
  attitude5
  SN5
  PBC5
  move-list
  time-list
  premig
]

to setup
  __clear-all-and-reset-ticks
  setup-country
  setup-people
  setup-links
  load-data
  ;print max [age] of persons with [region = 1]
end

to setup-country
  ;mo

  ask patches with [pxcor >= 50 and pycor > 0] [
    set pcolor 28
    set region 1


  ]

  ;na
  ask patches with [pxcor >= -100 and pxcor < -50 and pycor > 0] [
    set pcolor 68
    set region 2

  ]

  ;sa
  ask patches with [pycor <= 0] [
    set pcolor 98
    set region 3
  ]

  ;bots
  ask patches with [pxcor >= -50 and pxcor < 0 and pycor > 0] [
    set pcolor 138
    set region 4

  ]
  ;zim
  ask patches with [pxcor >= 0 and pxcor < 50 and pycor > 0] [
    set pcolor 48
    set region 5

  ]
end

to setup-people
  file-close-all
  file-open "mopop.csv"
  let headings1 csv:from-row file-read-line
  while [not file-at-end?][
    let mo csv:from-row file-read-line
    ;print mo
    create-persons inimo [
      set age item 0 mo
      set sex item 1 mo
      set edu item 2 mo
      set emp item 3 mo
      set premig item 4 mo
      set wealth item 5 mo
      set agefactor item 6 mo
      set sexfactor item 7 mo
      set edufactor item 8 mo
      set empfactor item 9 mo
      move-to one-of patches with [region = 1]
      set color 25
      set size 0.1
      set country 1
      set move-list []
      set time-list []
    ]
  ]

  file-close-all
  file-open "napop.csv"
  let headings2 csv:from-row file-read-line
  while [not file-at-end?][
    let na csv:from-row file-read-line
    ;print na
    create-persons inina [
      set age item 0 na
      set sex item 1 na
      set edu item 2 na
      set emp item 3 na
      set premig item 4 na
      set wealth item 5 na
      set agefactor item 6 na
      set sexfactor item 7 na
      set edufactor item 8 na
      set empfactor item 9 na
      move-to one-of patches with [region = 2]
      set color 65
      set size 0.1
      set country 2
      set move-list []
      set time-list []
    ]
  ]

  file-close-all
  file-open "sapop.csv"
  let headings3 csv:from-row file-read-line
  while [not file-at-end?][
    let sa csv:from-row file-read-line
    ;print sa
    create-persons inisa [
      set age item 0 sa
      set sex item 1 sa
      set edu item 2 sa
      set emp item 3 sa
      set premig item 4 sa
      set wealth item 5 sa
      set agefactor item 6 sa
      set sexfactor item 7 sa
      set edufactor item 8 sa
      set empfactor item 9 sa
      move-to one-of patches with [region = 3]
      set color 95
      set size 0.1
      set country 3
      set move-list []
      set time-list []
    ]
  ]

  file-close-all
  file-open "botspop.csv"
  let headings4 csv:from-row file-read-line
  while [not file-at-end?][
    let bots csv:from-row file-read-line
    ;print bots
    create-persons inibots [
      set age item 0 bots
      set sex item 1 bots
      set edu item 2 bots
      set emp item 3 bots
      set premig item 4 bots
      set wealth item 5 bots
      set agefactor item 6 bots
      set sexfactor item 7 bots
      set edufactor item 8 bots
      set empfactor item 9 bots
      move-to one-of patches with [region = 4]
      set color 135
      set size 0.1
      set country 4
      set move-list []
      set time-list []
    ]
  ]

  file-close-all
  file-open "zimpop.csv"
  let headings5 csv:from-row file-read-line
  while [not file-at-end?][
    let zim csv:from-row file-read-line
    ;print zim
    create-persons inizim [
      set age item 0 zim
      set sex item 1 zim
      set edu item 2 zim
      set emp item 3 zim
      set premig item 4 zim
      set wealth item 5 zim
      set agefactor item 6 zim
      set sexfactor item 7 zim
      set edufactor item 8 zim
      set empfactor item 9 zim
      move-to one-of patches with [region = 5]
      set color 45
      set size 0.1
      set country 5
      set move-list []
      set time-list []
    ]
  ]

end

to setup-links
 while [ count links < 98753 ] [
    ask one-of turtles [
      create-link-with one-of other turtles
    ]
  ]
end

to load-data
   set emprate_mo[]
   file-open "moemp_rate.csv"
   while [not file-at-end?][
     set emprate_mo lput file-read emprate_mo]
   file-close

   set emprate_na []
   file-open "naemp_rate.csv"
   while [not file-at-end?] [
     set emprate_na lput file-read emprate_na]
   file-close

   set emprate_sa []
   file-open "saemp_rate.csv"
   while [not file-at-end?] [
     set emprate_sa lput file-read emprate_sa]
   file-close

   set emprate_bots []
   file-open "botsemp_rate.csv"
   while [not file-at-end?] [
     set emprate_bots lput file-read emprate_bots]
   file-close

   set emprate_zim []
   file-open "zimemp_rate.csv"
   while [not file-at-end?] [
     set emprate_zim lput file-read emprate_zim]
   file-close

     set fdi_mo[]
   file-open "mo_fdi.csv"
   while [not file-at-end?][
     set fdi_mo lput file-read fdi_mo]
   file-close

   set fdi_na []
   file-open "nafdi.csv"
   while [not file-at-end?] [
     set fdi_na lput file-read fdi_na]
   file-close

   set fdi_sa []
   file-open "safdi.csv"
   while [not file-at-end?] [
     set fdi_sa lput file-read fdi_sa]
   file-close

   set fdi_bots []
   file-open "botsfdi.csv"
   while [not file-at-end?] [
     set fdi_bots lput file-read fdi_bots]
   file-close

   set fdi_zim []
   file-open "zimfdi.csv"
   while [not file-at-end?] [
     set fdi_zim lput file-read fdi_zim]
   file-close

  set cons_mo []
   file-open "mo_consumption.csv"
   while [not file-at-end?] [
     set cons_mo lput file-read cons_mo]
   file-close

   set cons_na []
   file-open "na_consumption.csv"
   while [not file-at-end?] [
     set cons_na lput file-read cons_na]
   file-close

   set cons_sa []
   file-open "sa_consumption.csv"
   while [not file-at-end?] [
     set cons_sa lput file-read cons_sa]
   file-close

  set cons_bots []
   file-open "bots_consumption.csv"
   while [not file-at-end?] [
     set cons_bots lput file-read cons_bots]
   file-close

   set cons_zim []
   file-open "zim_consumption.csv"
   while [not file-at-end?] [
     set cons_zim lput file-read cons_zim]
   file-close

   set income_mo []
   file-open "mo_income.csv"
   while [not file-at-end?] [
     set income_mo lput file-read income_mo]
   file-close

   set income_na []
   file-open "na_income.csv"
   while [not file-at-end?] [
     set income_na lput file-read income_na]
   file-close

   set income_sa []
   file-open "sa_income.csv"
   while [not file-at-end?] [
     set income_sa lput file-read income_sa]
   file-close

   set income_bots []
   file-open "bots_income.csv"
   while [not file-at-end?] [
     set income_bots lput file-read income_bots]
   file-close

   set income_zim []
   file-open "zim_income.csv"
   while [not file-at-end?] [
     set income_zim lput file-read income_zim]
   file-close

     set gini_mo []
   file-open "mo_gini.csv"
   while [not file-at-end?] [
     set gini_mo lput file-read gini_mo]

   file-close

   set gini_na []
   file-open "na_gini.csv"
   while [not file-at-end?] [
     set gini_na lput file-read gini_na]
   file-close

   set gini_sa []
   file-open "sa_gini.csv"
   while [not file-at-end?] [
     set gini_sa lput file-read gini_sa]
   file-close

   set gini_bots []
   file-open "bots_gini.csv"
   while [not file-at-end?] [
     set gini_bots lput file-read gini_bots]
   file-close

   set gini_zim []
   file-open "zim_gini.csv"
   while [not file-at-end?] [
     set gini_zim lput file-read gini_zim]
   file-close

    set moedu []
  file-open "mo_edu.txt"
   while [not file-at-end?] [
     set moedu lput file-read moedu]
   file-close

      set naedu []
  file-open "na_edu.txt"
   while [not file-at-end?] [
     set naedu lput file-read naedu]
   file-close

      set saedu []
  file-open "sa_edu.txt"
   while [not file-at-end?] [
     set saedu lput file-read saedu]
   file-close

      set botsedu []
  file-open "bots_edu.txt"
   while [not file-at-end?] [
     set botsedu lput file-read botsedu]
   file-close

      set zimedu []
  file-open "zim_edu.txt"
   while [not file-at-end?] [
     set zimedu lput file-read zimedu]
   file-close
  ;;
      set mofer []
  file-open "mo_fer.txt"
   while [not file-at-end?] [
     set mofer lput file-read mofer]
   file-close

      set nafer []
  file-open "na_fer.txt"
   while [not file-at-end?] [
     set nafer lput file-read nafer]
   file-close

      set safer []
  file-open "sa_fer.txt"
   while [not file-at-end?] [
     set safer lput file-read safer]
   file-close

      set botsfer []
  file-open "bots_fer.txt"
   while [not file-at-end?] [
     set botsfer lput file-read botsfer]
   file-close

      set zimfer []
  file-open "zim_fer.txt"
   while [not file-at-end?] [
     set zimfer lput file-read zimfer]
   file-close

        set momor []
  file-open "mo_mor.txt"
   while [not file-at-end?] [
     set momor lput file-read momor]
   file-close

      set namor []
  file-open "na_mor.txt"
   while [not file-at-end?] [
     set namor lput file-read namor]
   file-close

      set samor []
  file-open "sa_mor.txt"
   while [not file-at-end?] [
     set samor lput file-read samor]
   file-close

      set botsmor []
  file-open "bots_mor.txt"
   while [not file-at-end?] [
     set botsmor lput file-read botsmor]
   file-close

      set zimmor []
  file-open "zim_mor.txt"
   while [not file-at-end?] [
     set zimmor lput file-read zimmor]
   file-close
end

to go
  reset-values
  earn-income
  consume
  migrate
  summary
  ;update-demographics
  tick
end


to reset-values

   ask persons [
   let friends nobody
    set friends other persons in-radius 1

    if migrant = 1
    [create-links-with friends]
  ]

    ask persons [
    set moving-intentions 0
    if migrant = 2 [set migrant 0]
    if migrant = 1 [set migrant 2]

  ]

  ask patches with [region = 1] [
    ifelse ticks > 1 [
    set emprate item (ticks - 1) emprate_mo
    set fdi item (ticks - 1) fdi_mo
    set eduT item (ticks - 1) moedu
    set mor item (ticks - 1) momor
    set fer item (ticks - 1) mofer
    set gini item (ticks - 1) gini_mo
    set wage item (ticks - 1) income_mo
    set con item (ticks - 1) cons_mo
    let sigma sqrt (2 * ln (1 / gini))
    let mucon (ln con) - (sigma ^ 2) / 2
    set wage-here wage
    set joboppor theta1 * fdi + theta2 * emprate + theta3 * wage-here
    set consumption-here con
    ]
    [
    set emprate item 0 emprate_mo
    set fdi item 0 fdi_mo
    set eduT item 0 moedu
    set mor item 0 momor
    set fer item 0 mofer
    set gini item 0 gini_mo
    set wage item 0 income_mo
    set con item 0 cons_mo
    ]
  ask persons  [
    let sigma sqrt (2 * ln (1 / gini))
    let muincome (ln wage) - (sigma ^ 2) / 2
    let mucon (ln con) - (sigma ^ 2) / 2
    ifelse emp = 1 [set wage-earning exp random-normal muincome sigma] [set wage-earning 0]
    set person-consume exp random-normal mucon sigma
  ]
  ]
  ask patches with [region = 2] [
    ifelse ticks > 1 [
    set emprate item (ticks - 1) emprate_na
    set fdi item (ticks - 1) fdi_na
    set eduT item (ticks - 1) naedu
    set mor item (ticks - 1) namor
    set fer item (ticks - 1) nafer
    set gini item (ticks - 1) gini_na
    set wage item (ticks - 1) income_na
    set con item (ticks - 1) cons_na
    let sigma sqrt (2 * ln (1 / gini))
    let mucon (ln con) - (sigma ^ 2) / 2
    set wage-here wage
    set joboppor theta1 * fdi + theta2 * emprate + theta3 * wage-here
    set consumption-here con
    ]
     [
    set emprate item 0 emprate_na
    set fdi item 0 fdi_na
    set eduT item 0 naedu
    set mor item 0 namor
    set fer item 0 nafer
    set gini item 0 gini_na
    set wage item 0 income_na
    set con item 0 cons_na
    ]
  ask persons  [
    let sigma sqrt (2 * ln (1 / gini))
    let muincome (ln wage) - (sigma ^ 2) / 2
    let mucon (ln con) - (sigma ^ 2) / 2
    ifelse emp = 1 [set wage-earning exp random-normal muincome sigma] [set wage-earning 0]
    set person-consume exp random-normal mucon sigma
  ]
  ]

  ask patches with [region = 3] [
    ifelse ticks > 1 [
    set emprate item (ticks - 1) emprate_sa
    set fdi item (ticks - 1) fdi_sa
    set eduT item (ticks - 1) saedu
    set mor item (ticks - 1) samor
    set fer item (ticks - 1) safer
    set gini item (ticks - 1) gini_sa
    set wage item (ticks - 1) income_sa
    set con item (ticks - 1) cons_sa
    let sigma sqrt (2 * ln (1 / gini))
    let mucon (ln con) - (sigma ^ 2) / 2
    set wage-here wage
    set joboppor theta1 * fdi + theta2 * emprate + theta3 * wage-here
    set consumption-here con
    ]
     [
    set emprate item 0 emprate_sa
    set fdi item 0 fdi_sa
    set eduT item 0 saedu
    set mor item 0 samor
    set fer item 0 safer
    set gini item 0 gini_sa
    set wage item 0 income_sa
    set con item 0 cons_sa
    ]
  ask persons  [
    let sigma sqrt (2 * ln (1 / gini))
    let muincome (ln wage) - (sigma ^ 2) / 2
    let mucon (ln con) - (sigma ^ 2) / 2
    ifelse emp = 1 [set wage-earning exp random-normal muincome sigma] [set wage-earning 0]
    set person-consume exp random-normal mucon sigma
  ]
  ]

  ask patches with [region = 4] [
    ifelse ticks > 1 [
    set emprate item (ticks - 1) emprate_bots
    set fdi item (ticks - 1) fdi_bots
    set eduT item (ticks - 1) botsedu
    set mor item (ticks - 1) botsmor
    set fer item (ticks - 1) botsfer
    set gini item (ticks - 1) gini_bots
    set wage item (ticks - 1) income_bots
    set con item (ticks - 1) cons_bots
    let sigma sqrt (2 * ln (1 / gini))
    let mucon (ln con) - (sigma ^ 2) / 2
    set wage-here wage
    set joboppor theta1 * fdi + theta2 * emprate + theta3 * wage-here
    set consumption-here con
    ]
     [
    set emprate item 0 emprate_bots
    set fdi item 0 fdi_bots
    set eduT item 0 botsedu
    set mor item 0 botsmor
    set fer item 0 botsfer
    set gini item 0 gini_bots
    set wage item 0 income_bots
    set con item 0 cons_bots
    ]
  ask persons  [
    let sigma sqrt (2 * ln (1 / gini))
    let muincome (ln wage) - (sigma ^ 2) / 2
    let mucon (ln con) - (sigma ^ 2) / 2
    ifelse emp = 1 [set wage-earning exp random-normal muincome sigma] [set wage-earning 0]
    set person-consume exp random-normal mucon sigma
  ]
  ]

  ask patches with [region = 5] [
    ifelse ticks > 1 [
    set emprate item (ticks - 1) emprate_zim
    set fdi item (ticks - 1) fdi_zim
    set eduT item (ticks - 1) zimedu
    set mor item (ticks - 1) zimmor
    set fer item (ticks - 1) zimfer
    set gini item (ticks - 1) gini_zim
    set wage item (ticks - 1) income_zim
    set con item (ticks - 1) cons_zim
    let sigma sqrt (2 * ln (1 / gini))
    let mucon (ln con) - (sigma ^ 2) / 2
    set wage-here wage
    set joboppor theta1 * fdi + theta2 * emprate + theta3 * wage-here
    set consumption-here con
    ]
     [
    set emprate item 0 emprate_zim
    set fdi item 0 fdi_zim
    set eduT item 0 zimedu
    set mor item 0 zimmor
    set fer item 0 zimfer
    set gini item 0 gini_zim
    set wage item 0 income_zim
    set con item 0 cons_zim
    ]
  ask persons  [
    let sigma sqrt (2 * ln (1 / gini))
    let muincome (ln wage) - (sigma ^ 2) / 2
    let mucon (ln con) - (sigma ^ 2) / 2
    ifelse emp = 1 [set wage-earning exp random-normal muincome sigma] [set wage-earning 0]
    set person-consume exp random-normal mucon sigma
  ]
  ]
end

to earn-income
  ask persons [
    set wealth wealth + wage-earning
  ]
end

to consume
  ask persons [
    set wealth wealth - person-consume
  ]
end

to migrate
  ;compute-A
  ;compute-SN
  ;compute-PBC
  compute-intention
  make-decesions
end

to compute-intention

   ask persons with [region = 1] [
    let eco1 0
    let ind1 lambda1 * agefactor + lambda2 * sexfactor + lambda3 * edufactor + lambda4 * empfactor
    set attitude1 (random-float alpha1) * eco1 + alpha2 * ind1
    set SN1 random-float beta * (count link-neighbors with [region = 1] / count link-neighbors)
    set PBC1 ((random-float gamma1) * (1 - exp(- saving1 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention1 a * attitude1 + b * SN1 + c * PBC1

    let eco2 theta1 * ([fdi] of patch -75 50 - fdi) + theta2 * ([emprate] of patch -75 50 - emprate) + theta3 * ([wage-here] of patch -75 50 - wage-here)
    set attitude2 (random-float alpha1) * eco2 + alpha2 * ind1
    set SN2 random-float beta * (count link-neighbors with [region = 2] / count link-neighbors)
    set PBC2 ((random-float gamma1) * (1 - exp(- saving2 / wealth ))) / (1 + (random-float gamma2) * 1)
    set intention2 a * attitude2 + b * SN2 + c * PBC2

    let eco3 theta1 * ([fdi] of patch 0 -50 - fdi) + theta2 * ([emprate] of patch 0 -50 - emprate) + theta3 * ([wage-here] of patch 0 -50 - wage-here)
    set attitude3 (random-float alpha1) * eco3 + alpha2 * ind1
    set SN3 random-float beta * (count link-neighbors with [region = 3] / count link-neighbors)
    set PBC3 ((random-float gamma1) * (1 - exp(- saving3 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention3 a * attitude3 + b * SN3 + c * PBC3

    let eco4 theta1 * ([fdi] of patch -25 50 - fdi) + theta2 * ([emprate] of patch -25 50 - emprate) + theta3 * ([wage-here] of patch -25 50 - wage-here)
    set attitude4 (random-float alpha1) * eco4 + alpha2 * ind1
    set SN4 random-float beta * (count link-neighbors with [region = 4] / count link-neighbors)
    set PBC4 ((random-float gamma1) * (1 - exp(- saving4 / wealth ))) / (1 + (random-float gamma2) * 1)
    set intention4 a * attitude4 + b * SN4 + c * PBC4

    let eco5 theta1 * ([fdi] of patch 25 50 - fdi) + theta2 * ([emprate] of patch 25 50 - emprate) + theta3 * ([wage-here] of patch 25 50 - wage-here)
    set attitude5 (random-float alpha1) * eco5 + alpha2 * ind1
    set SN5 random-float beta * (count link-neighbors with [region = 5] / count link-neighbors)
    set PBC5 ((random-float gamma1) * (1 - exp(- saving5 / wealth ))) / (1 + (random-float gamma2) * 1)
    set intention5 a * attitude5 + b * SN5 + c * PBC5


  ]

  ask persons with [region = 2] [
    let eco1 theta1 * ([fdi] of patch 75 50 - fdi) + theta2 * ([emprate] of patch 75 50 - emprate) + theta3 * ([wage-here] of patch 75 50 - wage-here)
    let ind1 lambda1 * agefactor + lambda2 * sexfactor + lambda3 * edufactor + lambda4 * empfactor
    set attitude1 (random-float alpha1) * eco1 + alpha2 * ind1
    set SN1 random-float beta * (count link-neighbors with [region = 1] / count link-neighbors)
    set PBC1 ((random-float gamma1) * (1 - exp(- saving1 / wealth ))) / (1 + (random-float gamma2) * 1)
    set intention1 a * attitude1 + b * SN1 + c * PBC1

    let eco2 0
    set attitude2 (random-float alpha1) * eco2 + alpha2 * ind1
    set SN2 random-float beta * (count link-neighbors with [region = 2] / count link-neighbors)
    set PBC2 ((random-float gamma1) * (1 - exp(- saving2 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention2 a * attitude2 + b * SN2 + c * PBC2

    let eco3 theta1 * ([fdi] of patch 0 -50 - fdi) + theta2 * ([emprate] of patch 0 -50 - emprate) + theta3 * ([wage-here] of patch 0 -50 - wage-here)
    set attitude3 (random-float alpha1) * eco3 + alpha2 * ind1
    set SN3 random-float beta * (count link-neighbors with [region = 3] / count link-neighbors)
    set PBC3 ((random-float gamma1) * (1 - exp(- saving3 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention3 a * attitude3 + b * SN3 + c * PBC3

    let eco4 theta1 * ([fdi] of patch -25 50 - fdi) + theta2 * ([emprate] of patch -25 50 - emprate) + theta3 * ([wage-here] of patch -25 50 - wage-here)
    set attitude4 (random-float alpha1) * eco4 + alpha2 * ind1
    set SN4 random-float beta * (count link-neighbors with [region = 4] / count link-neighbors)
    set PBC4 ((random-float gamma1) * (1 - exp(- saving4 / wealth ))) / (1 + (random-float gamma2) * 1)
    set intention4 a * attitude4 + b * SN4 + c * PBC4

    let eco5 theta1 * ([fdi] of patch 25 50 - fdi) + theta2 * ([emprate] of patch 25 50 - emprate) + theta3 * ([wage-here] of patch 25 50 - wage-here)
    set attitude5 (random-float alpha1) * eco5 + alpha2 * ind1
    set SN5 random-float beta * (count link-neighbors with [region = 5] / count link-neighbors)
    set PBC5 ((random-float gamma1) * (1 - exp(- saving5 / wealth ))) / (1 + (random-float gamma2) * 1)
    set intention5 a * attitude5 + b * SN5 + c * PBC5


  ]

  ask persons with [region = 3] [
    let eco1 theta1 * ([fdi] of patch 75 50 - fdi) + theta2 * ([emprate] of patch 75 50 - emprate) + theta3 * ([wage-here] of patch 75 50 - wage-here)
    let ind1 lambda1 * agefactor + lambda2 * sexfactor + lambda3 * edufactor + lambda4 * empfactor
    set attitude1 (random-float alpha1) * eco1 + alpha2 * ind1
    set SN1 random-float beta * (count link-neighbors with [region = 1] / count link-neighbors)
    set PBC1 ((random-float gamma1) * (1 - exp(- saving1 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention1 a * attitude1 + b * SN1 + c * PBC1

    let eco2 theta1 * ([fdi] of patch -75 50 - fdi) + theta2 * ([emprate] of patch -75 50 - emprate) + theta3 * ([wage-here] of patch -75 50 - wage-here)
    set attitude2 (random-float alpha1) * eco2 + alpha2 * ind1
    set SN2 random-float beta * (count link-neighbors with [region = 2] / count link-neighbors)
    set PBC2 ((random-float gamma1) * (1 - exp(- saving2 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention2 a * attitude2 + b * SN2 + c * PBC2

    let eco3 0
    set attitude3 (random-float alpha1) * eco3 + alpha2 * ind1
    set SN3 random-float beta * (count link-neighbors with [region = 3] / count link-neighbors)
    set PBC3 ((random-float gamma1) * (1 - exp(- saving3 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention3 a * attitude3 + b * SN3 + c * PBC3

    let eco4 theta1 * ([fdi] of patch -25 50 - fdi) + theta2 * ([emprate] of patch -25 50 - emprate) + theta3 * ([wage-here] of patch -25 50 - wage-here)
    set attitude4 (random-float alpha1) * eco4 + alpha2 * ind1
    set SN4 random-float beta * (count link-neighbors with [region = 4] / count link-neighbors)
    set PBC4 ((random-float gamma1) * (1 - exp(- saving4 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention4 a * attitude4 + b * SN4 + c * PBC4

    let eco5 theta1 * ([fdi] of patch 25 50 - fdi) + theta2 * ([emprate] of patch 25 50 - emprate) + theta3 * ([wage-here] of patch 25 50 - wage-here)
    set attitude5 (random-float alpha1) * eco5 + alpha2 * ind1
    set SN5 random-float beta * (count link-neighbors with [region = 5] / count link-neighbors)
    set PBC5 ((random-float gamma1) * (1 - exp(- saving5 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention5 a * attitude5 + b * SN5 + c * PBC5


  ]

   ask persons with [region = 4] [
    let eco1 theta1 * ([fdi] of patch 75 50 - fdi) + theta2 * ([emprate] of patch 75 50 - emprate) + theta3 * ([wage-here] of patch 75 50 - wage-here)
    let ind1 lambda1 * agefactor + lambda2 * sexfactor + lambda3 * edufactor + lambda4 * empfactor
    set attitude1 (random-float alpha1) * eco1 + alpha2 * ind1
    set SN1 random-float beta * (count link-neighbors with [region = 1] / count link-neighbors)
    set PBC1 ((random-float gamma1) * (1 - exp(- saving1 / wealth ))) / (1 + (random-float gamma2) * 1)
    set intention1 a * attitude1 + b * SN1 + c * PBC1

    let eco2 theta1 * ([fdi] of patch -75 50 - fdi) + theta2 * ([emprate] of patch -75 50 - emprate) + theta3 * ([wage-here] of patch -75 50 - wage-here)
    set attitude2 (random-float alpha1) * eco2 + alpha2 * ind1
    set SN2 random-float beta * (count link-neighbors with [region = 2] / count link-neighbors)
    set PBC2 ((random-float gamma1) * (1 - exp(- saving2 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention2 a * attitude2 + b * SN2 + c * PBC2

    let eco3 theta1 * ([fdi] of patch 0 -50 - fdi) + theta2 * ([emprate] of patch 0 -50 - emprate) + theta3 * ([wage-here] of patch 0 -50 - wage-here)
    set attitude3 (random-float alpha1) * eco3 + alpha2 * ind1
    set SN3 random-float beta * (count link-neighbors with [region = 3] / count link-neighbors)
    set PBC3 ((random-float gamma1) * (1 - exp(- saving3 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention3 a * attitude3 + b * SN3 + c * PBC3

    let eco4 0
    set attitude4 (random-float alpha1) * eco4 + alpha2 * ind1
    set SN4 random-float beta * (count link-neighbors with [region = 4] / count link-neighbors)
    set PBC4 ((random-float gamma1) * (1 - exp(- saving4 / wealth ))) / (1 + (random-float gamma2) * 1)
    set intention4 a * attitude4 + b * SN4 + c * PBC4

    let eco5 theta1 * ([fdi] of patch 25 50 - fdi) + theta2 * ([emprate] of patch 25 50 - emprate) + theta3 * ([wage-here] of patch 25 50 - wage-here)
    set attitude5 (random-float alpha1) * eco5 + alpha2 * ind1
    set SN5 random-float beta * (count link-neighbors with [region = 5] / count link-neighbors)
    set PBC5 ((random-float gamma1) * (1 - exp(- saving5 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention5 a * attitude5 + b * SN5 + c * PBC5


  ]

   ask persons with [region = 5] [
    let eco1 theta1 * ([fdi] of patch 75 50 - fdi) + theta2 * ([emprate] of patch 75 50 - emprate) + theta3 * ([wage-here] of patch 75 50 - wage-here)
    let ind1 lambda1 * agefactor + lambda2 * sexfactor + lambda3 * edufactor + lambda4 * empfactor
    set attitude1 (random-float alpha1) * eco1 + alpha2 * ind1
    set SN1 random-float beta * (count link-neighbors with [region = 1] / count link-neighbors)
    set PBC1 ((random-float gamma1) * (1 - exp(- saving1 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention1 a * attitude1 + b * SN1 + c * PBC1

    let eco2 theta1 * ([fdi] of patch -75 50 - fdi) + theta2 * ([emprate] of patch -75 50 - emprate) + theta3 * ([wage-here] of patch -75 50 - wage-here)
    set attitude2 (random-float alpha1) * eco2 + alpha2 * ind1
    set SN2 random-float beta * (count link-neighbors with [region = 2] / count link-neighbors)
    set PBC2 ((random-float gamma1) * (1 - exp(- saving2 / wealth ))) / (1 + (random-float gamma2) * 1)
    set intention2 a * attitude2 + b * SN2 + c * PBC2

    let eco3 theta1 * ([fdi] of patch 0 -50 - fdi) + theta2 * ([emprate] of patch 0 -50 - emprate) + theta3 * ([wage-here] of patch 0 -50 - wage-here)
    set attitude3 (random-float alpha1) * eco3 + alpha2 * ind1
    set SN3 random-float beta * (count link-neighbors with [region = 3] / count link-neighbors)
    set PBC3 ((random-float gamma1) * (1 - exp(- saving3 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention3 a * attitude3 + b * SN3 + c * PBC3

    let eco4 theta1 * ([fdi] of patch -25 50 - fdi) + theta2 * ([emprate] of patch -25 50 - emprate) + theta3 * ([wage-here] of patch -25 50 - wage-here)
    set attitude4 (random-float alpha1) * eco4 + alpha2 * ind1
    set SN4 random-float beta * (count link-neighbors with [region = 4] / count link-neighbors)
    set PBC4 ((random-float gamma1) * (1 - exp(- saving4 / wealth ))) / (1 + (random-float gamma2) * 0)
    set intention4 a * attitude4 + b * SN4 + c * PBC4

    let eco5 0
    set attitude5 (random-float alpha1) * eco5 + alpha2 * ind1
    set SN5 random-float beta * (count link-neighbors with [region = 5] / count link-neighbors)
    set PBC5 ((random-float gamma1) * (1 - exp(- saving5 / wealth ))) / (1 + (random-float gamma2) * 1)
    set intention5 a * attitude5 + b * SN5 + c * PBC5


  ]
end


to make-decesions
  ask persons with [region = 1][
   let maxintention max (list intention1 intention2 intention3 intention4 intention5)
   let r random-float 1
    if r < maxintention [
      if maxintention = intention1 [move-to one-of patches with [region = 1]]
      if maxintention = intention2 [move-to one-of patches with [region = 2]
      set migrant 1
      set wealth wealth - [wage-here] of patch 75 50 - [consumption-here] of patch -75 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set monaflows monaflows + 1
      set premig 1]
      if maxintention = intention3 [move-to one-of patches with [region = 3]
      set migrant 1
      set wealth wealth - [wage-here] of patch 75 50 - [consumption-here] of patch 0 -50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set mosaflows mosaflows + 1
      set premig 1]
      if maxintention = intention4 [move-to one-of patches with [region = 4]
      set migrant 1
      set wealth wealth - [wage-here] of patch 75 50 - [consumption-here] of patch -25 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set mobotsflows mobotsflows + 1
      set premig 1]
      if maxintention = intention5 [move-to one-of patches with [region = 5]
      set migrant 1
      set wealth wealth - [wage-here] of patch 75 50 - [consumption-here] of patch 25 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set mozimflows mozimflows + 1
      set premig 1]
    ]

  ]


  ask persons with [region = 2][
   let maxintention max (list intention1 intention2 intention3 intention4 intention5)
   let r random-float 1
    if r < maxintention [
      if maxintention = intention1 [move-to one-of patches with [region = 1]
      set migrant 1
      set wealth wealth - [wage-here] of patch -75 50 - [consumption-here] of patch 75 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set namoflows namoflows + 1
      set premig 2]
      if maxintention = intention2 [move-to one-of patches with [region = 2]]
      if maxintention = intention3 [move-to one-of patches with [region = 3]
      set migrant 1
      set wealth wealth - [wage-here] of patch -75 50 - [consumption-here] of patch 0 -50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set nasaflows nasaflows + 1
      set premig 2]
      if maxintention = intention4 [move-to one-of patches with [region = 4]
      set migrant 1
      set wealth wealth - [wage-here] of patch -75 50 - [consumption-here] of patch -25 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set nabotsflows nabotsflows + 1
      set premig 2]
      if maxintention = intention5 [move-to one-of patches with [region = 5]
      set migrant 1
      set wealth wealth - [wage-here] of patch -75 50 - [consumption-here] of patch 25 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set nazimflows nazimflows + 1
      set premig 2]
    ]

  ]

  ask persons with [region = 3][
   let maxintention max (list intention1 intention2 intention3 intention4 intention5)
   let r random-float 1
    if r < maxintention [
      if maxintention = intention1 [move-to one-of patches with [region = 1]
      set migrant 1
      set wealth wealth - [wage-here] of patch 0 -50 - [consumption-here] of patch 75 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set samoflows samoflows + 1
      set premig 3]
      if maxintention = intention2 [move-to one-of patches with [region = 2]
      set migrant 1
      set wealth wealth - [wage-here] of patch 0 -50 - [consumption-here] of patch -75 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set sanaflows sanaflows + 1
      set premig 3]
      if maxintention = intention3 [move-to one-of patches with [region = 3]]
      if maxintention = intention4 [move-to one-of patches with [region = 4]
      set migrant 1
      set wealth wealth - [wage-here] of patch 0 -50 - [consumption-here] of patch -25 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set sabotsflows sabotsflows + 1
      set premig 3]
      if maxintention = intention5 [move-to one-of patches with [region = 5]
      set migrant 1
      set wealth wealth - [wage-here] of patch 0 -50 - [consumption-here] of patch 25 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set sazimflows sazimflows + 1
      set premig 3]
    ]

  ]

  ask persons with [region = 4][
   let maxintention max (list intention1 intention2 intention3 intention4 intention5)
   let r random-float 1
    if r < maxintention [
      if maxintention = intention1 [move-to one-of patches with [region = 1]
      set migrant 1
      set wealth wealth - [wage-here] of patch -25 50 - [consumption-here] of patch 75 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set botsmoflows botsmoflows + 1
      set premig 4]
      if maxintention = intention2 [move-to one-of patches with [region = 2]
      set migrant 1
      set wealth wealth - [wage-here] of patch -25 50 - [consumption-here] of patch -75 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set botsnaflows botsnaflows + 1
      set premig 4]
      if maxintention = intention3 [move-to one-of patches with [region = 3]
      set migrant 1
      set wealth wealth - [wage-here] of patch -25 50 - [consumption-here] of patch 0 -50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set botssaflows botssaflows + 1
      set premig 4]
      if maxintention = intention4 [move-to one-of patches with [region = 4]]
      if maxintention = intention5 [move-to one-of patches with [region = 5]
      set migrant 1
      set wealth wealth - [wage-here] of patch -25 50 - [consumption-here] of patch 25 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set botszimflows botszimflows + 1
      set premig 4]
    ]

  ]

  ask persons with [region = 5][
   let maxintention max (list intention1 intention2 intention3 intention4 intention5)
   let r random-float 1
    if r < maxintention [
      if maxintention = intention1 [move-to one-of patches with [region = 1]
      set migrant 1
      set wealth wealth - [wage-here] of patch 25 50 - [consumption-here] of patch 75 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set zimmoflows zimmoflows + 1
      set premig 5]
      if maxintention = intention2 [move-to one-of patches with [region = 2]
      set migrant 1
      set wealth wealth - [wage-here] of patch 25 50 - [consumption-here] of patch -75 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set zimnaflows zimnaflows + 1
      set premig 5]
      if maxintention = intention3 [move-to one-of patches with [region = 3]
      set migrant 1
      set wealth wealth - [wage-here] of patch 25 50 - [consumption-here] of patch 0 -50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set zimsaflows zimsaflows + 1
      set premig 5]
      if maxintention = intention4 [move-to one-of patches with [region = 4]
      set migrant 1
      set wealth wealth - [wage-here] of patch 25 50 - [consumption-here] of patch -25 50
      set move-list lput region move-list
      set time-list lput ticks time-list
      set zimbotsflows zimbotsflows + 1
      set premig 5]
      if maxintention = intention5 [move-to one-of patches with [region = 5]]
    ]

  ]
end

to summary
 set monarate monaflows / (monaflows + mosaflows + mobotsflows + mozimflows + count persons with [region = 1])
 set mosarate mosaflows / (monaflows + mosaflows + mobotsflows + mozimflows + count persons with [region = 1])
 set mobotsrate mobotsflows / (monaflows + mosaflows + mobotsflows + mozimflows + count persons with [region = 1])
 set mozimrate mozimflows / (monaflows + mosaflows + mobotsflows + mozimflows + count persons with [region = 1])
 set namorate namoflows / (namoflows + nasaflows + nabotsflows + nazimflows + count persons with [region = 2])
 set nasarate nasaflows / (namoflows + nasaflows + nabotsflows + nazimflows + count persons with [region = 2])
 set nabotsrate nabotsflows / (namoflows + nasaflows + nabotsflows + nazimflows + count persons with [region = 2])
 set nazimrate nazimflows / (namoflows + nasaflows + nabotsflows + nazimflows + count persons with [region = 2])
 set samorate samoflows / (samoflows + sanaflows + sabotsflows + sazimflows + count persons with [region = 3])
 set sanarate sanaflows / (samoflows + sanaflows + sabotsflows + sazimflows + count persons with [region = 3])
 set sabotsrate sabotsflows / (samoflows + sanaflows + sabotsflows + sazimflows + count persons with [region = 3])
 set sazimrate sazimflows / (samoflows + sanaflows + sabotsflows + sazimflows + count persons with [region = 3])
 set botsmorate botsmoflows / (botsmoflows + botsnaflows + botssaflows + botszimflows + count persons with [region = 4])
 set botsnarate botsnaflows / (botsmoflows + botsnaflows + botssaflows + botszimflows + count persons with [region = 4])
 set botssarate botssaflows / (botsmoflows + botsnaflows + botssaflows + botszimflows + count persons with [region = 4])
 set botszimrate botszimflows / (botsmoflows + botsnaflows + botssaflows + botszimflows + count persons with [region = 4])
 set zimmorate zimmoflows / (zimmoflows + zimnaflows + zimsaflows + zimbotsflows + count persons with [region = 5])
 set zimnarate zimnaflows / (zimmoflows + zimnaflows + zimsaflows + zimbotsflows + count persons with [region = 5])
 set zimsarate zimsaflows / (zimmoflows + zimnaflows + zimsaflows + zimbotsflows + count persons with [region = 5])
 set zimbotsrate zimbotsflows / (zimmoflows + zimnaflows + zimsaflows + zimbotsflows + count persons with [region = 5])

 set monastock count persons with [region = 2 and country = 1]
 set mosastock count persons with [region = 3 and country = 1]
 set mobotsstock count persons with [region = 4 and country = 1]
 set mozimstock count persons with [region = 5 and country = 1]
 set namostock count persons with [region = 1 and country = 2]
 set nasastock count persons with [region = 3 and country = 2]
 set nabotsstock count persons with [region = 4 and country = 2]
 set nazimstock  count persons with [region = 5 and country = 2]
 set samostock  count persons with [region = 1 and country = 3]
 set sanastock count persons with [region = 2 and country = 3]
 set sabotsstock count persons with [region = 4 and country = 3]
 set sazimstock count persons with [region = 5 and country = 3]
 set botsmostock count persons with [region = 1 and country = 4]
 set botsnastock count persons with [region = 2 and country = 4]
 set botssastock count persons with [region = 3 and country = 4]
 set botszimstock count persons with [region = 5 and country = 4]
 set zimmostock count persons with [region = 1 and country = 5]
 set zimnastock count persons with [region = 2 and country = 5]
 set zimsastock count persons with [region = 3 and country = 5]
 set zimbotsstock count persons with [region = 4 and country = 5]
end



to update-demographics
  aging
  create
  birth
  terminate
  gotoschool
  getjob
end


to aging
  ask persons [
  set age age + 1

  ]
end


to create

  let r random-float 1
  ask persons with [region = 1] [
  if sex = 0 and age >= 15 and age <= 60 [
      if r < fer [
        birth
      ]
  ]
]
  ask persons with [region = 2] [
  if sex = 0 and age >= 15 and age <= 60 [
      if r < fer [
        birth
      ]
  ]
]
  ask persons with [region = 3] [
  if sex = 0 and age >= 15 and age <= 60 [
      if r < fer [
        birth
      ]
  ]
]
  ask persons with [region = 4] [
  if sex = 0 and age >= 15 and age <= 60 [
      if r < fer [
        birth
      ]
  ]
]
  ask persons with [region = 5] [
  if sex = 0 and age >= 15 and age <= 60 [
      if r < fer [
        birth
      ]
  ]
]
end

to birth
  let r random-float 1
  hatch 1 [
    set age 0
    set edu 0
    set emp 0
    if r < 0.5 [set sex 0]
    if r >= 0.5 [set sex 1]
  ]
end

to terminate
  let r random-float 1
  ask persons with [region = 1] [
  if r < mor [
  die
  ]
  ]
  ask persons with [region = 2] [
  if r < mor [
  die
  ]
  ]
  ask persons with [region = 3] [
  if r < mor [
  die
  ]
  ]
  ask persons with [region = 4] [
  if r < mor [
  die
  ]
  ]
  ask persons with [region = 5] [
  if r < mor [
  die
  ]
  ]
end

to gotoschool
  let r random-float 1
ask persons with [region = 1 and age >= 18] [
  if r < eduT [
  set edu 7
  ]
  ]
  ask persons with [region = 2] [
  if r < eduT [
  set edu 7
  ]
  ]
  ask persons with [region = 3] [
  if r < eduT [
  set edu 7
  ]
  ]
  ask persons with [region = 4] [
  if r < eduT [
  set edu 7
  ]
  ]
  ask persons with [region = 5] [
  if r < eduT [
  set edu 7
  ]
  ]
end

to getjob
  let r random-float 1
ask persons with [region = 1 and age >= 15] [
  if r < emprate [
  set emp 1
  ]
  ]
  ask persons with [region = 2 and age >= 15] [
  if r < emprate [
  set emp 1
  ]
  ]
  ask persons with [region = 3 and age >= 15] [
  if r < emprate [
  set emp 1
  ]
  ]
  ask persons with [region = 4 and age >= 15] [
  if r < emprate [
  set emp 1
  ]
  ]
  ask persons with [region = 5 and age >= 15] [
  if r < emprate [
  set emp 1
  ]
  ]
end





@#$#@#$#@
GRAPHICS-WINDOW
1914
214
3732
2033
-1
-1
9.005
1
10
1
1
1
0
1
1
1
-100
100
-100
100
0
0
1
ticks
30.0

BUTTON
164
147
228
181
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

INPUTBOX
171
224
258
286
inimo
1.0
1
0
Number

INPUTBOX
177
315
271
375
inina
1.0
1
0
Number

INPUTBOX
178
398
268
458
inisa
1.0
1
0
Number

INPUTBOX
180
480
265
540
inibots
1.0
1
0
Number

INPUTBOX
187
567
267
627
inizim
1.0
1
0
Number

SLIDER
173
675
346
709
theta1
theta1
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
172
730
345
764
theta2
theta2
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
178
784
351
818
theta3
theta3
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
175
848
348
882
lambda1
lambda1
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
179
900
352
934
lambda2
lambda2
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
177
947
350
981
lambda3
lambda3
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
180
990
353
1024
lambda4
lambda4
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
393
682
566
716
alpha1
alpha1
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
398
738
571
772
alpha2
alpha2
0
1
50.0
0.000001
1
NIL
HORIZONTAL

SLIDER
403
792
576
826
beta
beta
0
1
50.0
0.000001
1
NIL
HORIZONTAL

SLIDER
409
852
582
886
gamma1
gamma1
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
405
905
578
939
gamma2
gamma2
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
403
958
576
992
gamma3
gamma3
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
629
684
802
718
a
a
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
629
742
802
776
b
b
0
1
1.0
0.000001
1
NIL
HORIZONTAL

SLIDER
630
802
803
836
c
c
0
1
50.0
0.000001
1
NIL
HORIZONTAL

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.4
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
