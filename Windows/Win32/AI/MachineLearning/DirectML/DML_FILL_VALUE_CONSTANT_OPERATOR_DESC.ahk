#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DML_SCALAR_UNION.ahk

/**
 * Fills a tensor with the given constant *Value*.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_fill_value_constant_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_FILL_VALUE_CONSTANT_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. This tensor may have any size.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **[DML_TENSOR_DATA_TYPE](/windows/win32/api/directml/ne-directml-dml_tensor_data_type)**
     * 
     * The data type of the *Value* field, which must match *OutputTensor.DataType*.
     * @type {Integer}
     */
    ValueDataType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: **[DML_SCALAR_UNION](/windows/win32/api/directml/ns-directml-dml_scalar_union)**
     * 
     * A constant value to fill the output, with *ValueDataType* determining how to interpret the field.
     * @type {DML_SCALAR_UNION}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := DML_SCALAR_UNION(16, this)
            return this.__Value
        }
    }
}
