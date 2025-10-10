#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MI_ConstDatetimeA.ahk

/**
 * Represents a property inside an MI_Instance structure.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_constdatetimeafield
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ConstDatetimeAField extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A field of type <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_constdatetimea">MI_ConstDatetimeA</a>.
     * @type {MI_ConstDatetimeA}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := MI_ConstDatetimeA(this.ptr + 0)
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
