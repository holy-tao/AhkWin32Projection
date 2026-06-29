#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct PROXY_PHASE {
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
    static PROXY_CALCSIZE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PROXY_GETBUFFER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROXY_MARSHAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROXY_SENDRECEIVE => 3

    /**
     * @type {Integer (Int32)}
     */
    static PROXY_UNMARSHAL => 4
}
