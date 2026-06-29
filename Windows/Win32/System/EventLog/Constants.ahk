#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.EventLog
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global EVT_VARIANT_TYPE_MASK := 127

/**
 * @type {Integer (UInt32)}
 */
export global EVT_VARIANT_TYPE_ARRAY := 128

/**
 * @type {Integer (UInt32)}
 */
export global EVT_READ_ACCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVT_WRITE_ACCESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVT_CLEAR_ACCESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global EVT_ALL_ACCESS := 7
;@endregion Constants
