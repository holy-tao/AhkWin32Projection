#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an array of MI_Real64 types. (MI_Real64A)
 * @remarks
 * This type cannot be a key. This differs from the DMTF CIM specification. For more information on keys, see <a href="https://docs.microsoft.com/windows/win32/wmisdk/key-qualifier">https://go.microsoft.com/fwlink/p/?linkid=259738</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_real64a
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Real64A {
    #StructPack 8

    /**
     * An array of <b>MI_Real64</b> types.
     */
    data : IntPtr

    /**
     * The number of items in the array.
     */
    size : UInt32

}
