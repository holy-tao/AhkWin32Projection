#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DML_SCALAR_UNION.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ELEMENT_WISE_CLIP1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DML_SCALE_BIAS>}
     */
    ScaleBias {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MinMaxDataType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {DML_SCALAR_UNION}
     */
    Min{
        get {
            if(!this.HasProp("__Min"))
                this.__Min := DML_SCALAR_UNION(32, this)
            return this.__Min
        }
    }

    /**
     * @type {DML_SCALAR_UNION}
     */
    Max{
        get {
            if(!this.HasProp("__Max"))
                this.__Max := DML_SCALAR_UNION(88, this)
            return this.__Max
        }
    }
}
