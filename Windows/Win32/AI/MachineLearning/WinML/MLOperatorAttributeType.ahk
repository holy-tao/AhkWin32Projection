#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorAttributeType {
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
    static Win32Float => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Int => 3

    /**
     * @type {Integer (UInt32)}
     */
    static Win32String => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FloatArray => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IntArray => 8

    /**
     * @type {Integer (UInt32)}
     */
    static StringArray => 9
}
