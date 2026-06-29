#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS.ahk" { D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Specifies the parameters for the output stream for a video decode operation. (D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_output_stream_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS {
    #StructPack 8

    /**
     * An [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) representing the output texture.  If decode conversion is enabled, this texture will contain the post-conversion output.  If decode conversion is not enabled, this texture will contain the decode output.
     */
    pOutputTexture2D : ID3D12Resource

    /**
     * The index of the output subresource of *pOutputTexture2D* to use.  This allows you to specify array indices if the output is an array.
     */
    OutputSubresource : UInt32

    /**
     * An optional [D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS](ns-d3d12video-d3d12_video_decode_conversion_arguments.md) structure containing output conversion parameters.
     */
    ConversionArguments : D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS

}
