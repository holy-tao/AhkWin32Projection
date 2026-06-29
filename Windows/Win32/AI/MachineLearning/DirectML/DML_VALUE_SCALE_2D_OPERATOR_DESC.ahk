#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Performs an element-wise scale-and-bias function, `Output = Scale * Input + Bias`.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_value_scale_2d_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_VALUE_SCALE_2D_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the Input data. This tensor's dimensions should be `{ BatchCount, ChannelCount, Height, Width }`.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor with which to write the results to. This tensor's dimensions should match the *InputTensor*'s dimensions.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Scale value to be applied to all input values.
     */
    Scale : Float32

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This field determines the size of the Bias array. This field must be set to either 1 or 3, and must also match the size of the Channel dimension of the input tensor.
     */
    ChannelCount : UInt32

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a>*</b>
     * 
     * An array of *FLOAT* values containing the bias term for each dimension of the input tensor.
     */
    Bias : IntPtr

}
