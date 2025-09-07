#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVAHD_RATIONAL.ahk

/**
 * Describes a video stream for a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @remarks
 * Frame rates are expressed as ratios. For example, 30 frames per second (fps) is expressed as 30:1, and 29.97 fps is expressed as 30000/1001. For interlaced content, a frame consists of two fields, so that the frame rate is half the field rate.
  *       
  * 
  *  If the application will composite two or more input streams, use the largest stream for the values of <b>InputWidth</b> and <b>InputHeight</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_content_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_CONTENT_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_frame_format">DXVAHD_FRAME_FORMAT</a> enumeration that describes how the video stream is interlaced.
     * @type {Integer}
     */
    InputFrameFormat {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The frame rate of the input video stream, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_rational">DXVAHD_RATIONAL</a> structure.
     * @type {DXVAHD_RATIONAL}
     */
    InputFrameRate{
        get {
            if(!this.HasProp("__InputFrameRate"))
                this.__InputFrameRate := DXVAHD_RATIONAL(this.ptr + 8)
            return this.__InputFrameRate
        }
    }

    /**
     * The width of the input frames, in pixels.
     * @type {Integer}
     */
    InputWidth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The height of the input frames, in pixels.
     * @type {Integer}
     */
    InputHeight {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The frame rate of the output video stream, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_rational">DXVAHD_RATIONAL</a> structure.
     * @type {DXVAHD_RATIONAL}
     */
    OutputFrameRate{
        get {
            if(!this.HasProp("__OutputFrameRate"))
                this.__OutputFrameRate := DXVAHD_RATIONAL(this.ptr + 24)
            return this.__OutputFrameRate
        }
    }

    /**
     * The width of the output frames, in pixels.
     * @type {Integer}
     */
    OutputWidth {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The height of the output frames, in pixels.
     * @type {Integer}
     */
    OutputHeight {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
