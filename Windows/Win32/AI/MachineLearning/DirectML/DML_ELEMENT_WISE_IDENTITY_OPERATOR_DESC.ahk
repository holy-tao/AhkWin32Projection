#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_SCALE_BIAS.ahk" { DML_SCALE_BIAS }

/**
 * Computes the identity for each element of *InputTensor*, placing the result into the corresponding element of *OutputTensor*.
 * @remarks
 * The identity operation is often used to copy a tensor.
 * 
 * It can also be used to transform the layout of tensors by manipulating strides (see [Using strides to express padding and memory layout](/windows/ai/directml/dml-strides)).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_identity_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ELEMENT_WISE_IDENTITY_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input tensor to read from.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the results to.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: \_Maybenull\_ **const [DML_SCALE_BIAS](/windows/win32/api/directml/ns-directml-dml_scale_bias)\***
     * 
     * An optional scale and bias to apply to the input. If present, this has the effect of applying the function `g(x) = x * scale + bias` to each *input* element prior to computing this operator.
     */
    ScaleBias : DML_SCALE_BIAS.Ptr

}
