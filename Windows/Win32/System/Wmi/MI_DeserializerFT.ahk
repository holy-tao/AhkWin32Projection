#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_ClientFT_V1 structure. Use the functions with the name prefix &quot;MI_Deserializer_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_deserializerft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_DeserializerFT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Deletes the deserializer object and its associated memory. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_deserializer_close">MI_Deserializer_Close</a>.
     * @type {Pointer}
     */
    Close {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Deserializes a serialized buffer into an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> 
     *        object. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_deserializer_deserializeclass">MI_Deserializer_DeserializeClass</a>.
     * @type {Pointer}
     */
    DeserializeClass {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Gets the class name from a serialized class buffer. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_deserializer_class_getclassname">MI_Deserializer_Class_GetClassName</a>.
     * @type {Pointer}
     */
    Class_GetClassName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Gets the parent class name from a serialized class buffer. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_deserializer_class_getparentclassname">MI_Deserializer_Class_GetParentClassName</a>.
     * @type {Pointer}
     */
    Class_GetParentClassName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Deserializes a serialized buffer into a 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> object. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_deserializer_deserializeinstance">MI_Deserializer_DeserializeInstance</a>.
     * @type {Pointer}
     */
    DeserializeInstance {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Gets the class name of the specified instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_getclassname">MI_Instance_GetClassName</a>.
     * @type {Pointer}
     */
    Instance_GetClassName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
