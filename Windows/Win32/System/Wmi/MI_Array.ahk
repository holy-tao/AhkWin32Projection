#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Generalized type that represents an array. It can be generalized because all arrays are the same size, except the data element type will be specialized.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_array
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Array {
    #StructPack 8

    /**
     * A pointer to the array of values.
     */
    data : IntPtr

    /**
     * The number of elements in the array.
     */
    size : UInt32

}
