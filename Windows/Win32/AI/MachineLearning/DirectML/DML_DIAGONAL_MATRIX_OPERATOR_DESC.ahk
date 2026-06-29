#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Generates an identity-like matrix with ones (or other explicit value) on the major diagonal, and zeros everywhere else.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_diagonal_matrix_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_DIAGONAL_MATRIX_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The dimensions are `{ Batch1, Batch2, OutputHeight, OutputWidth }`. The height and width don't need to be square.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **[INT](/windows/desktop/winprog/windows-data-types)**
     * 
     * An offset to shift the diagonal lines of *Value*, with positive offsets shifting the written value to the right/up (viewing the output as a matrix with the top left as 0,0), and negative offsets to the left/down.
     */
    Offset : Int32

    /**
     * Type: **[FLOAT](/windows/desktop/winprog/windows-data-types)**
     * 
     * A value to fill along the 2D diagonal. The standard value is 1.0. Note that if the *DataType* of the tensors is not [DML_TENSOR_DATA_TYPE_FLOAT16](/windows/win32/api/directml/ne-directml-dml_tensor_data_type) or **DML_TENSOR_DATA_TYPE_FLOAT32**, then the value might be truncated (for example, 10.6 will become 10).
     */
    Value : Float32

}
