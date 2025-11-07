#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_DECODE_CONFIGURATION.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk

/**
 * Describes a ID3D12VideoDecoderHeap.
 * @remarks
 * 
 * The *BitRate* and *FrameRate* parameters may be used by drivers to inform heuristics such as intermediate allocation sizes.  Decoding a frame may fail if these values are insufficient for the video stream.  Use [D3D12_QUERY_DATA_VIDEO_DECODE_STATISTICS](ns-d3d12video-d3d12_query_data_video_decode_statistics.md) to determine if the video decode succeeded.  If decode fails due to insufficient *BitRate* and *FrameRate* parameters, the *Status* field of this query is set to [D3D12_VIDEO_DECODE_STATUS_RATE_EXCEEDED](ne-d3d12video-d3d12_video_decode_status.md).  This query also returns new *BitRate* and *FrameRate* values that would succeed.
 * 
 * The *BitRate* and *FrameRate* parameters may also be set to zero.  Drivers make worst-case assumptions when these values are used which may result in higher memory consumption with some adapters.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_decoder_heap_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODER_HEAP_DESC extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The node mask specifying the physical adapter on which the video processor will be used. For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node, i.e. the device's physical adapter, to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [D3D12_VIDEO_DECODE_CONFIGURATION](ns-d3d12video-d3d12_video_decode_configuration.md) structure specifying the configuration of the video decoder.
     * @type {D3D12_VIDEO_DECODE_CONFIGURATION}
     */
    Configuration{
        get {
            if(!this.HasProp("__Configuration"))
                this.__Configuration := D3D12_VIDEO_DECODE_CONFIGURATION(8, this)
            return this.__Configuration
        }
    }

    /**
     * The decode width of the bitstream to be decoded.
     * @type {Integer}
     */
    DecodeWidth {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The decode height of the bitstream to be decoded.
     * @type {Integer}
     */
    DecodeHeight {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A [DXGI_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) structure specifying the format of the bitstream to be decoded.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The frame rate of the input video stream.  For more information, see the Remarks section.
     * @type {DXGI_RATIONAL}
     */
    FrameRate{
        get {
            if(!this.HasProp("__FrameRate"))
                this.__FrameRate := DXGI_RATIONAL(40, this)
            return this.__FrameRate
        }
    }

    /**
     * The average bits per second data compression rate for the compressed video stream.  For more information, see the Remarks section.
     * @type {Integer}
     */
    BitRate {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The maximum number of decode picture buffers this stream can have.
     * @type {Integer}
     */
    MaxDecodePictureBufferCount {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
