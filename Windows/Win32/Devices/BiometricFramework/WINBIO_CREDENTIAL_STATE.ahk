#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that specify whether a credential has been associated with the biometric data for an end user.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-credential-state
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_CREDENTIAL_STATE {
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
    static WINBIO_CREDENTIAL_NOT_SET => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_CREDENTIAL_SET => 2
}
