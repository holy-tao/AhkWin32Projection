#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_IS_INFINITY_MODE {
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
    static DML_IS_INFINITY_MODE_EITHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static DML_IS_INFINITY_MODE_POSITIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DML_IS_INFINITY_MODE_NEGATIVE => 2
}
