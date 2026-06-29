#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Performs the shrink activation function on every element in *InputTensor*, placing the result into the corresponding element of *OutputTensor*.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_shrink_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ACTIVATION_SHRINK_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](./ns-directml-dml_tensor_desc.md)\***
     * 
     * The input tensor to read from.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](./ns-directml-dml_tensor_desc.md)\***
     * 
     * The output tensor to write the results to.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The value of the bias. A typical default for this value is 0.0.
     */
    Bias : Float32

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The value of the threshold. A typical default for this value is 0.5.
     */
    Threshold : Float32

}
