#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Instance.ahk" { MI_Instance }
#Import ".\MI_ReferenceA.ahk" { MI_ReferenceA }

/**
 * Represents a property inside an MI_Instance structure. (MI_ReferenceAField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_referenceafield
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ReferenceAField {
    #StructPack 8

    /**
     * A field of type <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_referencea">MI_ReferenceA</a>.
     */
    value : MI_ReferenceA

    /**
     * Indicates whether the field is non-null. This member can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags that indicate the memory management policy.
     */
    flags : Int8

}
