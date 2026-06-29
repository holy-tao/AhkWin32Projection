#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\DirectDraw\IDirectDrawSurface7.ahk" { IDirectDrawSurface7 }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * The VMRPRESENTATIONINFO structure is used in the IVMRImagePresenter::PresentImage method (VMR-7 only).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrpresentationinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMRPRESENTATIONINFO {
    #StructPack 8

    /**
     * A bitwise combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrpresentationflags">VMRPresentationFlags</a> enumeration, which describe the status of the video sample with respect to its presentation time.
     */
    dwFlags : UInt32

    /**
     * Pointer to the DirectDraw surface that contains the video frame to be presented.
     */
    lpSurf : IDirectDrawSurface7

    /**
     * The start time for the current frame, in 100-nanosecond units.
     */
    rtStart : Int64

    /**
     * The end time for the current frame, in 100-nanosecond units.
     */
    rtEnd : Int64

    /**
     * The aspect ratio of the rectangle.
     */
    szAspectRatio : SIZE

    /**
     * The source rectangle.
     */
    rcSrc : RECT

    /**
     * The destination rectangle.
     */
    rcDst : RECT

    /**
     * Bitwise combination of flags, as defined for the [AM_SAMPLE2_PROPERTIES](/windows/win32/api/strmif/ns-strmif-am_sample2_properties) structure.
     */
    dwTypeSpecificFlags : UInt32

    /**
     * Bitwise combination of flags, as defined for the <b>dwInterlaceFlags</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> structure.
     */
    dwInterlaceFlags : UInt32

}
