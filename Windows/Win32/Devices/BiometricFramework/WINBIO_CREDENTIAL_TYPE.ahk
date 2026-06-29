#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flags that can be used to filter on the credential type.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-credential-type
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_CREDENTIAL_TYPE {
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
    static WINBIO_CREDENTIAL_PASSWORD => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_CREDENTIAL_ALL => -1
}
