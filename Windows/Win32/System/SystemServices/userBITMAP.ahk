#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct userBITMAP {
    #StructPack 4

    bmType : Int32

    bmWidth : Int32

    bmHeight : Int32

    bmWidthBytes : Int32

    bmPlanes : UInt16

    bmBitsPixel : UInt16

    cbSize : UInt32 := this.Size

    pBuffer : Int8[1]

}
