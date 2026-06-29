#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Uint32 types. (MI_ConstUint32A)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constuint32a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstUint32A {
    #StructPack 8

    /**
     * An array of <b>MI_Uint32</b> types.
     */
    data : IntPtr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}
