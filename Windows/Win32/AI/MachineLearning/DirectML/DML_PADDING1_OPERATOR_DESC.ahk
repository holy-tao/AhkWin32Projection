#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DML_SCALAR_UNION.ahk

/**
 * The DML_PADDING1_OPERATOR_DESC structure (directml.h) inflates the input tensor with constant or mirrored values on the edges, and writes the result to the output.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_padding1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_PADDING1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the output data. For each dimension *i*, `OutputTensor.Sizes[i] = InputTensor.Sizes[i] + StartPadding[i] + EndPadding[i]`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **[DML_PADDING_MODE](/windows/win32/api/directml/ne-directml-dml_padding_mode)\***
     * 
     * The padding mode to use when filling the padding regions.
     * 
     * - **DML_PADDING_MODE_CONSTANT**. Uses a single constant value defined by *PaddingValue* for all padding values (see **Example 1**).
     * - **DML_PADDING_MODE_EDGE**. For each dimension, use the edge values of that dimension for all padding values (see **Example 2**).
     * - **DML_PADDING_MODE_REFLECTION**. Mirror the values of the tensor as if we folded it right on the edges, which means that edges are not mirrored. Note that `StartPadding[i] >= InputTensor.Sizes[i]`, and `EndPadding[i] >= InputTensor.Sizes[i]` is valid, which means that we can mirror new padding regions periodically by folding them over previous padding regions (see **Example 3**).
     * - **DML_PADDING_MODE_SYMMETRIC**. Similar to **DML_PADDING_MODE_REFLECTION**, but edges are also mirrored. Note that `StartPadding[i] > InputTensor.Sizes[i]`, and `EndPadding[i] > InputTensor.Sizes[i]` is valid, which means that we can mirror new padding regions periodically by folding them over previous padding regions (see **Example 4**). **This mode was introduced in feature level `DML_FEATURE_LEVEL_3_0`**.
     * @type {Integer}
     */
    PaddingMode {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: [**DML_TENSOR_DATA_TYPE**](/windows/win32/api/directml/ne-directml-dml_tensor_data_type)
     * 
     * The data type of the *PaddingValue* member, which must match *OutputTensor.DataType*.
     * @type {Integer}
     */
    PaddingValueDataType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: **[DML_SCALAR_UNION](/windows/win32/api/directml/ns-directml-dml_scalar_union)**
     * 
     * The padding value to use when `PaddingMode == DML_PADDING_MODE_CONSTANT`, with *PaddingValueDataType* determining how to interpret the field. This value is ignored for other padding modes.
     * @type {DML_SCALAR_UNION}
     */
    PaddingValue{
        get {
            if(!this.HasProp("__PaddingValue"))
                this.__PaddingValue := DML_SCALAR_UNION(24, this)
            return this.__PaddingValue
        }
    }

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The size of the arrays pointed to by *StartPadding* and *EndPadding*. This value must be the same value as the dimension count of *InputTensor* and *OutputTensor*.
     * @type {Integer}
     */
    DimensionCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) **const [UINT](/windows/desktop/winprog/windows-data-types)\***
     * 
     * The sizes of the padding regions to add at the beginning of each dimension. For each dimension *i*, `StartPadding[i] = OutputTensor.Sizes[i] - InputTensor.Sizes[i] - EndPadding[i]`.
     * @type {Pointer<Integer>}
     */
    StartPadding {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) **const [UINT](/windows/desktop/winprog/windows-data-types)\***
     * 
     * The sizes of the padding regions to add at the end of each dimension. For each dimension *i*, `EndPadding[i] = OutputTensor.Sizes[i] - InputTensor.Sizes[i] - StartPadding[i]`.
     * @type {Pointer<Integer>}
     */
    EndPadding {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
