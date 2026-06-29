#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Sint8A.ahk" { MI_Sint8A }

/**
 * Represents a property inside an MI_Instance structure. (MI_Sint8AField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_sint8afield
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Sint8AField {
    #StructPack 8

    /**
     * A field of type <b>MI_Sint8A</b>.
     */
    value : MI_Sint8A

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
