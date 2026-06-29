#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Time
 */

;@region Constants

/**
 * @type {String}
 */
export global wszW32TimeRegKeyTimeProviders := "System\CurrentControlSet\Services\W32Time\TimeProviders"

/**
 * @type {String}
 */
export global wszW32TimeRegKeyPolicyTimeProviders := "Software\Policies\Microsoft\W32Time\TimeProviders"

/**
 * @type {String}
 */
export global wszW32TimeRegValueEnabled := "Enabled"

/**
 * @type {String}
 */
export global wszW32TimeRegValueDllName := "DllName"

/**
 * @type {String}
 */
export global wszW32TimeRegValueInputProvider := "InputProvider"

/**
 * @type {String}
 */
export global wszW32TimeRegValueMetaDataProvider := "MetaDataProvider"

/**
 * @type {Integer (UInt32)}
 */
export global TSF_Hardware := 1

/**
 * @type {Integer (UInt32)}
 */
export global TSF_Authenticated := 2

/**
 * @type {Integer (UInt32)}
 */
export global TSF_IPv6 := 4

/**
 * @type {Integer (UInt32)}
 */
export global TSF_SignatureAuthenticated := 8

/**
 * @type {Integer (UInt32)}
 */
export global TIME_ZONE_ID_INVALID := 4294967295
;@endregion Constants
