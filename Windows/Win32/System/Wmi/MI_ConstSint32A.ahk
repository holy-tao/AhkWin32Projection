#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Sint32 types. (MI_ConstSint32A)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constsint32a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstSint32A {
    #StructPack 8

    /**
     * An array of <b>MI_Sint32</b> types.
     */
    data : IntPtr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}
