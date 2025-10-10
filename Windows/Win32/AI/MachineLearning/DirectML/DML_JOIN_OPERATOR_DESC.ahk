#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Concatenates an array of input tensors along a specified axis.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_join_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_JOIN_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This field determines the size of the *InputTensors* array. This value must be greater than 0.
     * @type {Integer}
     */
    InputCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: \_Field\_size\_(InputCount) **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An array containing the descriptions of the tensors to join into a single output tensor. All input tensors in this array must have the same sizes except for the join axis, which may have any non-zero value.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensors {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the joined input tensors into. The output sizes must have the same sizes as all input tensors except for the join axis, which must be equal to the sum of all inputs' join axis size.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The index of the dimension of the input tensors to join. All input and output tensors must have identical sizes in all dimensions except for this axis. This value must be in the range `[0, OutputTensor.DimensionCount - 1]`.
     * @type {Integer}
     */
    Axis {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
