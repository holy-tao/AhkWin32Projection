#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_ES_CODE {
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
    static MES_ENCODE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MES_DECODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MES_ENCODE_NDR64 => 2
}
