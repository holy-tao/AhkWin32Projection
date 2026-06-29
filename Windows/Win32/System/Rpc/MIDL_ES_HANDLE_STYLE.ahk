#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_ES_HANDLE_STYLE {
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
    static MES_INCREMENTAL_HANDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MES_FIXED_BUFFER_HANDLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MES_DYNAMIC_BUFFER_HANDLE => 2
}
