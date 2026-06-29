#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorErrorIfEmitOutOfOrder {
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
    static MDErrorOutOfOrderDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDErrorOutOfOrderNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDErrorOutOfOrderAll => -1

    /**
     * @type {Integer (Int32)}
     */
    static MDMethodOutOfOrder => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDFieldOutOfOrder => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDParamOutOfOrder => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPropertyOutOfOrder => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDEventOutOfOrder => 16
}
