#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct OSPXFER {
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
    static OSPXFER_COMPLETE => 0

    /**
     * @type {Integer (Int32)}
     */
    static OSPXFER_ABORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPXFER_ERROR => 2
}
