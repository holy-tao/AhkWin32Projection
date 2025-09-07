#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies a type of tensor description.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_tensor_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_TENSOR_TYPE{

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
