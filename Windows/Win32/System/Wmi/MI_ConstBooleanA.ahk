#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_ConstBoolean types.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constbooleana
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstBooleanA {
    #StructPack 8

    /**
     * An array of <b>MI_Boolean</b> types.
     */
    data : IntPtr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}
