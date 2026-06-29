#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Datetime.ahk" { MI_Datetime }
#Import ".\MI_ConstDatetimeA.ahk" { MI_ConstDatetimeA }

/**
 * Represents a property inside an MI_Instance structure. (MI_ConstDatetimeAField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constdatetimeafield
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstDatetimeAField {
    #StructPack 8

    /**
     * A field of type <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_constdatetimea">MI_ConstDatetimeA</a>.
     */
    value : MI_ConstDatetimeA

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
