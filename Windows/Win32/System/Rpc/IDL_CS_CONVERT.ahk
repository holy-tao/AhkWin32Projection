#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct IDL_CS_CONVERT {
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
    static IDL_CS_NO_CONVERT => 0

    /**
     * @type {Integer (Int32)}
     */
    static IDL_CS_IN_PLACE_CONVERT => 1

    /**
     * @type {Integer (Int32)}
     */
    static IDL_CS_NEW_BUFFER_CONVERT => 2
}
