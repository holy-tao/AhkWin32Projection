#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorExecutionType {
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
    static Cpu => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12 => 2
}
