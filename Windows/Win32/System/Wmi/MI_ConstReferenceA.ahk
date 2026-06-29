#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Instance.ahk" { MI_Instance }

/**
 * Represents an array of MI_Instance types. (MI_ConstReferenceA)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constreferencea
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstReferenceA {
    #StructPack 8

    /**
     * An array of  <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> types where only the keys are present.
     */
    data : IntPtr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}
