#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCharIterator {
    #StructPack 8

    context : IntPtr

    length : Int32

    start : Int32

    index : Int32

    limit : Int32

    reservedField : Int32

    getIndex : IntPtr

    move : IntPtr

    hasNext : IntPtr

    hasPrevious : IntPtr

    current : IntPtr

    next : IntPtr

    previous : IntPtr

    reservedFn : IntPtr

    getState : IntPtr

    setState : IntPtr

}
