#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Security.DirectoryServices
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global DSSI_READ_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSSI_NO_ACCESS_CHECK := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSSI_NO_EDIT_SACL := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSSI_NO_EDIT_OWNER := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSSI_IS_ROOT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DSSI_NO_FILTER := 32

/**
 * @type {Integer (UInt32)}
 */
export global DSSI_NO_READONLY_MESSAGE := 64
;@endregion Constants
