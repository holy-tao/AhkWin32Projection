#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct READCONTROLSPACE64 {
    #StructPack 8

    Processor : UInt16

    Address : Int64

    BufLen : UInt32

    Buf : Int8[1]

}
