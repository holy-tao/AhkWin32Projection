#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the description of a binding so that you can add it to the binding table via a call to one of the IDMLBindingTable methods.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_binding_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_BINDING_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: [**DML_BINDING_TYPE**](/windows/win32/api/directml/ne-directml-dml_binding_type)
     * 
     * A [DML_BINDING_TYPE](/windows/win32/api/directml/ne-directml-dml_binding_type) specifying the type of the binding; whether it refers to a single buffer, or to an array of buffers.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>const void*</b>
     * 
     * A pointer to a constant structure whose type depends on the value <i>Type</i>. If <i>Type</i> is [DML_BINDING_TYPE_BUFFER](/windows/win32/api/directml/ne-directml-dml_binding_type), then <i>Desc</i> should point to a [DML_BUFFER_BINDING](/windows/win32/api/directml/ns-directml-dml_buffer_binding). If <i>Type</i> is [DML_BINDING_TYPE_BUFFER_ARRAY](/windows/win32/api/directml/ne-directml-dml_binding_type), then <i>Desc</i> should point to a [DML_BUFFER_ARRAY_BINDING](/windows/win32/api/directml/ns-directml-dml_buffer_array_binding).
     * @type {Pointer<Void>}
     */
    Desc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
