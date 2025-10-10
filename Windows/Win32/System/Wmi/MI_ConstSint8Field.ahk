#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a property inside an MI_Instance structure.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_constsint8field
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ConstSint8Field extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * A field of type <b>MI_Sint8</b>.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     * @type {Integer}
     */
    exists {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Bit flags indicating memory management policy.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}
