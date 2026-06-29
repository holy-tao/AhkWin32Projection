#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IOSPACE {
    #StructPack 4

    Address : UInt32

    Length : UInt32

    Data : UInt32

}
