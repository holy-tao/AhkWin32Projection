#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Performs a parametric softplus activation function on every element in *InputTensor*, placing the result into the corresponding element of *OutputTensor*. (DML_ACTIVATION_SOFTPLUS_OPERATOR_DESC)
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_softplus_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ACTIVATION_SOFTPLUS_OPERATOR_DESC {
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
     * The **Steepness** coefficient. A typical default for this value is 1.0. This value cannot be less than 1.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The steepness value.
     */
    Steepness : Float32

}
