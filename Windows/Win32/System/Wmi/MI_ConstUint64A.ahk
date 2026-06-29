#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Uint64 types. (MI_ConstUint64A)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constuint64a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstUint64A {
    #StructPack 8

    /**
     * An array of <b>MI_Uint64</b> types.
     */
    data : IntPtr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}
