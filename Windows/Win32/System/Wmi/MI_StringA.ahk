#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of pointers to null-terminated MI_Char* strings.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_stringa
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_StringA {
    #StructPack 8

    /**
     * An array of pointers to null-terminated <b>MI_Char</b>* strings.
     */
    data : IntPtr

    /**
     * The number of items in the array.
     */
    size : UInt32

}
