#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.EventCollector
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global EC_VARIANT_TYPE_MASK := 127

/**
 * @type {Integer (UInt32)}
 */
export global EC_VARIANT_TYPE_ARRAY := 128

/**
 * @type {Integer (UInt32)}
 */
export global EC_READ_ACCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global EC_WRITE_ACCESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global EC_OPEN_ALWAYS := 0

/**
 * @type {Integer (UInt32)}
 */
export global EC_CREATE_NEW := 1

/**
 * @type {Integer (UInt32)}
 */
export global EC_OPEN_EXISTING := 2
;@endregion Constants
