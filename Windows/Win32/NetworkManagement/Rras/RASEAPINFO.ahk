#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASEAPINFO {
    #StructPack 8

    dwSizeofEapInfo : UInt32

    pbEapInfo : IntPtr

}
