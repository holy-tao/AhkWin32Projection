#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UParseError {
    #StructPack 4

    line : Int32

    offset : Int32

    preContext : UInt16[16]

    postContext : UInt16[16]

}
