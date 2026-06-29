#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct PROPBAG2_TYPE {
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
    static PROPBAG2_TYPE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static PROPBAG2_TYPE_DATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROPBAG2_TYPE_URL => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROPBAG2_TYPE_OBJECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static PROPBAG2_TYPE_STREAM => 4

    /**
     * @type {Integer (Int32)}
     */
    static PROPBAG2_TYPE_STORAGE => 5

    /**
     * @type {Integer (Int32)}
     */
    static PROPBAG2_TYPE_MONIKER => 6
}
