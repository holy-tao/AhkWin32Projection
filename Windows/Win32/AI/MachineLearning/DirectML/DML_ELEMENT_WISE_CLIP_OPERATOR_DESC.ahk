#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs the following operation for each element of *InputTensor*, placing the result into the corresponding element of *OutputTensor*. This operator clamps (or limits) every element in the input within the closed interval [Min, Max].
 * @remarks
 * If the tensor data type is not **float**, then *Min* and *Max* are cast to the tensor data type before applying the clipping operation (which for integers means truncating toward zero; and for floating point values rounding to the nearest even).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_clip_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ELEMENT_WISE_CLIP_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input tensor to read from.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the results to.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_SCALE_BIAS](/windows/win32/api/directml/ns-directml-dml_scale_bias)\***
     * 
     * An optional scale and bias to apply to the input. If present, this has the effect of applying the function `g(x) = x * scale + bias` to each *input* element prior to computing this operator.
     * @type {Pointer<DML_SCALE_BIAS>}
     */
    ScaleBias {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The minimum value, below which the operator replaces the value with *Min*.
     * @type {Float}
     */
    Min {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The maximum value, above which the operator replaces the value with *Max*.
     * @type {Float}
     */
    Max {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }
}
