#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WAIT_CHAIN_THREAD_OPTIONS {
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
    static WCT_OUT_OF_PROC_COM_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCT_OUT_OF_PROC_CS_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCT_OUT_OF_PROC_FLAG => 1
}
