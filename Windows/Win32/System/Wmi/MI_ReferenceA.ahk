#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Instance.ahk" { MI_Instance }

/**
 * Represents an array of pointers to MI_Instance types.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_referencea
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ReferenceA {
    #StructPack 8

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> structures.
     */
    data : IntPtr

    /**
     * The number of items in the array.
     */
    size : UInt32

}
