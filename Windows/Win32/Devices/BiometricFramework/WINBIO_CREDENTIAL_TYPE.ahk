#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-credential-type
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_CREDENTIAL_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_CREDENTIAL_PASSWORD => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_CREDENTIAL_ALL => -1
}
