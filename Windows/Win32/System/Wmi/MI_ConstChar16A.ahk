#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Char16 types. (MI_ConstChar16A)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constchar16a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstChar16A {
    #StructPack 8

    /**
     * An array of <b>MI_Char16</b> types.
     */
    data : IntPtr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}
