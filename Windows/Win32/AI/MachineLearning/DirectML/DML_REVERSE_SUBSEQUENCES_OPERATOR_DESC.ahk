#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Reverses the elements of one or more *subsequences* of a tensor. The set of subsequences to be reversed is chosen based on the provided axis and sequence lengths.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_reverse_subsequences_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_REVERSE_SUBSEQUENCES_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input tensor containing elements to be reversed.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing a value for each subsequence to be reversed, denoting the length in elements of that subsequence. Only the elements within the length of the subsequence are reversed; the remaining elements along that axis are copied to the output unchanged.
     * 
     * This tensor must have dimension count and sizes equal to the *InputTensor*, *except* for the dimension specified by the *Axis* parameter. The size of the *Axis* dimension must be 1. For example if the *InputTensor* has sizes of `{2,3,4,5}`, and *Axis* is 1, then the sizes of the *SequenceLengthsTensor* must be `{2,1,4,5}`.
     * 
     * If the length of a subsequence exceeds the maximum number of elements along that axis, then this operator behaves as if the value were clamped to the maximum.
     */
    SequenceLengthsTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the results to. This tensor must have the same sizes and data type as the *InputTensor*.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The index of the dimension to reverse elements over. This value must be less than the DimensionCount of the *InputTensor*.
     */
    Axis : UInt32

}
