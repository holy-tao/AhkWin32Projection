#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SCATTER_GATHER_ELEMENT {
    #StructPack 8

    Address : Int64

    Length : UInt32

    Reserved : IntPtr

}
