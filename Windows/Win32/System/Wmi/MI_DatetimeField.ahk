#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Interval.ahk" { MI_Interval }
#Import ".\MI_Timestamp.ahk" { MI_Timestamp }
#Import ".\MI_Datetime.ahk" { MI_Datetime }

/**
 * Represents a property inside an MI_Instance structure. (MI_DatetimeField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_datetimefield
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_DatetimeField {
    #StructPack 4

    /**
     * A field of type <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_datetime">MI_Datetime</a>.
     */
    value : MI_Datetime

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
