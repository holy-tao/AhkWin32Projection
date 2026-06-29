#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDMCBUFFERINFO {
    #StructPack 8

    dwSize : UInt32

    lpCompSurface : DDRAWI_DDRAWSURFACE_LCL.Ptr

    dwDataOffset : UInt32

    dwDataSize : UInt32

    lpPrivate : IntPtr

}
