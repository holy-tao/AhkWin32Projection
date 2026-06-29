#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_OPERATOR_DESC.ahk" { DML_OPERATOR_DESC }
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Adds every element in *ATensor* to its corresponding element in *BTensor* and places the result into the corresponding element of *OutputTensor*, with the option for fused activation.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_add1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ELEMENT_WISE_ADD1_OPERATOR_DESC {
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

    /**
     * Type: \_Maybenull\_ **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * An optional fused activation layer to apply after the addition. For more info, see [Using fused operators for improved performance](/windows/ai/directml/dml-fused-activations).
     * 
     * Fused activation may be used only when the output datatype is **FLOAT16** or **FLOAT32**.
     */
    FusedActivation : DML_OPERATOR_DESC.Ptr

}
