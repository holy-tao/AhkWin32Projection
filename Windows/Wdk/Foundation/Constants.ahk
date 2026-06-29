#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global NTSTRSAFE_UNICODE_STRING_MAX_CCH := 32767

/**
 * @type {Integer (UInt32)}
 */
export global NTSTRSAFE_USE_SECURE_CRT := 0

/**
 * @type {Integer (UInt32)}
 */
export global NTSTRSAFE_MAX_CCH := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global NTSTRSAFE_MAX_LENGTH := 2147483646

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_IGNORE_NULLS := 256

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_FILL_BEHIND_NULL := 512

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_FILL_ON_FAILURE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_NULL_ON_FAILURE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_NO_TRUNCATION := 4096

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_FILL_BEHIND := 512

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_ZERO_LENGTH_ON_FAILURE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_CYCLOMATIC_COMPLEXITY := 28734

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_USING_UNINIT_VAR := 6001

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_RETURN_UNINIT_VAR := 6101

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_DEREF_NULL_PTR := 6011

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_MISSING_ZERO_TERMINATION2 := 6054

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_INVALID_PARAM_VALUE_1 := 6387

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_INCORRECT_ANNOTATION := 26007

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_POTENTIAL_BUFFER_OVERFLOW_HIGH_PRIORITY := 26015

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_PRECONDITION_NULLTERMINATION_VIOLATION := 26035

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_POSTCONDITION_NULLTERMINATION_VIOLATION := 26036

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_HIGH_PRIORITY_OVERFLOW_POSTCONDITION := 26045

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_RANGE_POSTCONDITION_VIOLATION := 26061

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_POTENTIAL_RANGE_POSTCONDITION_VIOLATION := 26071

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_INVALID_PARAM_VALUE_3 := 28183

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_RETURNING_BAD_RESULT := 28196

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_BANNED_API_USAGE := 28719

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_POST_EXPECTED := 28210
;@endregion Constants
