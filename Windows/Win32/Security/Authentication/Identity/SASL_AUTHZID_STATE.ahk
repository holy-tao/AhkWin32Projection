#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SASL_AUTHZID_STATE {
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
    static Sasl_AuthZIDForbidden => 0

    /**
     * @type {Integer (Int32)}
     */
    static Sasl_AuthZIDProcessed => 1
}
