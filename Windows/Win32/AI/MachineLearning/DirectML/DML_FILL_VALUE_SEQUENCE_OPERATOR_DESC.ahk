#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DML_SCALAR_UNION.ahk

/**
 * Fills a tensor with a sequence.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_fill_value_sequence_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_FILL_VALUE_SEQUENCE_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 128

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
     * The data type of *Value* field, which must match *OutputTensor.DataType*.
     * @type {Integer}
     */
    ValueDataType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: **[DML_SCALAR_UNION](/windows/win32/api/directml/ns-directml-dml_scalar_union)**
     * 
     * The initial value to fill the first element in the output, with *ValueDataType* determining how to interpret the field.
     * @type {DML_SCALAR_UNION}
     */
    ValueStart{
        get {
            if(!this.HasProp("__ValueStart"))
                this.__ValueStart := DML_SCALAR_UNION(16, this)
            return this.__ValueStart
        }
    }

    /**
     * Type: **[DML_SCALAR_UNION](/windows/win32/api/directml/ns-directml-dml_scalar_union)**
     * 
     * A step to add to the value for each element written, with *ValueDataType* determining how to interpret the field.
     * @type {DML_SCALAR_UNION}
     */
    ValueDelta{
        get {
            if(!this.HasProp("__ValueDelta"))
                this.__ValueDelta := DML_SCALAR_UNION(72, this)
            return this.__ValueDelta
        }
    }
}
