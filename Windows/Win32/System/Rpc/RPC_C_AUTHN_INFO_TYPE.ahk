#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_C_AUTHN_INFO_TYPE {
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
    static RPC_C_AUTHN_INFO_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_INFO_TYPE_HTTP => 1
}
