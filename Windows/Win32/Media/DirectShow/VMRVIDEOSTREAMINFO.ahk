#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NORMALIZEDRECT.ahk" { NORMALIZEDRECT }
#Import "..\..\Graphics\DirectDraw\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import "..\..\Graphics\DirectDraw\IDirectDrawSurface7.ahk" { IDirectDrawSurface7 }

/**
 * This topic applies to Windows XP or later. The VMRVIDEOSTREAMINFO structure is used in the VMR-7 filter's call to IVMRImageCompositor::CompositeImage on the image compositor.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrvideostreaminfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMRVIDEOSTREAMINFO {
    #StructPack 8

    /**
     * Specifies the DirectDraw surface that contains the video to be composited.
     */
    pddsVideoSurface : IDirectDrawSurface7

    /**
     * Specifies the width of the video rectangle.
     */
    dwWidth : UInt32

    /**
     * Specifies the height of the video rectangle.
     */
    dwHeight : UInt32

    /**
     * Specifies the input stream. This value corresponds to the input pin.
     */
    dwStrmID : UInt32

    /**
     * Specifies the alpha value for this stream. (Not per-pixel alpha.)
     */
    fAlpha : Float32

    /**
     * Specifies the source color key value or -1 if color keying is not to be used for this stream.
     */
    ddClrKey : DDCOLORKEY

    /**
     * Specifies the position of the image in composition space.
     */
    rNormal : NORMALIZEDRECT

}
