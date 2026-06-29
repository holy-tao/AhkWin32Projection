#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Performs a matrix multiplication function on integer data.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_matrix_multiply_integer_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_MATRIX_MULTIPLY_INTEGER_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the A data. This tensor's dimensions should be `{ BatchCount, ChannelCount, M, K }`.
     */
    ATensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: _Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the ATensor zero point data. The expected dimensions of the `AZeroPointTensor` are `{ 1, 1, 1, 1 }` if per tensor quantization is required, or `{ 1, 1, M, 1 }` if per-row quantization is required. These zero point values are used for dequantizing the *ATensor* values.
     */
    AZeroPointTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the B data. This tensor's dimensions should be `{ BatchCount, ChannelCount, K, N }`.
     */
    BTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: _Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the *BTensor* zero point data. The expected dimensions of the `BZeroPointTensor` are `{ 1, 1, 1, 1 }` if per tensor quantization is required, or `{ 1, 1, 1, N }` if per column quantization is required. These zero point values are used for dequantizing the BTensor values.
     */
    BZeroPointTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor with which to write the results to. This tensor's dimensions are `{ BatchCount, ChannelCount, M, N }`.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

}
