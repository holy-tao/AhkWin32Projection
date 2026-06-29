#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DDNT_GETFORMATCOUNTDATA {
    #StructPack 8

    gdi2 : IntPtr

    dwFormatCount : UInt32

    dwReserved : UInt32

}
