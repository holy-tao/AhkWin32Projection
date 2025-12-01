#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Dxgi\Common\DXGI_RATIONAL.ahk

/**
 * Describes a video stream for a video processor.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_content_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_CONTENT_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_frame_format">D3D11_VIDEO_FRAME_FORMAT</a> enumeration that describes how the video stream is interlaced.
     * @type {Integer}
     */
    InputFrameFormat {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The frame rate of the input video stream, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure.
     * @type {DXGI_RATIONAL}
     */
    InputFrameRate{
        get {
            if(!this.HasProp("__InputFrameRate"))
                this.__InputFrameRate := DXGI_RATIONAL(8, this)
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
     * The frame rate of the output video stream, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure.
     * @type {DXGI_RATIONAL}
     */
    OutputFrameRate{
        get {
            if(!this.HasProp("__OutputFrameRate"))
                this.__OutputFrameRate := DXGI_RATIONAL(24, this)
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

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_usage">D3D11_VIDEO_USAGE</a> enumeration that describes how the video processor will be used. The value indicates the desired trade-off between speed and video quality. The driver uses this flag as a hint when it creates the video processor.
     * @type {Integer}
     */
    Usage {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
