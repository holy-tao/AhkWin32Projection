#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_OPERATOR_DESC.ahk" { DML_OPERATOR_DESC }
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_MATRIX_TRANSFORM.ahk" { DML_MATRIX_TRANSFORM }

/**
 * Performs a general matrix multiplication function of the form `Output = FusedActivation(Alpha * TransA(A) x TransB(B) + Beta * C)`, where `x` denotes matrix multiplication, and `*` denotes multiplication with a scalar.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_gemm_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_GEMM_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the A matrix. This tensor's *Sizes* should be `{ BatchCount, ChannelCount, M, K }` if *TransA* is [DML_MATRIX_TRANSFORM_NONE](/windows/win32/api/directml/ne-directml-dml_matrix_transform), or `{ BatchCount, ChannelCount, K, M }` if *TransA* is **DML_MATRIX_TRANSFORM_TRANSPOSE**.
     */
    ATensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the B matrix. This tensor's *Sizes* should be `{ BatchCount, ChannelCount, K, N }` if *TransB* is [DML_MATRIX_TRANSFORM_NONE](/windows/win32/api/directml/ne-directml-dml_matrix_transform), or `{ BatchCount, ChannelCount, N, K }` if *TransB* is **DML_MATRIX_TRANSFORM_TRANSPOSE**.
     */
    BTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the C matrix, or `nullptr`. Values default to 0 when not provided. If provided, this tensor's *Sizes* should be `{ BatchCount, ChannelCount, M, N }`.
     */
    CTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. This tensor's *Sizes* are `{ BatchCount, ChannelCount, M, N }`.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**DML_MATRIX_TRANSFORM**](/windows/win32/api/directml/ne-directml-dml_matrix_transform)
     * 
     * The transform to be applied to *ATensor*; either a transpose, or no transform.
     */
    TransA : DML_MATRIX_TRANSFORM

    /**
     * Type: [**DML_MATRIX_TRANSFORM**](/windows/win32/api/directml/ne-directml-dml_matrix_transform)
     * 
     * The transform to be applied to *BTensor*; either a transpose, or no transform.
     */
    TransB : DML_MATRIX_TRANSFORM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The value of the scalar multiplier for the product of inputs *ATensor* and *BTensor*.
     */
    Alpha : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The value of the scalar multiplier for the optional input *CTensor*. If *CTensor* is not provided, then this value is ignored.
     */
    Beta : Float32

    /**
     * Type: \_Maybenull\_ **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * An optional fused activation layer to apply after the GEMM. For more info, see [Using fused operators for improved performance](/windows/ai/directml/dml-fused-activations).
     */
    FusedActivation : DML_OPERATOR_DESC.Ptr

}
