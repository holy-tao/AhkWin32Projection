#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Sint16 types. (MI_ConstSint16A)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constsint16a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstSint16A {
    #StructPack 8

    /**
     * An array of <b>MI_Sint16</b> types.
     */
    data : IntPtr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}
