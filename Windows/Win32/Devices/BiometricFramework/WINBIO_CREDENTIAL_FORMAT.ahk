#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flags that can be used to specify the end-user credential format.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-credential-format
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_CREDENTIAL_FORMAT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
