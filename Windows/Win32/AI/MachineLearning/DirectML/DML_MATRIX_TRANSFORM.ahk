#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify a matrix transform to be applied to a DirectML tensor.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_matrix_transform
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_MATRIX_TRANSFORM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies that no transform is to be applied.
     * @type {Integer (Int32)}
     */
    static DML_MATRIX_TRANSFORM_NONE => 0

    /**
     * Specifies that a transpose transform is to be applied.
     * @type {Integer (Int32)}
     */
    static DML_MATRIX_TRANSFORM_TRANSPOSE => 1
}
