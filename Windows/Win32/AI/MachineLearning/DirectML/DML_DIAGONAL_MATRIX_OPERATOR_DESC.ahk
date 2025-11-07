#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Generates an identity-like matrix with ones (or other explicit value) on the major diagonal, and zeros everywhere else.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_diagonal_matrix_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_DIAGONAL_MATRIX_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The dimensions are `{ Batch1, Batch2, OutputHeight, OutputWidth }`. The height and width don't need to be square.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **[INT](/windows/desktop/winprog/windows-data-types)**
     * 
     * An offset to shift the diagonal lines of *Value*, with positive offsets shifting the written value to the right/up (viewing the output as a matrix with the top left as 0,0), and negative offsets to the left/down.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: **[FLOAT](/windows/desktop/winprog/windows-data-types)**
     * 
     * A value to fill along the 2D diagonal. The standard value is 1.0. Note that if the *DataType* of the tensors is not [DML_TENSOR_DATA_TYPE_FLOAT16](/windows/win32/api/directml/ne-directml-dml_tensor_data_type) or **DML_TENSOR_DATA_TYPE_FLOAT32**, then the value might be truncated (for example, 10.6 will become 10).
     * @type {Float}
     */
    Value {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
