#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }

/**
 * Represents data for a video decode statistics query invoked by calling ID3D12VideoDecodeCommandList::EndQuery.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_query_data_video_decode_statistics
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_QUERY_DATA_VIDEO_DECODE_STATISTICS {
    #StructPack 8

    /**
     * A member of the [D3D12_VIDEO_DECODE_STATUS](ne-d3d12video-d3d12_video_decode_status.md) enumeration indicating the video decoding status.
     */
    Status : Int64

    /**
     * If **Status** is not 0, this member contains the accelerator's estimate of the number of super-blocks in the decoded frame that were adversely affected by the reported problem. If the accelerator does not provide an estimate, the value is **D3D12\_VIDEO\_DECODE\_MACROBLOCKS\_AFFECTED\_UNKNOWN** (0xFFFFFFFFFFFFFFFF).
     */
    NumMacroblocksAffected : Int64

    /**
     * The decode frame rate.
     */
    FrameRate : DXGI_RATIONAL

    /**
     * When the **Status** returned is [D3D12_VIDEO_DECODE_STATUS_RATE_EXCEEDED](ne-d3d12video-d3d12_video_decode_status.md), this field reports the bitrate that would succeed.  This value may be used to recreate the decoder and try again.  A value of zero here is valid to indicate that the worst case bit rate should be assumed.  
     * 
     * For all other **Status** values, **BitRate** is set to zero.
     */
    BitRate : UInt32

}
