#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ROUNDING_MODE {
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
    static DML_ROUNDING_MODE_HALVES_TO_NEAREST_EVEN => 0

    /**
     * @type {Integer (Int32)}
     */
    static DML_ROUNDING_MODE_TOWARD_ZERO => 1

    /**
     * @type {Integer (Int32)}
     */
    static DML_ROUNDING_MODE_TOWARD_INFINITY => 2
}
