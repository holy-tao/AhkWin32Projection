#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a property inside an MI_Instance structure.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_sint16field
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Sint16Field extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * A field of type <b>MI_Sint16</b>.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     * @type {Integer}
     */
    exists {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Bit flags indicating memory management policy.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
