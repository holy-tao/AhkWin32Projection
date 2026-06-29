#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_BITSTREAM_ENCRYPTION_TYPE.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_VIDEO_DECODE_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE.ahk

/**
 * Describes a ID3D12VideoDecoder.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decoder_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_DECODER_DESC extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

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
    Configuration {
        get {
            if(!this.HasProp("__Configuration"))
                this.__Configuration := D3D12_VIDEO_DECODE_CONFIGURATION(4, this)
            return this.__Configuration
        }
    }
}
