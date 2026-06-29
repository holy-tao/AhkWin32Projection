#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UIDNAInfo {
    #StructPack 4

    size : Int16

    isTransitionalDifferent : Int8

    reservedB3 : Int8

    errors : UInt32

    reservedI2 : Int32

    reservedI3 : Int32

}
