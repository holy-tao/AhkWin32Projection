#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines custom color primaries for a video source. The color primaries define how to convert colors from RGB color space to CIE XYZ color space.
 * @remarks
 * 
  * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-custom-video-primaries-attribute">MF_MT_CUSTOM_VIDEO_PRIMARIES</a> attribute.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-mt_custom_video_primaries
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MT_CUSTOM_VIDEO_PRIMARIES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Red x-coordinate.
     * @type {Float}
     */
    fRx {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Red y-coordinate.
     * @type {Float}
     */
    fRy {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Green x-coordinate.
     * @type {Float}
     */
    fGx {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Green y-coordinate.
     * @type {Float}
     */
    fGy {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Blue x-coordinate.
     * @type {Float}
     */
    fBx {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Blue y-coordinate.
     * @type {Float}
     */
    fBy {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * White point x-coordinate.
     * @type {Float}
     */
    fWx {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * White point y-coordinate.
     * @type {Float}
     */
    fWy {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }
}
