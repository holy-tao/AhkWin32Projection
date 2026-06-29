#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct VRAM_SURFACE_INFO {
    #StructPack 8

    hSurface : IntPtr

    VramPhysicalAddress : Int64

    cbCaptured : UInt32

    dwWidth : UInt32

    dwHeight : UInt32

    dwLinearSize : UInt32

    lPitch : Int32

    ullReserved : Int64[16]

}
