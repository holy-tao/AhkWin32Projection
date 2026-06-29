#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Performs a hard sigmoid function on every element in *InputTensor*, placing the result into the corresponding element of *OutputTensor*.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_hard_sigmoid_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ACTIVATION_HARD_SIGMOID_OPERATOR_DESC {
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The alpha coefficient. A typical default for this value is 0.2.
     */
    Alpha : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The beta coefficient. A typical default for this value is 0.5.
     */
    Beta : Float32

}
