#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * A generic container for a DirectML tensor description.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_tensor_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_TENSOR_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: [**DML_TENSOR_TYPE**](./ne-directml-dml_tensor_type.md)
     * 
     * The type of the tensor description. See <a href="https://docs.microsoft.com/windows/win32/api/directml/ne-directml-dml_tensor_type">DML_TENSOR_TYPE</a> for the available types.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>const void*</b>
     * 
     * A pointer to the tensor description. The type of the pointed-to struct must match the value specified in <i>Type</i>.
     * @type {Pointer<Void>}
     */
    Desc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
