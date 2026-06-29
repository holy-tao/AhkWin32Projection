#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Instance.ahk" { MI_Instance }

/**
 * Represents an array of MI_Instance structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_instancea
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_InstanceA {
    #StructPack 8

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> structures.
     */
    data : IntPtr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}
