#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MI_Timestamp.ahk
#Include .\MI_Interval.ahk
#Include .\MI_Datetime.ahk

/**
 * Represents a property inside an MI_Instance structure. (MI_DatetimeField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_datetimefield
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_DatetimeField extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * A field of type <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_datetime">MI_Datetime</a>.
     * @type {MI_Datetime}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := MI_Datetime(0, this)
            return this.__value
        }
    }

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     * @type {Integer}
     */
    exists {
        get => NumGet(this, 36, "char")
        set => NumPut("char", value, this, 36)
    }

    /**
     * Bit flags indicating memory management policy.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 37, "char")
        set => NumPut("char", value, this, 37)
    }
}
