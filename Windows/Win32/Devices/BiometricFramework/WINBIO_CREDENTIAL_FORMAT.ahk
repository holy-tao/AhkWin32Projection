#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines flags that can be used to specify the end-user credential format.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-credential-format
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_CREDENTIAL_FORMAT extends Win32Enum {

    /**
     * Native name: WINBIO_PASSWORD_GENERIC
     * @type {Integer (Int32)}
     */
    static PASSWORD_GENERIC => 1

    /**
     * Native name: WINBIO_PASSWORD_PACKED
     * @type {Integer (Int32)}
     */
    static PASSWORD_PACKED => 2

    /**
     * Native name: WINBIO_PASSWORD_PROTECTED
     * @type {Integer (Int32)}
     */
    static PASSWORD_PROTECTED => 3
}
