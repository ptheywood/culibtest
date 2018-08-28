#define BOOST_TEST_MODULE "All Unit Tests for cudalibtest"

// Suppress some warnings generated on windows by including boost in a NVCC compiled file.
#if defined(__NVCC__)
	#pragma diag_suppress integer_sign_change 
	#pragma diag_suppress integer_sign_change 
	#pragma diag_suppress integer_truncated 
	#pragma diag_suppress code_is_unreachable 
	#pragma diag_suppress partial_override 
	#pragma diag_suppress expr_has_no_effect 
	#pragma diag_suppress set_but_not_used 
#endif


#include <boost/test/included/unit_test.hpp>

#include "test_SomeClass.h"