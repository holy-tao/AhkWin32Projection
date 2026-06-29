#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct RPC_C_AUTHN_LEVEL {
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
    static RPC_C_AUTHN_LEVEL_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_CONNECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_CALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_PKT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_PKT_INTEGRITY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_PKT_PRIVACY => 6
}
