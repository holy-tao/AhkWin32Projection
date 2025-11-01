#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs an element-wise scale-and-bias function, `Output = Scale * Input + Bias`.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_value_scale_2d_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_VALUE_SCALE_2D_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the Input data. This tensor's dimensions should be `{ BatchCount, ChannelCount, Height, Width }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor with which to write the results to. This tensor's dimensions should match the *InputTensor*'s dimensions.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Scale value to be applied to all input values.
     * @type {Float}
     */
    Scale {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This field determines the size of the Bias array. This field must be set to either 1 or 3, and must also match the size of the Channel dimension of the input tensor.
     * @type {Integer}
     */
    ChannelCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a>*</b>
     * 
     * An array of *FLOAT* values containing the bias term for each dimension of the input tensor.
     * @type {Pointer<Float>}
     */
    Bias {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
