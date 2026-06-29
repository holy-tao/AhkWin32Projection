#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Sint64 types. (MI_Sint64A)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_sint64a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Sint64A {
    #StructPack 8

    /**
     * An array of <b>MI_Sint64</b> types.
     */
    data : IntPtr

    /**
     * The number of items in the array.
     */
    size : UInt32

}
