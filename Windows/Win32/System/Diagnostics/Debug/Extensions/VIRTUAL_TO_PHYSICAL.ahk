#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct VIRTUAL_TO_PHYSICAL {
    #StructPack 8

    Status : UInt32

    Size : UInt32

    PdeAddress : Int64

    Virtual : Int64

    Physical : Int64

}
