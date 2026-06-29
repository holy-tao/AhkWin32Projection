#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Selects elements either from *ATensor* or *BTensor*, depending on the value of the corresponding element in *ConditionTensor*. Non-zero elements of *ConditionTensor* select from *ATensor*, while zero-valued elements select from *BTensor*.
 * @remarks
 * Can be used to functionally build up other aggregate operators, such as LeakyRelu. Here's an illustration in pseudo-code (not the most efficient way, but possible): `LeakyRelu(x) = If(Less(x, 0), Mul(x, alpha), x)`.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_if_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ELEMENT_WISE_IF_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The condition tensor to read from.
     */
    ConditionTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the left-hand side inputs.
     */
    ATensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the right-hand side inputs.
     */
    BTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the results to.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

}
