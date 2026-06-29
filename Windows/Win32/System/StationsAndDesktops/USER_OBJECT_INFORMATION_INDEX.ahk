#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 */
export default struct USER_OBJECT_INFORMATION_INDEX {
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
    static UOI_FLAGS => 1

    /**
     * @type {Integer (Int32)}
     */
    static UOI_HEAPSIZE => 5

    /**
     * @type {Integer (Int32)}
     */
    static UOI_IO => 6

    /**
     * @type {Integer (Int32)}
     */
    static UOI_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static UOI_TYPE => 3

    /**
     * @type {Integer (Int32)}
     */
    static UOI_USER_SID => 4
}
