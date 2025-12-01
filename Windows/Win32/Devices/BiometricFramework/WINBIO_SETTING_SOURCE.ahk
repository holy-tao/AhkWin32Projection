#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determine whether the Windows Biometric Framework is currently enabled.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-setting-source-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_SETTING_SOURCE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SETTING_SOURCE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SETTING_SOURCE_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SETTING_SOURCE_LOCAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SETTING_SOURCE_POLICY => 2
}
