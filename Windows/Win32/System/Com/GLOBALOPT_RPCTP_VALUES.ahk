#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct GLOBALOPT_RPCTP_VALUES {
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
    static COMGLB_RPC_THREADPOOL_SETTING_DEFAULT_POOL => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_RPC_THREADPOOL_SETTING_PRIVATE_POOL => 1
}
