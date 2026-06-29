#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Uint16A types.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constuint16a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstUint16A {
    #StructPack 8

    /**
     * An array of <b>MI_Uint16</b> types.
     */
    data : IntPtr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}
