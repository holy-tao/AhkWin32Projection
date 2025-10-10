#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_ClientFT_V1 structure. Use the functions with the name prefix &quot;MI_Serializer_&quot; to manipulate these structures.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_serializerft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_SerializerFT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Closes a serializer object and frees any internal memory associated with it. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_serializer_close">MI_Serializer_Close</a>.
     * @type {Pointer}
     */
    Close {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Serializes an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> into a buffer in the format 
     *        specified when it was created. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_serializer_serializeclass">MI_Serializer_SerializeClass</a>.
     * @type {Pointer}
     */
    SerializeClass {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Serializes an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> into a buffer in the 
     *        format specified when the serializer was created. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_serializer_serializeinstance">MI_Serializer_SerializeInstance</a>.
     * @type {Pointer}
     */
    SerializeInstance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
