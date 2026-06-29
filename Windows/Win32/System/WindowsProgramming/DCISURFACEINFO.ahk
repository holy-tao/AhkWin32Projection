#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct DCISURFACEINFO {
    #StructPack 8

    dwSize : UInt32

    dwDCICaps : UInt32

    dwCompression : UInt32

    dwMask : UInt32[3]

    dwWidth : UInt32

    dwHeight : UInt32

    lStride : Int32

    dwBitCount : UInt32

    dwOffSurface : IntPtr

    wSelSurface : UInt16

    wReserved : UInt16

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    dwReserved3 : UInt32

    BeginAccess : IntPtr

    EndAccess : IntPtr

    DestroySurface : IntPtr

}
