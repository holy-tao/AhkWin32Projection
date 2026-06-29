#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Inverts a max-pooling operation (see [DML_MAX_POOLING_OPERATOR1_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling1_operator_desc) for details) by filling the output tensor *OutputTensor* with the values in the input tensor *InputTensor*, as obtained from a max-pooling operation, according to the index values provided in the *IndicesTensor*. The elements in the output tensor untouched by this process are left with zero values.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_max_unpooling_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_MAX_UNPOOLING_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An input tensor of *Sizes* `{ Batch, Channel, Height, Width }`. The tensor values are obtained from the values in the *OutputTensor* of a max-pooling operation.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor of indices to the output tensor *OutputTensor* for the values given in the input tensor *InputTensor*. These index values are zero-based, and treat the output tensor as a contiguous one-dimensional array. Both the *InputTensor* and *IndicesTensor* have the same tensor sizes. The tensor values are obtained from the *OutputIndicesTensor* of a max-pooling operation.
     */
    IndicesTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor of the same number of dimensions as the input tensor.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

}
