#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the parameters for decode output conversion.
 * @remarks
 * 
  * Scaling is specified by the difference between the native decode texture size and the output texture size.
  * 
  * Use [D3D12_FEATURE_VIDEO_DECODE_CONVERSION_SUPPORT](ne-d3d12video-d3d12_feature_video.md) to determine if a conversion combination is supported.
  * 
  * The source and destination resolution and format are communicated by the resource properties of decode textures and the output buffer specified in [ID3D12VideoCommandList::DecodeFrame](nf-d3d12video-id3d12videodecodecommandlist-decodeframe.md).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_decode_conversion_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A boolean value indicating whether decode conversion should be used.
     * @type {BOOL}
     */
    Enable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A pointer to an [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) containing the native decoding output. When downsampling is enabled, the output at native decode resolution, color space, and format may be required for future decode submissions (as reference frames, for instance).
     * @type {Pointer<ID3D12Resource>}
     */
    pReferenceTexture2D {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The subresource index of the resource provided in *pDecodeTexture2D* to use.
     * @type {Integer}
     */
    ReferenceSubresource {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A value from the [DXGI_COLOR_SPACE_TYPE](/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) enumeration specifying the target color space of the output.
     * @type {Integer}
     */
    OutputColorSpace {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A value from the [DXGI_COLOR_SPACE_TYPE](/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) enumeration specifying the source-decoded color space before conversion.
     * @type {Integer}
     */
    DecodeColorSpace {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
