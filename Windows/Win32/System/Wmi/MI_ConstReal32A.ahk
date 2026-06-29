#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Real32 types. (MI_ConstReal32A)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constreal32a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstReal32A {
    #StructPack 8

    /**
     * An array of  MI_Real32 types.
     */
    data : IntPtr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}
