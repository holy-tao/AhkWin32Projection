#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_C_QOS_CAPABILITIES {
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
    static RPC_C_QOS_CAPABILITIES_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_MUTUAL_AUTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_MAKE_FULLSIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_ANY_AUTHORITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_IGNORE_DELEGATE_FAILURE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_LOCAL_MA_HINT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_SCHANNEL_FULL_AUTH_IDENTITY => 32
}
