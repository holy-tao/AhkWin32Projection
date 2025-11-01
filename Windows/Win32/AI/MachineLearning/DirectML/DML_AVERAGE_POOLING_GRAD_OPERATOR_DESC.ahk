#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Computes backpropagation gradients for average pooling (see [DML_AVERAGE_POOLING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_average_pooling_operator_desc)).
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_average_pooling_grad_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_AVERAGE_POOLING_GRAD_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The incoming gradient tensor. This is typically obtained from the output of backpropagation of a preceding layer. Typically this tensor would have the same sizes as the *output* of the corresponding [DML_AVERAGE_POOLING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_average_pooling_operator_desc) in the forward pass.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputGradientTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor containing the backpropagated gradients. Typically this tensor would have the same sizes as the *input* of the corresponding [DML_AVERAGE_POOLING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_average_pooling_operator_desc) in the forward pass.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputGradientTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of elements in the *Strides*, *WindowSize*, *StartPadding*, and *EndPadding* arrays. This value must equal the spatial dimension count. The spatial dimension count is 2 if 4D tensors are provided, or 3 if 5D tensors are provided.
     * @type {Integer}
     */
    DimensionCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * See *Strides* in [DML_AVERAGE_POOLING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_average_pooling_operator_desc).
     * @type {Pointer<Integer>}
     */
    Strides {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * See *WindowSize* in [DML_AVERAGE_POOLING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_average_pooling_operator_desc).
     * @type {Pointer<Integer>}
     */
    WindowSize {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * See *StartPadding* in [DML_AVERAGE_POOLING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_average_pooling_operator_desc).
     * @type {Pointer<Integer>}
     */
    StartPadding {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * See *EndPadding* in [DML_AVERAGE_POOLING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_average_pooling_operator_desc).
     * @type {Pointer<Integer>}
     */
    EndPadding {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * See *IncludePadding* in [DML_AVERAGE_POOLING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_average_pooling_operator_desc).
     * @type {BOOL}
     */
    IncludePadding {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
