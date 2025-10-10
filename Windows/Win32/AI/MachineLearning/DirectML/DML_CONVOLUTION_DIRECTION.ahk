#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify a direction for the DirectML convolution operator (as described by the DML_CONVOLUTION_OPERATOR_DESC structure).
 * @see https://docs.microsoft.com/windows/win32/api//directml/ne-directml-dml_convolution_direction
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_CONVOLUTION_DIRECTION{

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
