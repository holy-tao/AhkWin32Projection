#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_BINDING_HANDLE_OPTIONS_FLAGS {
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
    static RPC_BHO_NONCAUSAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_BHO_DONTLINGER => 2
}
