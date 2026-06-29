#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct EATTRIBUTE_DATATYPE {
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
    static kADT_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static kADT_BOOL => 1

    /**
     * @type {Integer (Int32)}
     */
    static kADT_INT => 2

    /**
     * @type {Integer (Int32)}
     */
    static kADT_LONG => 3

    /**
     * @type {Integer (Int32)}
     */
    static kADT_DWORD => 4

    /**
     * @type {Integer (Int32)}
     */
    static kADT_ASCII => 5

    /**
     * @type {Integer (Int32)}
     */
    static kADT_UNICODE => 6

    /**
     * @type {Integer (Int32)}
     */
    static kADT_BINARY => 7

    /**
     * @type {Integer (Int32)}
     */
    static kADT_SIZE => 8

    /**
     * @type {Integer (Int32)}
     */
    static kADT_RECT => 9

    /**
     * @type {Integer (Int32)}
     */
    static kADT_CUSTOMSIZEPARAMS => 10
}
