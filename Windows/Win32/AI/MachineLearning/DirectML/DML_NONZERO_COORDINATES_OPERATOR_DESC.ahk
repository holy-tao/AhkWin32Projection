#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Computes the N-dimensional coordinates of all non-zero elements of the input tensor.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_nonzero_coordinates_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_NONZERO_COORDINATES_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An input tensor.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor that holds the count of non-zero elements in the input tensor. This tensor must be a scalar&mdash;that is, the Sizes of this tensor must all be 1. The type of this tensor must be **UINT32**.
     */
    OutputCountTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor that holds the N-dimensional coordinates of the input elements which are non-zero. 
     * 
     * This tensor must have *Sizes* of `{1,1,M,N}` (if *DimensionCount* is 4), or `{1,1,1,M,N}` (if *DimensionCount* is 5), where M is the total number of elements in the *InputTensor*, and N is greater or equal to the *effective rank* of *InputTensor*, up to the *DimensionCount* of the input.
     * 
     * The effective rank of a tensor is determined by the *DimensionCount* of that tensor excluding leading dimensions of size 1. For example a tensor with sizes of `{1,2,3,4}` has effective rank 3, as does a tensor with sizes of `{1,1,5,5,5}`. A tensor with sizes `{1,1,1,1}` has effective rank 0.
     * 
     * Consider an *InputTensor* with *Sizes* of `{1,1,12,5}`. This input tensor contains 60 elements, and has an effective rank of 2. In this example all valid sizes of *OutputCoordinatesTensor* are of the form `{1,1,60,N}`, where N >= 2 but no greater than the *DimensionCount* (4 in this example).
     * 
     * The coordinates written into this tensor are guaranteed to be ordered by ascending element index. For example if the input tensor has 3 non-zero values at coordinates {1,0}, {1,2}, and {0,5}, the values written to the *OutputCoordinatesTensor* will be `[[0,5], [1,0], [1,2]]`.
     * 
     * While this tensor requires its dimension M to equal the number of elements in the input tensor, this operator will only write a maximum of OutputCount elements to this tensor. The OutputCount is returned through the scalar *OutputCountTensor*.
     * 
     * > [!NOTE]
     * > The remaining elements of this tensor beyond the OutputCount are undefined once this operator completes. You shouldn't rely on the values of these elements.
     */
    OutputCoordinatesTensor : DML_TENSOR_DESC.Ptr

}
