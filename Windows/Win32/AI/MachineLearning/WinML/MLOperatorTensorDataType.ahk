#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorTensorDataType {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static Undefined => 0

    /**
     * @type {Integer (UInt32)}
     */
    static Win32Float => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UInt8 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Int8 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static UInt16 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static Int16 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static Int32 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static Int64 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static Win32String => 8

    /**
     * @type {Integer (UInt32)}
     */
    static Bool => 9

    /**
     * @type {Integer (UInt32)}
     */
    static Float16 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static Double => 11

    /**
     * @type {Integer (UInt32)}
     */
    static UInt32 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static UInt64 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static Complex64 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static Complex128 => 15
}
