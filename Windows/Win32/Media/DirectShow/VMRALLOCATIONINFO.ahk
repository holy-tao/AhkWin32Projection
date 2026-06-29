#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\DirectDraw\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The VMRALLOCATIONINFO structure is used in the VMR-7 filter's IVMRSurfaceAllocator::AllocateSurface method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrallocationinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMRALLOCATIONINFO {
    #StructPack 8

    /**
     * A bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrsurfaceallocationflags">VMRSurfaceAllocationFlags</a> enumeration.
     */
    dwFlags : UInt32

    /**
     * Pointer to the <b>BITMAPINFOHEADER</b> structure associated with the surface.
     */
    lpHdr : BITMAPINFOHEADER.Ptr

    /**
     * Pointer to the <b>DDPIXELFORMAT</b> structure associated with the surface.
     */
    lpPixFmt : DDPIXELFORMAT.Ptr

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure that specifies the aspect ratio of the new surface.
     */
    szAspectRatio : SIZE

    /**
     * The minimum number of buffers to create for this surface.
     */
    dwMinBuffers : UInt32

    /**
     * The maximum number of buffers to create for this surface.
     */
    dwMaxBuffers : UInt32

    /**
     * A bitwise <b>OR</b> of  flags that indicate the interlacing. For a list of flags, see the <b>dwInterlaceFlags</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> structure.
     */
    dwInterlaceFlags : UInt32

    /**
     * The size of the native video rectangle.
     */
    szNativeSize : SIZE

}
