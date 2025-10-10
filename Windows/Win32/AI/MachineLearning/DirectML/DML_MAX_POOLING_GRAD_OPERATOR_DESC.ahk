#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Computes backpropagation gradients for max pooling (see [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc)).
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_max_pooling_grad_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_MAX_POOLING_GRAD_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input feature tensor. This is typically the same tensor that was provided as the *InputTensor* to [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc) in the forward pass.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The incoming gradient tensor. This is typically obtained from the output of backpropagation of a preceding layer. Typically this tensor would have the same sizes as the *output* of the corresponding [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc) in the forward pass.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputGradientTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor containing the backpropagated gradients. Typically this tensor would have the same sizes as the *input* of the corresponding [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc) in the forward pass.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputGradientTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of elements in the *Strides*, *WindowSize*, *StartPadding*, *EndPadding*, and *Dilations* arrays. This value must equal the spatial dimension count (InputTensor's DimensionCount - 2). As this operator only supports 4D tensors, the only valid value for this parameter is 2.
     * @type {Integer}
     */
    DimensionCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * See *Strides* in [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc).
     * @type {Pointer<UInt32>}
     */
    Strides {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * See *WindowSize* in [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc).
     * @type {Pointer<UInt32>}
     */
    WindowSize {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * See *StartPadding* in [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc).
     * @type {Pointer<UInt32>}
     */
    StartPadding {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * See *EndPadding* in [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc).
     * @type {Pointer<UInt32>}
     */
    EndPadding {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * See *Dilations* in [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc).
     * @type {Pointer<UInt32>}
     */
    Dilations {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
