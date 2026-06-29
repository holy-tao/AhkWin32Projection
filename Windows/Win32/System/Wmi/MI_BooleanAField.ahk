#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_BooleanA.ahk" { MI_BooleanA }

/**
 * Represents a property inside an MI_Instance structure. (MI_BooleanAField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_booleanafield
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_BooleanAField {
    #StructPack 8

    /**
     * A field of type <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_booleana">MI_BooleanA</a>.
     */
    value : MI_BooleanA

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
