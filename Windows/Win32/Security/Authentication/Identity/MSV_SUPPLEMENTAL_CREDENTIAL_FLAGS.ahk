#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV_SUPPLEMENTAL_CREDENTIAL_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_LM_PRESENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_NT_PRESENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_VERSION => 0
}
