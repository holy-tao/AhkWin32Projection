#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_SCALE_BIAS.ahk" { DML_SCALE_BIAS }
#Import ".\DML_TENSOR_DATA_TYPE.ahk" { DML_TENSOR_DATA_TYPE }
#Import ".\DML_SCALAR_UNION.ahk" { DML_SCALAR_UNION }

/**
 * Performs a clamping (or limiting) operation for each element of *InputTensor*, placing the result into the corresponding element of *OutputTensor*.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ELEMENT_WISE_CLIP1_OPERATOR_DESC {
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

    /**
     * Type: [**DML_TENSOR_DATA_TYPE**](/windows/win32/api/directml/ne-directml-dml_tensor_data_type)
     * 
     * The data type of the *Min* and *Max* members, which must match *OutputTensor.DataType*.
     */
    MinMaxDataType : DML_TENSOR_DATA_TYPE

    /**
     * Type: [**DML_SCALAR_UNION**](/windows/win32/api/directml/ns-directml-dml_scalar_union)
     * 
     * The minimum value, below which the operator replaces the value with *Min*. *MinMaxDataType* determines how to interpret the field.
     */
    Min : DML_SCALAR_UNION

    /**
     * Type: [**DML_SCALAR_UNION**](/windows/win32/api/directml/ns-directml-dml_scalar_union)
     * 
     * The maximum value, above which the operator replaces the value with *Max*. *MinMaxDataType* determines how to interpret the field.
     */
    Max : DML_SCALAR_UNION

}
