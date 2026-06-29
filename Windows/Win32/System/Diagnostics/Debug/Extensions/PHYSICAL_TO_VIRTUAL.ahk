#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PHYSICAL_TO_VIRTUAL {
    #StructPack 8

    Status : UInt32

    Size : UInt32

    PdeAddress : Int64

}
