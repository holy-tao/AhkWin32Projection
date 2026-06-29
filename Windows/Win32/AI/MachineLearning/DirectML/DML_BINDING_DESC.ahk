#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_BINDING_TYPE.ahk" { DML_BINDING_TYPE }

/**
 * Contains the description of a binding so that you can add it to the binding table via a call to one of the IDMLBindingTable methods.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_binding_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_BINDING_DESC {
    #StructPack 8

    /**
     * Type: [**DML_BINDING_TYPE**](/windows/win32/api/directml/ne-directml-dml_binding_type)
     * 
     * A [DML_BINDING_TYPE](/windows/win32/api/directml/ne-directml-dml_binding_type) specifying the type of the binding; whether it refers to a single buffer, or to an array of buffers.
     */
    Type : DML_BINDING_TYPE

    /**
     * Type: <b>const void*</b>
     * 
     * A pointer to a constant structure whose type depends on the value <i>Type</i>. If <i>Type</i> is [DML_BINDING_TYPE_BUFFER](/windows/win32/api/directml/ne-directml-dml_binding_type), then <i>Desc</i> should point to a [DML_BUFFER_BINDING](/windows/win32/api/directml/ns-directml-dml_buffer_binding). If <i>Type</i> is [DML_BINDING_TYPE_BUFFER_ARRAY](/windows/win32/api/directml/ne-directml-dml_binding_type), then <i>Desc</i> should point to a [DML_BUFFER_ARRAY_BINDING](/windows/win32/api/directml/ns-directml-dml_buffer_array_binding).
     */
    Desc : IntPtr

}
