#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determine whether the Windows Biometric Framework is currently enabled.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-setting-source-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_SETTING_SOURCE extends Win32Enum {

    /**
     * Native name: WINBIO_SETTING_SOURCE_INVALID
     * @type {Integer (UInt32)}
     */
    static INVALID => 0

    /**
     * Native name: WINBIO_SETTING_SOURCE_DEFAULT
     * @type {Integer (UInt32)}
     */
    static DEFAULT => 1

    /**
     * Native name: WINBIO_SETTING_SOURCE_LOCAL
     * @type {Integer (UInt32)}
     */
    static LOCAL => 3

    /**
     * Native name: WINBIO_SETTING_SOURCE_POLICY
     * @type {Integer (UInt32)}
     */
    static POLICY => 2
}
