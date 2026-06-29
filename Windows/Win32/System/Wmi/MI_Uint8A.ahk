#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Uint8 types. (MI_Uint8A)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_uint8a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Uint8A {
    #StructPack 8

    /**
     * An array of <b>MI_Uint8</b> types.
     */
    data : IntPtr

    /**
     * The number of items in the array.
     */
    size : UInt32

}
