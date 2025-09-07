#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags that can be used to specify the end-user credential format.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-credential-format
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_CREDENTIAL_FORMAT{

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_PASSWORD_GENERIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_PASSWORD_PACKED => 2

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_PASSWORD_PROTECTED => 3
}
