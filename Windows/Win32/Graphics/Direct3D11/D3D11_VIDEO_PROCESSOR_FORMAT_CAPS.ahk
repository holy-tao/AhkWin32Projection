#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines capabilities related to input formats for a Microsoft Direct3D 11 video processor.
 * @remarks
 * 
 * These flags define video processing capabilities that usually are not needed, and that video devices are therefore not required to support.
 * 
 * The first three flags relate to RGB support for functions that are normally applied to YCbCr video: deinterlacing, color adjustment, and luma keying. A device that supports these functions for YCbCr is not required  to support them for RGB input. Supporting RGB input for these functions  is  an additional capability, reflected by these constants. Note that the driver might convert the input to another color space, perform the indicated function, and then convert the result back to RGB.
 *       
 * 
 * Similarly, a device that supports deinterlacing is not required to support deinterlacing of palettized formats. This capability is indicated by the <b>D3D11_VIDEO_PROCESSOR_FORMAT_CAPS_PALETTE_INTERLACED</b> flag.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_format_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_FORMAT_CAPS extends Win32Enum{

    /**
     * The video processor can deinterlace an input stream that contains interlaced RGB video.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FORMAT_CAPS_RGB_INTERLACED => 1

    /**
     * The video processor can perform color adjustment on RGB video.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FORMAT_CAPS_RGB_PROCAMP => 2

    /**
     * The video processor can perform luma keying on RGB video.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FORMAT_CAPS_RGB_LUMA_KEY => 4

    /**
     * The video processor can deinterlace input streams with palettized color formats.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FORMAT_CAPS_PALETTE_INTERLACED => 8
}
