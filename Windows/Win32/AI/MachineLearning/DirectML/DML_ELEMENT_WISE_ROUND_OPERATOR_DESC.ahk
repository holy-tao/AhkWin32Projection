#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_ROUNDING_MODE.ahk" { DML_ROUNDING_MODE }
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Rounds each element of *InputTensor* to an integer value, placing the result into the corresponding element of *OutputTensor*.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_round_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ELEMENT_WISE_ROUND_OPERATOR_DESC {
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
     * Type: **[DML_ROUNDING_MODE](https://microsoft.github.io/windows-docs-rs/doc/windows/Win32/AI/MachineLearning/DirectML/struct.DML_ROUNDING_MODE.html)**
     * 
     * A [DML_ROUNDING_MODE](https://microsoft.github.io/windows-docs-rs/doc/windows/Win32/AI/MachineLearning/DirectML/struct.DML_ROUNDING_MODE.html) determining the direction to round towards.
     * 
     * * If **DML_ROUNDING_MODE_HALVES_TO_NEAREST_EVEN**: values are rounded to the nearest integer, with halfway values (for example, 0.5) being rounded toward the nearest even integer.
     * * If **DML_ROUNDING_MODE_TOWARD_ZERO**: values are rounded toward zero. This effectively truncates the fractional part.
     * * If **DML_ROUNDING_MODE_TOWARD_INFINITY**: values are rounded to the nearest integer, with halfway values (for example, 0.5) being rounded away from zero (toward positive or negative infinity, depending on the sign of the value).
     */
    RoundingMode : DML_ROUNDING_MODE

}
