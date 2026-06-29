#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_InstanceA.ahk" { MI_InstanceA }
#Import ".\MI_Instance.ahk" { MI_Instance }

/**
 * Represents a property inside an MI_Instance structure. (MI_InstanceAField)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_instanceafield
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_InstanceAField {
    #StructPack 8

    /**
     * A field of type <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instancea">MI_InstanceA</a>.
     */
    value : MI_InstanceA

    /**
     * Indicates whether the field is non-null. This member can be set to <b>MI_TRUE</b> or <b>MI_FALSE</b>.
     */
    exists : Int8

    /**
     * Bit flags that indicate the memory management policy.
     */
    flags : Int8

}
