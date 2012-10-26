#! /usr/bin/awk -f

BEGIN{ FS="\\";devId1=0;devId2=0;phase_in_1=0;phase_in_2=0;is_genuine=5;user_id1="";user_id2=""; }
	{ if ($3=="Phase1"){ phase_in_1=1} else { phase_in_1=2; } 
	 if ($4=="Fut"){ devId1=1 ;} if($4=="Lum") { devId1=2; } if($4=="Sec") { devId1=3;} 
	 if ($9=="Fut"){ devId2=1 ;} if($9=="Lum") { devId2=2;} if($9=="Sec") { devId2=3; } 
	 if ($8=="Phase2"){ phase_in_2=2} else { phase_in_2=1; } 
	 if ($5==$10) { is_genuine=1 } else { is_genuine=0 } user_id1=$5 ;
	 user_id2=$10 ;
	 score=$11 ;
	 split( score,array," " ) ;
	 score_lum = array[1] ;
	 score_sec = array[2] ;
	
	if( $3=="Phase1" && $8=="Phase2" ) {
	 print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_lum >> "500_lum_scores.txt" ;

	 print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_sec  >> "500_sec_scores.txt" ;
	}

	}
END{}
