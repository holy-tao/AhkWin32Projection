#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines capabilities related to input formats for a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @remarks
 * 
 * These flags define video processing capabilities that are usually not needed, and therefore are not required for DXVA-HD devices to support.
 * 
 * The first three flags relate to RGB support for functions that are normally applied to YCbCr video: deinterlacing, color adjustment, and luma keying. A DXVA-HD device that supports these functions for YCbCr is not required  to support them for RGB input. Supporting RGB input for these functions  is  an additional capability, reflected by these constants. The driver might convert the input to another color space, perform the indicated function, and then convert the result back to RGB.
 * 
 * Similarly, a device that supports de-interlacing is not required to support deinterlacing of palettized formats. This capability is indicated by the <b>DXVAHD_INPUT_FORMAT_CAPS_PALETTE_INTERLACED</b> flag.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ne-dxvahd-dxvahd_input_format_caps
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_INPUT_FORMAT_CAPS extends Win32Enum{

    /**
     * The device can deinterlace an input stream that contains interlaced RGB video.
     * @type {Integer (Int32)}
     */
    static DXVAHD_INPUT_FORMAT_CAPS_RGB_INTERLACED => 1

    /**
     * The device can perform color adjustment on RGB video.
     * @type {Integer (Int32)}
     */
    static DXVAHD_INPUT_FORMAT_CAPS_RGB_PROCAMP => 2

    /**
     * The device can perform luma keying on RGB video.
     * @type {Integer (Int32)}
     */
    static DXVAHD_INPUT_FORMAT_CAPS_RGB_LUMA_KEY => 4

    /**
     * The device can deinterlace input streams with palettized color formats.
     * @type {Integer (Int32)}
     */
    static DXVAHD_INPUT_FORMAT_CAPS_PALETTE_INTERLACED => 8
}
