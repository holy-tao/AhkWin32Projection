#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Sint16 types. (MI_Sint16A)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_sint16a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Sint16A {
    #StructPack 8

    /**
     * An array of <b>MI_Sint16</b> types.
     */
    data : IntPtr

    /**
     * The number of items in the array.
     */
    size : UInt32

}
