#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Specifies the parameters for decode output conversion. (D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS)
 * @remarks
 * Scaling is specified by the difference between the native decode texture size and the output texture size.
 * 
 * Use [D3D12_FEATURE_VIDEO_DECODE_CONVERSION_SUPPORT](ne-d3d12video-d3d12_feature_video.md) to determine if a conversion combination is supported.
 * 
 * The source and destination resolution and format are communicated by the resource properties of decode textures and the output buffer specified in [ID3D12VideoCommandList::DecodeFrame](nf-d3d12video-id3d12videodecodecommandlist-decodeframe.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_conversion_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS {
    #StructPack 8

    /**
     * A boolean value indicating whether decode conversion should be used.
     */
    Enable : BOOL

    /**
     * A pointer to an [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) containing the native decoding output. When downsampling is enabled, the output at native decode resolution, color space, and format may be required for future decode submissions (as reference frames, for instance).
     */
    pReferenceTexture2D : ID3D12Resource

    /**
     * The subresource index of the resource provided in *pDecodeTexture2D* to use.
     */
    ReferenceSubresource : UInt32

    /**
     * A value from the [DXGI_COLOR_SPACE_TYPE](/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) enumeration specifying the target color space of the output.
     */
    OutputColorSpace : DXGI_COLOR_SPACE_TYPE

    /**
     * A value from the [DXGI_COLOR_SPACE_TYPE](/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) enumeration specifying the source-decoded color space before conversion.
     */
    DecodeColorSpace : DXGI_COLOR_SPACE_TYPE

}
