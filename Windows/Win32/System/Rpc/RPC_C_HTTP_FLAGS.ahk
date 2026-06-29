#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_C_HTTP_FLAGS {
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
    static RPC_C_HTTP_FLAG_USE_SSL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_FLAG_USE_FIRST_AUTH_SCHEME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_FLAG_IGNORE_CERT_CN_INVALID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_FLAG_ENABLE_CERT_REVOCATION_CHECK => 16
}
