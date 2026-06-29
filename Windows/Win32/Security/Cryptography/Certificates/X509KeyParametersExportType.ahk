#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct X509KeyParametersExportType {
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
    static XCN_CRYPT_OID_USE_CURVE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_OID_USE_CURVE_NAME_FOR_ENCODE_FLAG => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_OID_USE_CURVE_PARAMETERS_FOR_ENCODE_FLAG => 268435456
}
