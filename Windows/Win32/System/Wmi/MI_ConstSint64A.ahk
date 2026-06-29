#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Sint64 types. (MI_ConstSint64A)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constsint64a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstSint64A {
    #StructPack 8

    /**
     * An array of <b>MI_Sint64</b> types.
     */
    data : IntPtr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}
