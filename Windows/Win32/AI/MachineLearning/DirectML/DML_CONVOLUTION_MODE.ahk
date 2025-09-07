#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify a mode for the DirectML convolution operator (as described by the DML_CONVOLUTION_OPERATOR_DESC structure).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_convolution_mode
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_CONVOLUTION_MODE{

    /**
     * Specifies the convolution mode. When used along with [DML_CONVOLUTION_DIRECTION_FORWARD](/windows/win32/api/directml/ne-directml-dml_convolution_direction), this flips the filter along the height and width axes.
     * @type {Integer (Int32)}
     */
    static DML_CONVOLUTION_MODE_CONVOLUTION => 0

    /**
     * Specifies the cross-correlation mode. If in doubt, use this mode&mdash;it is appropriate for the vast majority of machine learning (ML) model inference. When used along with [DML_CONVOLUTION_DIRECTION_BACKWARD](/windows/win32/api/directml/ne-directml-dml_convolution_direction), this flips the filter along the height and width axes.
     * @type {Integer (Int32)}
     */
    static DML_CONVOLUTION_MODE_CROSS_CORRELATION => 1
}
