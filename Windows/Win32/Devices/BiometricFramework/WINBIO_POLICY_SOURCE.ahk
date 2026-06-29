#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Lists the possible sources of policy information for the detection of spoofing for biometric factors.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-policy-source
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_POLICY_SOURCE {
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
