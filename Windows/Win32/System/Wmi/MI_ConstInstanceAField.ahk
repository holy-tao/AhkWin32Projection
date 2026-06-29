#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Instance.ahk" { MI_Instance }
#Import ".\MI_ConstInstanceA.ahk" { MI_ConstInstanceA }

/**
 * Represents a property inside an MI_Instance structure. (MI_ConstInstanceAField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constinstanceafield
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstInstanceAField {
    #StructPack 8

    /**
     * A field of type <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_constinstancea">MI_ConstInstanceA</a>.
     */
    value : MI_ConstInstanceA

    /**
     * Indicates whether the field is non-null. Can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags indicating memory management policy.
     */
    flags : Int8

}
