#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies a type of tensor description.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_tensor_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_TENSOR_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates an unknown tensor description type. This value is never valid.
     * @type {Integer (Int32)}
     */
    static DML_TENSOR_TYPE_INVALID => 0

    /**
     * Indicates a tensor description that is represented by a Direct3D 12 buffer. The corresponding struct type is [DML_BUFFER_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_buffer_tensor_desc).
     * @type {Integer (Int32)}
     */
    static DML_TENSOR_TYPE_BUFFER => 1
}
