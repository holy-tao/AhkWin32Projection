#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Restore
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MIN_EVENT := 100

/**
 * @type {Integer (UInt32)}
 */
export global BEGIN_NESTED_SYSTEM_CHANGE_NORP := 104

/**
 * @type {Integer (UInt32)}
 */
export global MAX_EVENT := 104

/**
 * @type {Integer (UInt32)}
 */
export global MIN_RPT := 0

/**
 * @type {Integer (UInt32)}
 */
export global DESKTOP_SETTING := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACCESSIBILITY_SETTING := 3

/**
 * @type {Integer (UInt32)}
 */
export global OE_SETTING := 4

/**
 * @type {Integer (UInt32)}
 */
export global APPLICATION_RUN := 5

/**
 * @type {Integer (UInt32)}
 */
export global RESTORE := 6

/**
 * @type {Integer (UInt32)}
 */
export global CHECKPOINT := 7

/**
 * @type {Integer (UInt32)}
 */
export global WINDOWS_SHUTDOWN := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINDOWS_BOOT := 9

/**
 * @type {Integer (UInt32)}
 */
export global FIRSTRUN := 11

/**
 * @type {Integer (UInt32)}
 */
export global BACKUP_RECOVERY := 14

/**
 * @type {Integer (UInt32)}
 */
export global BACKUP := 15

/**
 * @type {Integer (UInt32)}
 */
export global MANUAL_CHECKPOINT := 16

/**
 * @type {Integer (UInt32)}
 */
export global WINDOWS_UPDATE := 17

/**
 * @type {Integer (UInt32)}
 */
export global CRITICAL_UPDATE := 18

/**
 * @type {Integer (UInt32)}
 */
export global MAX_RPT := 18

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DESC := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DESC_W := 256
;@endregion Constants
