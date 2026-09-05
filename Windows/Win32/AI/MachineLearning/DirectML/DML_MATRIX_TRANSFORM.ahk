#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a matrix transform to be applied to a DirectML tensor.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_matrix_transform
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
class DML_MATRIX_TRANSFORM extends Win32Enum {

    /**
     * Specifies that no transform is to be applied.
     * Native name: DML_MATRIX_TRANSFORM_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Specifies that a transpose transform is to be applied.
     * Native name: DML_MATRIX_TRANSFORM_TRANSPOSE
     * @type {Integer (Int32)}
     */
    static TRANSPOSE => 1
}
