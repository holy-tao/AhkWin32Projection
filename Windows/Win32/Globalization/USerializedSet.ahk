#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct USerializedSet {
    #StructPack 8

    array : IntPtr

    bmpLength : Int32

    length : Int32

    staticArray : UInt16[8]

}
