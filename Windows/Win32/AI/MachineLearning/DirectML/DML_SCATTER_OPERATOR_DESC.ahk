#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Copies the whole input tensor to the output, then overwrites selected indices with corresponding values from the updates tensor.
 * @remarks
 * 
 * **DML_SCATTER_OPERATOR_DESC** has been more properly aliased to the name **DML_SCATTER_ELEMENTS_OPERATOR_DESC** as the proper counterpart to [DML_GATHER_ELEMENTS_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_gather_elements_operator_desc). This is because **DML_SCATTER_OPERATOR_DESC** was not really symmetric to [DML_GATHER_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_gather_operator_desc).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_scatter_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_SCATTER_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 40

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
     * A tensor containing the indices into the output tensor. The *Sizes* must match *InputTensor.Sizes* for every dimension except *Axis*.
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
     * A tensor containing the new values to replace the existing input values at the corresponding indices. The *Sizes* of this tensor must match *IndicesTensor.Sizes*. The *DataType* must match *InputTensor.DataType*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    UpdatesTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The *Sizes* and *DataType* of this tensor must match *InputTensor*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The axis dimension to use for indexing in *OutputTensor*, ranging `[0, OutputTensor.DimensionCount)`.
     * @type {Integer}
     */
    Axis {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
