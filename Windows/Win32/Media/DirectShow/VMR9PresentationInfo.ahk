#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * The VMR9PresentationInfo structure is used with the VMR-9 in the IVMRImagePresenter9::PresentImage method.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9presentationinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9PresentationInfo {
    #StructPack 8

    /**
     * Contains a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9presentationflags">VMR9PresentationFlags</a> enumeration type. These flags describe the status of the video sample with respect to its presentation time.
     */
    dwFlags : UInt32

    /**
     * Pointer to the DirectDraw surface that contains the video frame.
     */
    lpSurf : IDirect3DSurface9

    /**
     * Specifies the start time for the video frame.
     */
    rtStart : Int64

    /**
     * Specifies the end time for the video frame
     */
    rtEnd : Int64

    /**
     * Specifies the aspect ratio of the video, as a <b>SIZE</b> structure.
     */
    szAspectRatio : SIZE

    /**
     * Specifies the source rectangle.
     */
    rcSrc : RECT

    /**
     * Specifies the destination rectangle.
     */
    rcDst : RECT

    /**
     * Reserved.
     */
    dwReserved1 : UInt32

    /**
     * Reserved.
     */
    dwReserved2 : UInt32

}
