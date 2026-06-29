#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_TENSOR_DATA_TYPE.ahk" { DML_TENSOR_DATA_TYPE }
#Import ".\DML_SCALAR_UNION.ahk" { DML_SCALAR_UNION }

/**
 * Computes backpropagation gradients for [element-wise clip](/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_clip_grad1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ELEMENT_WISE_CLIP_GRAD1_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input feature tensor. This is typically the same tensor that was provided as the *InputTensor* to [DML_OPERATOR_ELEMENT_WISE_CLIP1](/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc) in the forward pass.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The incoming gradient tensor. This is typically obtained from the output of backpropagation of a preceding layer. Typically this tensor would have the same sizes as the *output* of the corresponding [DML_OPERATOR_ELEMENT_WISE_CLIP1](/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc) in the forward pass.
     */
    InputGradientTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor containing the backpropagated gradients. Typically this tensor would have the same sizes as the *input* of the corresponding [DML_OPERATOR_ELEMENT_WISE_CLIP1](/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc) in the forward pass.
     */
    OutputGradientTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**DML_TENSOR_DATA_TYPE**](/windows/win32/api/directml/ne-directml-dml_tensor_data_type)
     * 
     * The data type of the *Min* and *Max* members, which must match *OutputTensor.DataType*.
     */
    MinMaxDataType : DML_TENSOR_DATA_TYPE

    /**
     * Type: [**DML_SCALAR_UNION**](/windows/win32/api/directml/ns-directml-dml_scalar_union)
     * 
     * The minimum value. If x is at or below this value, then the gradient result is 0. *MinMaxDataType* determines how to interpret the field.
     */
    Min : DML_SCALAR_UNION

    /**
     * Type: [**DML_SCALAR_UNION**](/windows/win32/api/directml/ns-directml-dml_scalar_union)
     * 
     * The maximum value. If x is at or above this value, then the gradient result is 0. *MinMaxDataType* determines how to interpret the field.
     */
    Max : DML_SCALAR_UNION

}
