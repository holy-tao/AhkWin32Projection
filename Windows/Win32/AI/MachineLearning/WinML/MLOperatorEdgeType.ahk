#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorEdgeType {
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
    static Tensor => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SequenceTensor => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Win32Primitive => 3
}
