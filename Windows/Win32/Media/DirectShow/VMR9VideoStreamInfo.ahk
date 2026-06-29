#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VMR9_SampleFormat.ahk" { VMR9_SampleFormat }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import ".\VMR9NormalizedRect.ahk" { VMR9NormalizedRect }

/**
 * The VMR9VideoStreamInfo structure describes the rendering parameters for a video compositing operation in the VRM-9 filter. This structure is used in the IVMRImageCompositor9::CompositeImage method.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9videostreaminfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9VideoStreamInfo {
    #StructPack 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface of the Direct3D surface that contains the video to be composited.
     */
    pddsVideoSurface : IDirect3DSurface9

    /**
     * The width of the video rectangle.
     */
    dwWidth : UInt32

    /**
     * The height of the video rectangle.
     */
    dwHeight : UInt32

    /**
     * Specifies the input stream. This value corresponds to the input pin.
     */
    dwStrmID : UInt32

    /**
     * The alpha value for this stream. (Not per-pixel alpha.)
     */
    fAlpha : Float32

    /**
     * The position of the image in composition space, as a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9normalizedrect">VMR9NormalizedRect</a> structure.
     */
    rNormal : VMR9NormalizedRect

    /**
     * The start time of the video frame, in 100-nanosecond units.
     */
    rtStart : Int64

    /**
     * The end time of the video frame, in 100-nanosecond units.
     */
    rtEnd : Int64

    /**
     * The video interlacing format, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9_sampleformat">VMR9_SampleFormat</a> enumeration type.
     */
    SampleFormat : VMR9_SampleFormat

}
