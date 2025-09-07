#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Computes backpropagation gradients for [local response normalization](/windows/win32/api/directml/ns-directml-dml_local_response_normalization_operator_desc).
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_local_response_normalization_grad_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_LOCAL_RESPONSE_NORMALIZATION_GRAD_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 48

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
     * The incoming gradient tensor. This is typically obtained from the output of backpropagation of a preceding layer.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputGradientTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor containing the backpropagated gradients.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputGradientTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** if the LRN layer sums across channels; **FALSE** if the LRN layer sums across spatial dimensions.
     * @type {Integer}
     */
    CrossChannel {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * The maximum number of elements to sum over per dimension (the local region is clipped so that all elements are within bounds). If *CrossChannel* is **TRUE**, then this is the width and height of the local region. If *CrossChannel* is **FALSE**, then this is the number of elements in the local region. This value must be at least 1.
     * @type {Integer}
     */
    LocalSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the scaling parameter. We recommend a value of 0.0001 as default.
     * @type {Float}
     */
    Alpha {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the exponent. We recommend a value of 0.75 as default.
     * @type {Float}
     */
    Beta {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of bias. We recommend a value of 1 as default.
     * @type {Float}
     */
    Bias {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }
}
