#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Adds every element in *ATensor* to its corresponding element in *BTensor*, placing the result into the corresponding element of *OutputTensor*. (DML_ELEMENT_WISE_QUANTIZED_LINEAR_ADD_OPERATOR_DESC)
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_quantized_linear_add_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ELEMENT_WISE_QUANTIZED_LINEAR_ADD_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the left-hand-side inputs.
     */
    ATensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired scale factor for *ATensor*. The expected number of elements in *AScaleTensor* is 1.
     */
    AScaleTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired zero point for *ATensor*. The expected number of elements in *AZeroPointTensor* is 1. *AZeroPointTensor* is an optional tensor that defaults to 0 if not provided.
     */
    AZeroPointTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the right-hand-side inputs.
     */
    BTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired scale factor for *BTensor*. The expected number of elements in *BScaleTensor* is 1.
     */
    BScaleTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired zero point for *BTensor*. The expected number of elements in *BZeroPointTensor* is 1. *BZeroPointTensor* is an optional tensor that defaults to 0 if not provided.
     */
    BZeroPointTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired scale factor for *OutputTensor*. This is an input tensor defining the output quantization scale factor to use while quantizing the output values. The expected number of elements in *OutputScaleTensor* is 1.
     */
    OutputScaleTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired zero point for *OutputTensor*. This is an input tensor defining the output quantization zero point to use while quantizing the output values. The expected number of elements in *OutputZeroPointTensor* is 1. *OutputZeroPointTensor* is an optional tensor that defaults to 0 if not provided.
     */
    OutputZeroPointTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the results to.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

}
