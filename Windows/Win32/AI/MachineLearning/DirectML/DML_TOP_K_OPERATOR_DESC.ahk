#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Selects the largest *K* elements from each sequence along an axis of the *InputTensor*, and returns the values and indices of those elements in the *OutputValueTensor* and *OutputIndexTensor*, respectively.
 * @remarks
 * A newer version of this operator, [DML_TOP_K1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_top_k1_operator_desc), was introduced in `DML_FEATURE_LEVEL_2_1`.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_top_k_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_TOP_K_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input tensor containing elements to select.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the values of the top *K* elements to. This tensor must have sizes equal to the *InputTensor*, *except* for the dimension specified by the *Axis* parameter, which must have a size equal to *K*.
     * 
     * The *K* values selected from each input sequence are guaranteed to be sorted descending (largest to smallest).
     */
    OutputValueTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the indices of the top *K* elements to. This tensor must have sizes equal to the *InputTensor*, *except* for the dimension specified by the *Axis* parameter, which must have a size equal to *K*.
     * 
     * The indices returned in this tensor are measured relative to the beginning of their sequence (as opposed to the beginning of the tensor). For example, an index of 0 always refers to the first element for all sequences in an axis.
     * 
     * In cases where two or more elements in the top-K have the same value (that is, when there is a tie), the indices of both elements are included, and are guaranteed to be ordered by ascending element index.
     */
    OutputIndexTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The index of the dimension to select elements across. This value must be less than the *DimensionCount* of the *InputTensor*.
     */
    Axis : UInt32

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of elements to select. *K* must be greater than 0, but less than the number of elements in the *InputTensor* along the dimension specified by *Axis*.
     */
    K : UInt32

}
