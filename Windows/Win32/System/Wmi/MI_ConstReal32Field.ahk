#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a property inside an MI_Instance structure. (MI_ConstReal32Field)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constreal32field
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ConstReal32Field extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A field of type <b>MI_Real32</b>.
     * @type {Float}
     */
    value {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     * @type {Integer}
     */
    exists {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Bit flags indicating memory management policy.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }
}
