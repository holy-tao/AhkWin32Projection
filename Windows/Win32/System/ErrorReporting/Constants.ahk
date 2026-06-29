#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global WER_FAULT_REPORTING_NO_UI := 32

/**
 * @type {Integer (UInt32)}
 */
export global WER_FAULT_REPORTING_FLAG_NO_HEAP_ON_QUEUE := 64

/**
 * @type {Integer (UInt32)}
 */
export global WER_FAULT_REPORTING_DISABLE_SNAPSHOT_CRASH := 128

/**
 * @type {Integer (UInt32)}
 */
export global WER_FAULT_REPORTING_DISABLE_SNAPSHOT_HANG := 256

/**
 * @type {Integer (UInt32)}
 */
export global WER_FAULT_REPORTING_CRITICAL := 512

/**
 * @type {Integer (UInt32)}
 */
export global WER_FAULT_REPORTING_DURABLE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_TOTAL_PARAM_LENGTH := 1720

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_PREFERRED_MODULES := 128

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_PREFERRED_MODULES_BUFFER := 256

/**
 * @type {String}
 */
export global APPCRASH_EVENT := "APPCRASH"

/**
 * @type {String}
 */
export global PACKAGED_APPCRASH_EVENT := "MoAppCrash"

/**
 * @type {Integer (UInt32)}
 */
export global WER_P0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global WER_P1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WER_P2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WER_P3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global WER_P4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global WER_P5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global WER_P6 := 6

/**
 * @type {Integer (UInt32)}
 */
export global WER_P7 := 7

/**
 * @type {Integer (UInt32)}
 */
export global WER_P8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global WER_P9 := 9

/**
 * @type {Integer (UInt32)}
 */
export global WER_FILE_COMPRESSED := 4

/**
 * @type {Integer (UInt32)}
 */
export global WER_SUBMIT_BYPASS_POWER_THROTTLING := 16384

/**
 * @type {Integer (UInt32)}
 */
export global WER_SUBMIT_BYPASS_NETWORK_COST_THROTTLING := 32768

/**
 * @type {Integer (UInt32)}
 */
export global WER_DUMP_MASK_START := 1

/**
 * @type {Integer (UInt32)}
 */
export global WER_DUMP_NOHEAP_ONQUEUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WER_DUMP_AUXILIARY := 2

/**
 * @type {Integer (UInt32)}
 */
export global WER_DUMP_AUX_PROMOTE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_REGISTERED_ENTRIES := 512

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_REGISTERED_METADATA := 8

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_REGISTERED_DUMPCOLLECTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global WER_METADATA_KEY_MAX_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global WER_METADATA_VALUE_MAX_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_SIGNATURE_NAME_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_EVENT_NAME_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_PARAM_LENGTH := 260

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_PARAM_COUNT := 10

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_FRIENDLY_EVENT_NAME_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_APPLICATION_NAME_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_DESCRIPTION_LENGTH := 512

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_BUCKET_ID_STRING_LENGTH := 260

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_LOCAL_DUMP_SUBPATH_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global WER_MAX_REGISTERED_RUNTIME_EXCEPTION_MODULES := 16

/**
 * @type {String}
 */
export global WER_RUNTIME_EXCEPTION_EVENT_FUNCTION := "OutOfProcessExceptionEventCallback"

/**
 * @type {String}
 */
export global WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE_FUNCTION := "OutOfProcessExceptionEventSignatureCallback"

/**
 * @type {String}
 */
export global WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH := "OutOfProcessExceptionEventDebuggerLaunchCallback"
;@endregion Constants
