#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Negates each element of *InputTensor*, storing the result into the corresponding element of *OutputTensor*.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_negate_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ELEMENT_WISE_NEGATE_OPERATOR_DESC {
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

}
