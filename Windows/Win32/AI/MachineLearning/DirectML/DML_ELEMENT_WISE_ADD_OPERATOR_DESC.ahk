#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Adds every element in *ATensor* to its corresponding element in *BTensor*, placing the result into the corresponding element of *OutputTensor*. (DML_ELEMENT_WISE_ADD_OPERATOR_DESC)
 * @remarks
 * A newer version of this operator, [DML_ELEMENT_WISE_ADD1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_add1_operator_desc), was introduced in `DML_FEATURE_LEVEL_2_0`.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_add_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ELEMENT_WISE_ADD_OPERATOR_DESC {
    #StructPack 8

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
