#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLE_TRISTATE {
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
    static triUnchecked => 0

    /**
     * @type {Integer (Int32)}
     */
    static triChecked => 1

    /**
     * @type {Integer (Int32)}
     */
    static triGray => 2
}
