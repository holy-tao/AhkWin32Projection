#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk

/**
 * Represents data for a video decode statistics query invoked by calling ID3D12VideoDecodeCommandList::EndQuery.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_query_data_video_decode_statistics
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_QUERY_DATA_VIDEO_DECODE_STATISTICS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A member of the [D3D12_VIDEO_DECODE_STATUS](ne-d3d12video-d3d12_video_decode_status.md) enumeration indicating the video decoding status.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If **Status** is not 0, this member contains the accelerator's estimate of the number of super-blocks in the decoded frame that were adversely affected by the reported problem. If the accelerator does not provide an estimate, the value is **D3D12\_VIDEO\_DECODE\_MACROBLOCKS\_AFFECTED\_UNKNOWN** (0xFFFFFFFFFFFFFFFF).
     * @type {Integer}
     */
    NumMacroblocksAffected {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The decode frame rate.
     * @type {DXGI_RATIONAL}
     */
    FrameRate{
        get {
            if(!this.HasProp("__FrameRate"))
                this.__FrameRate := DXGI_RATIONAL(this.ptr + 16)
            return this.__FrameRate
        }
    }

    /**
     * When the **Status** returned is [D3D12_VIDEO_DECODE_STATUS_RATE_EXCEEDED](ne-d3d12video-d3d12_video_decode_status.md), this field reports the bitrate that would succeed.  This value may be used to recreate the decoder and try again.  A value of zero here is valid to indicate that the worst case bit rate should be assumed.  
     * 
     * For all other **Status** values, **BitRate** is set to zero.
     * @type {Integer}
     */
    BitRate {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
