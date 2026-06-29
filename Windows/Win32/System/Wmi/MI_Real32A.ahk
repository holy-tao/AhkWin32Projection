#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Real32 types. (MI_Real32A)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_real32a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Real32A {
    #StructPack 8

    /**
     * An array of <b>MI_Real32</b> types.
     */
    data : IntPtr

    /**
     * The number of items in the array.
     */
    size : UInt32

}
