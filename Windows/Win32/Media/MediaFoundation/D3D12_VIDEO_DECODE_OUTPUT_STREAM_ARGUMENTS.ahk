#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS.ahk

/**
 * Specifies the parameters for the output stream for a video decode operation. (D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS)
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_output_stream_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * An [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) representing the output texture.  If decode conversion is enabled, this texture will contain the post-conversion output.  If decode conversion is not enabled, this texture will contain the decode output.
     * @type {Pointer<ID3D12Resource>}
     */
    pOutputTexture2D {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The index of the output subresource of *pOutputTexture2D* to use.  This allows you to specify array indices if the output is an array.
     * @type {Integer}
     */
    OutputSubresource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An optional [D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS](ns-d3d12video-d3d12_video_decode_conversion_arguments.md) structure containing output conversion parameters.
     * @type {D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS}
     */
    ConversionArguments{
        get {
            if(!this.HasProp("__ConversionArguments"))
                this.__ConversionArguments := D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS(this.ptr + 16)
            return this.__ConversionArguments
        }
    }
}
