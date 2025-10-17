#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk

/**
 * Specifies output stream arguments for the output passed to ID3D12VideoProcessCommandList::ProcessFrames.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_process_output_stream_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A [DXGI_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) structure specifying the format of the output resources.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A [DXGI_COLOR_SPACE_TYPE](/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) value that specifies the colorspace for the video processor output surface.
     * @type {Integer}
     */
    ColorSpace {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A value from the [D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE](ne-d3d12video-d3d12_video_process_alpha_fill_mode.md) enumeration specifying the alpha fill mode for data that the video processor writes to the render target.
     * @type {Integer}
     */
    AlphaFillMode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The zero-based index of an input stream. This parameter is used if *AlphaFillMode* is [D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_SOURCE_STREAM](ne-d3d12video-d3d12_video_process_alpha_fill_mode.md). Otherwise, the parameter is ignored.
     * @type {Integer}
     */
    AlphaFillModeSourceStreamIndex {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The video processor uses the background color to fill areas of the target rectangle that do not contain a video image. Areas outside the target rectangle are not affected.  The meaning of the values are specified by the *ColorSpace* parameter.
     * 
     * | BackgroundColor   | YCbCrA   | RGBA    |
     * |-------------------|----------|---------|
     * | BackgroundColor[0]| Y        | R       |
     * | BackgroundColor[1]| Cb       | G       |
     * | BackgroundColor[2]| Cr       | B       |
     * | BackgroundColor[3]| A        | A       |
     * @type {Array<Single>}
     */
    BackgroundColor{
        get {
            if(!this.HasProp("__BackgroundColorProxyArray"))
                this.__BackgroundColorProxyArray := Win32FixedArray(this.ptr + 16, 4, Primitive, "float")
            return this.__BackgroundColorProxyArray
        }
    }

    /**
     * A [DXGI_RATIONAL](/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational) structure specifying the frame rate of the output video stream.
     * @type {DXGI_RATIONAL}
     */
    FrameRate{
        get {
            if(!this.HasProp("__FrameRate"))
                this.__FrameRate := DXGI_RATIONAL(32, this)
            return this.__FrameRate
        }
    }

    /**
     * If TRUE, stereo output is enabled. Otherwise, the video processor produces mono video frames.
     * @type {BOOL}
     */
    EnableStereo {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
