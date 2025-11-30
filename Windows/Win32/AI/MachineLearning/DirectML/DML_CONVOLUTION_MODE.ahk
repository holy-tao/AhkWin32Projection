#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a mode for the DirectML convolution operator (as described by the DML_CONVOLUTION_OPERATOR_DESC structure).
 * @see https://docs.microsoft.com/windows/win32/api//directml/ne-directml-dml_convolution_mode
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_CONVOLUTION_MODE extends Win32Enum{

    /**
     * Specifies the convolution mode.
     * @type {Integer (Int32)}
     */
    static DML_CONVOLUTION_MODE_CONVOLUTION => 0

    /**
     * Specifies the cross-correlation mode. If in doubt, use this mode—it is appropriate for the vast majority of machine learning (ML) models.
     * @type {Integer (Int32)}
     */
    static DML_CONVOLUTION_MODE_CROSS_CORRELATION => 1
}
