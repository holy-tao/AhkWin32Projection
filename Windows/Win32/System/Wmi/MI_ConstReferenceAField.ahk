#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_ConstReferenceA.ahk" { MI_ConstReferenceA }
#Import ".\MI_Instance.ahk" { MI_Instance }

/**
 * Represents a property inside an MI_Instance structure. (MI_ConstReferenceAField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constreferenceafield
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstReferenceAField {
    #StructPack 8

    /**
     * A field of type <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_constreferencea">MI_ConstReferenceA</a>.
     */
    value : MI_ConstReferenceA

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
