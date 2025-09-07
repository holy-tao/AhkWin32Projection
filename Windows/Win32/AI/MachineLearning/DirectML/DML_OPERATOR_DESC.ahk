#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * A generic container for an operator description. You construct DirectML operators using the parameters specified in this struct. See IDMLDevice::CreateOperator for additional details.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: [**DML_OPERATOR_TYPE**](/windows/win32/api/directml/ne-directml-dml_operator_type)
     * 
     * The type of the operator description. See <a href="https://msdn.microsoft.com/2D66A3DB-FE61-4EC2-B626-DD008FF14802">DML_OPERATOR_TYPE</a> for the available types.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>const void*</b>
     * 
     * A pointer to the operator description. The type of the pointed-to struct must match the value specified in <i>Type.</i>
     * @type {Pointer<Void>}
     */
    Desc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
