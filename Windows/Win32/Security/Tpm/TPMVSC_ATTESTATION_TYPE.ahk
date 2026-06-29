#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Tpm
 */
export default struct TPMVSC_ATTESTATION_TYPE {
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
    static TPMVSC_ATTESTATION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TPMVSC_ATTESTATION_AIK_ONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static TPMVSC_ATTESTATION_AIK_AND_CERTIFICATE => 2
}
