#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines flags that can be used to filter on the credential type.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-credential-type
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_CREDENTIAL_TYPE extends Win32Enum {

    /**
     * Native name: WINBIO_CREDENTIAL_PASSWORD
     * @type {Integer (Int32)}
     */
    static PASSWORD => 1

    /**
     * Native name: WINBIO_CREDENTIAL_ALL
     * @type {Integer (Int32)}
     */
    static ALL => -1
}
