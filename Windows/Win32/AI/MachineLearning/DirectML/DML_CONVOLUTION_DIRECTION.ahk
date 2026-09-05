#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a direction for the DirectML convolution operator (as described by the DML_CONVOLUTION_OPERATOR_DESC structure).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_convolution_direction
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
class DML_CONVOLUTION_DIRECTION extends Win32Enum {

    /**
     * Indicates a forward convolution.
     * Native name: DML_CONVOLUTION_DIRECTION_FORWARD
     * @type {Integer (Int32)}
     */
    static FORWARD => 0

    /**
     * Indicates a backward convolution. Backward convolution is also known as <em>transposed</em> convolution.
     * Native name: DML_CONVOLUTION_DIRECTION_BACKWARD
     * @type {Integer (Int32)}
     */
    static BACKWARD => 1
}
