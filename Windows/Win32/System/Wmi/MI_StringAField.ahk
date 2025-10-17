#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MI_StringA.ahk

/**
 * Represents a property inside an MI_Instance structure.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_stringafield
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_StringAField extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A field of type <b>MI_StringA</b>.
     * @type {MI_StringA}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := MI_StringA(0, this)
            return this.__value
        }
    }

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     * @type {Integer}
     */
    exists {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * Bit flags indicating memory management policy.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }
}
