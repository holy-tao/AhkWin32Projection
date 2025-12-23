#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An object tied to a specific serialization technique.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_serializer
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Serializer extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved for internals use.
     * @type {Integer}
     */
    reserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for internals use.
     * @type {Pointer}
     */
    reserved2 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
