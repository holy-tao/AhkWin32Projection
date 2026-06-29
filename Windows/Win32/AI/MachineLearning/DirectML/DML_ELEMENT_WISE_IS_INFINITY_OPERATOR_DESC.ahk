#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_IS_INFINITY_MODE.ahk" { DML_IS_INFINITY_MODE }

/**
 * Checks each element of *InputTensor* for IEEE-754 -inf, inf, or both, depending on the given *InfinityMode*, and places the result (1 for true, 0 for false) into the corresponding element of *OutputTensor*.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_is_infinity_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ELEMENT_WISE_IS_INFINITY_OPERATOR_DESC {
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
     * Type: **[DML_IS_INFINITY_MODE](https://microsoft.github.io/windows-docs-rs/doc/windows/Win32/AI/MachineLearning/DirectML/struct.DML_IS_INFINITY_MODE.html)**
     * 
     * A [DML_IS_INFINITY_MODE](https://microsoft.github.io/windows-docs-rs/doc/windows/Win32/AI/MachineLearning/DirectML/struct.DML_IS_INFINITY_MODE.html) determining the sign of the infinity to check for.
     * 
     * * If **DML_IS_INFINITY_MODE_EITHER**, then 1 will be returned if the element is -inf or inf, otherwise 0.
     * * If **DML_IS_INFINITY_MODE_POSITIVE**, then 1 will be returned if the element is inf, otherwise 0.
     * * If **DML_IS_INFINITY_MODE_NEGATIVE**`, then 1 will be returned if the element is -inf, otherwise 0.
     */
    InfinityMode : DML_IS_INFINITY_MODE

}
