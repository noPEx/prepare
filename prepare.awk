#! /usr/bin/awk -f

BEGIN{ FS="\/";devId1=0;devId2=0;phase_in_1=0;phase_in_2=0;is_genuine=5;user_id1="";user_id2=""; }
	{ if ($1=="Phase1"){ phase_in_1=1} else { phase_in_1=2; } 
	#print "en is : "$0
	id_plus_phase_info_1 = $3 ;
	#print "i_p_p_i is : "id_plus_phase_info_1 ;
	split( id_plus_phase_info_1,array1," " ) ;
	#print "arr0 is : "array1[1] ;
	#print "array2 is : "array1[2] ;
	sub( /\.xyt/,"",array1[1] ) ;# array[1] now holds the id1
	#print "arr1 after sub is : ",array1[1] ;
	#print "arr2 is : "array1[2] ;
	user_id1 = array1[1] ;
	phase1=$1 ;
	phase2=array1[2] ;

	id_plus_phase_info_2 = $5
	split( id_plus_phase_info_2,array2," " ) ;
	sub( /\.xyt/,"",array2[1]) ;
	user_id2 = array2[1] ;
	score_nist=array2[2] ;
	#print "user_id2 is : "user_id2 ;
	#print "score is : "score;



	 if ($2=="Fut"){ devId1=1 ;} if($2=="lum") { devId1=2; } if($2=="Sec") { devId1=3;} 
	 if ($4=="Fut"){ devId2=1 ;} if($4=="lum") { devId2=2;} if($4=="Sec") { devId2=3; } 
	 if (user_id1==user_id2) { is_genuine=1 } else { is_genuine=0 } 


	if( phase1=="Phase1" && phase2=="Phase2" ) {
			print "devId1 is : ",devId1 ;
			print "devId2 is : ",devId2 ;
		if( $2 == "Fut" && $4 == "Fut" ) {
			#print "FUT FUT" ;
			print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_nist  >> "FF_standard_nist.txt" ;

		}
		if( $2 == "Fut" && $4 == "nist" ) {
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_nist	>> "FL_standard_nist.txt" ;
		}
		if( $2 == "Fut" && $4 == "Sec" ) {
				#print "FUT SEC HERE" ;
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_nist	>> "FS_standard_nist.txt" ;

		}
		if( $2 == "nist" && $4 == "Fut" ) {
				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_nist	>> "LF_standard_nist.txt" ;

		}
	
		if( $2 == "nist" && $4 == "nist" ) {

				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_nist	>> "LL_standard_nist.txt" ;
		}

		if( $2 == "nist" && $4 == "Sec" ) {

				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_nist	>> "LS_standard_nist.txt" ;
		}
		if( $2 == "Sec" && $4 == "Fut" ) {

				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_nist	>> "SF_standard_nist.txt" ;
		}
		if( $2 == "Sec" && $4 == "nist" ) {

				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_nist	>> "SL_standard_nist.txt" ;
		}
		if( $2 == "Sec" && $4 == "Sec" ) {

				print user_id1" "phase_in_1""devId1" "user_id2" "phase_in_2""devId2" "is_genuine" "score_nist	>> "SS_standard_nist.txt" ;
		}
	}
	}
END{}
