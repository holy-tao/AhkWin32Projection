#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Datetime.ahk" { MI_Datetime }
#Import ".\MI_DatetimeA.ahk" { MI_DatetimeA }

/**
 * Represents a property inside an MI_Instance structure. (MI_DatetimeAField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_datetimeafield
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_DatetimeAField {
    #StructPack 8

    /**
     * A field of type <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_datetimea">MI_DatetimeA</a>.
     */
    value : MI_DatetimeA

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
