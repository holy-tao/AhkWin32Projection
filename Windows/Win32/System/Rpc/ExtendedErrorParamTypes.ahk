#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct ExtendedErrorParamTypes {
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
    static eeptAnsiString => 1

    /**
     * @type {Integer (Int32)}
     */
    static eeptUnicodeString => 2

    /**
     * @type {Integer (Int32)}
     */
    static eeptLongVal => 3

    /**
     * @type {Integer (Int32)}
     */
    static eeptShortVal => 4

    /**
     * @type {Integer (Int32)}
     */
    static eeptPointerVal => 5

    /**
     * @type {Integer (Int32)}
     */
    static eeptNone => 6

    /**
     * @type {Integer (Int32)}
     */
    static eeptBinary => 7
}
