#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify a direction for the DirectML convolution operator (as described by the DML_CONVOLUTION_OPERATOR_DESC structure).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_convolution_direction
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_CONVOLUTION_DIRECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates a forward convolution.
     * @type {Integer (Int32)}
     */
    static DML_CONVOLUTION_DIRECTION_FORWARD => 0

    /**
     * Indicates a backward convolution. Backward convolution is also known as <em>transposed</em> convolution.
     * @type {Integer (Int32)}
     */
    static DML_CONVOLUTION_DIRECTION_BACKWARD => 1
}
