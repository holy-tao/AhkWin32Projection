#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Deserialization object as created from MI_Application_NewDeserializer. The object itself should not be manually used or changed as it is used internally.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_deserializer
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Deserializer extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved for internal use.
     * @type {Integer}
     */
    reserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for internal use.
     * @type {Pointer}
     */
    reserved2 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
