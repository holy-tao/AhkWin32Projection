#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Gathers elements from the input tensor along the given axis using the indices tensor to remap into the input.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_gather_elements_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_GATHER_ELEMENTS_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The indices into the input tensor along the active axis. The *Sizes* must match *InputTensor.Sizes* for every dimension except *Axis*.
     * 
     * Starting with `DML_FEATURE_LEVEL_3_0`, this operator supports negative index values when using a signed integral type with this tensor. Negative indices are interpreted as being relative to the end of the axis dimension. For example, an index of -1 refers to the last element along that dimension.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    IndicesTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The *Sizes* must match *IndicesTensor.Sizes*, and *DataType* must match *InputTensor.DataType*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The axis dimension of *InputTensor* to gather along, ranging `[0, *InputTensor.DimensionCount*)`.
     * @type {Integer}
     */
    Axis {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
