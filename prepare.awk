#! /usr/bin/awk -f

#BBEGIN{ FS="\\";devId1=0;devId2=0;phase_in_1;phase_in_2,genuine,score_ }
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

	 #print "$4 is : ",$4 ;
	 #print "$9 is : ",$9 ;
	 #print "$3 is : "$3 ;
	 #print "$8 is : "$8 ;
	if( $3=="Phase1" && $8=="Phase2" ) {
	 #print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_lum > "tada_lum.txt" ;

	 #print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_sec > "tada_sec.txt" ;
		if( $4 == "Fut" && $9 == "Fut" ) {
			#print "FUT FUT" ;
			print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_lum  >> "FF_standard_lum.txt" ;
			print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_sec		>> "FF_standard_sec.txt" ;

		}
		if( $4 == "Fut" && $9 == "Lum" ) {
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_lum	>> "FL_standard_lum.txt" ;
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_sec	>> "FL_standard_sec.txt" ;
		}
		if( $4 == "Fut" && $9 == "Sec" ) {
				#print "FUT SEC HERE" ;
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_lum	>> "FS_standard_lum.txt" ;
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_sec	>> "FS_standard_sec.txt" ;

		}
		if( $4 == "Lum" && $9 == "Fut" ) {
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_lum	>> "LF_standard_lum.txt" ;
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_sec	>> "LF_standard_sec.txt" ;

		}
	
		if( $4 == "Lum" && $9 == "Lum" ) {

				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_lum	>> "LL_standard_lum.txt" ;
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_sec	>> "LL_standard_sec.txt" ;
		}

		if( $4 == "Lum" && $9 == "Sec" ) {

				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_lum	>> "LS_standard_lum.txt" ;
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_sec	>> "LS_standard_sec.txt" ;
		}
		if( $4 == "Sec" && $9 == "Fut" ) {

				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_lum	>> "SF_standard_lum.txt" ;
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_sec	>> "SF_standard_sec.txt" ;
		}
		if( $4 == "Sec" && $9 == "Lum" ) {

				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_lum	>> "SL_standard_lum.txt" ;
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_sec	>> "SL_standard_sec.txt" ;
		}
		if( $4 == "Sec" && $9 == "Sec" ) {

				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_lum	>> "SS_standard_lum.txt" ;
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_sec	>> "SS_standard_sec.txt" ;
		}
	}
	}
END{}
