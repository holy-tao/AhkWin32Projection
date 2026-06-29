#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify the direction of an operation along the given axis for the operator (for example, summation, selecting the top-k elements, selecting the minimum element).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_axis_direction
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_AXIS_DIRECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies increasing order (from the low index to the high index).
     * @type {Integer (Int32)}
     */
    static DML_AXIS_DIRECTION_INCREASING => 0

    /**
     * Specifies decreasing order (from the high index to the low index).
     * @type {Integer (Int32)}
     */
    static DML_AXIS_DIRECTION_DECREASING => 1
}
