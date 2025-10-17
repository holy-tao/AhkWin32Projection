#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs a local response normalization (LRN) function on the input.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_local_response_normalization_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_LOCAL_RESPONSE_NORMALIZATION_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the input data. This tensor's *Sizes* should be `{ BatchCount, ChannelCount, Height, Width }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. This tensor's *Sizes* should match the *InputTensor*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * **TRUE** if the LRN layer sums across channels; otherwise, **FALSE**.
     * @type {BOOL}
     */
    CrossChannel {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of elements to sum over per dimension: Width, Height, and optionally Channel (if *CrossChannel* is set). This value must be at least 1.
     * @type {Integer}
     */
    LocalSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The value of the scaling parameter. A value of 0.0001 is recommended as default.
     * @type {Float}
     */
    Alpha {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The value of the exponent. A value of 0.75 is recommended as default.
     * @type {Float}
     */
    Beta {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The value of bias. A value of 1 is recommended as default.
     * @type {Float}
     */
    Bias {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }
}
