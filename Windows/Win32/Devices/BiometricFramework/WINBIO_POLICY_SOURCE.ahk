#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-policy-source
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_POLICY_SOURCE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_POLICY_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_POLICY_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_POLICY_LOCAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_POLICY_ADMIN => 3
}
