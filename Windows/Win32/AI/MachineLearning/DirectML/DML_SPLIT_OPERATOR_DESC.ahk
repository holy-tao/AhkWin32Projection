#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Splits an input tensor along an axis into multiple output tensors.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_split_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_SPLIT_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to split into multiple output tensors.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This field determines the size of the *OutputTensors* array. This value must be greater than 0.
     * @type {Integer}
     */
    OutputCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An array containing the descriptions of the tensors split off from the input tensor. The output sizes must have the same sizes as the input tensor except for the split axis.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensors {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The index of the dimension of the input tensor to split. All input and output tensors must have identical sizes in all dimensions except for this axis. This value must be in the range `[0, InputTensor.DimensionCount - 1]`.
     * @type {Integer}
     */
    Axis {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
