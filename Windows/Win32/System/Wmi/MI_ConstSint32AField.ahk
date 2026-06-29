#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_ConstSint32A.ahk" { MI_ConstSint32A }

/**
 * Represents a property inside an MI_Instance structure. (MI_ConstSint32AField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constsint32afield
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstSint32AField {
    #StructPack 8

    /**
     * A field of type <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_constsint32a">MI_ConstSint32A</a>.
     */
    value : MI_ConstSint32A

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
