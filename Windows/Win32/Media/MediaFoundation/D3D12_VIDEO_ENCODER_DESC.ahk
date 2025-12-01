#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk

/**
 * Describes an ID3D12VideoEncoder.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_DESC extends Win32Struct
{
    static sizeof => 64

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
     * A bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_FLAGS](ne-d3d12video-d3d12_video_encoder_flags.md) specifying the flags for encoder creation.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) specifying the desired codec.
     * @type {Integer}
     */
    EncodeCodec {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the desired encoding profile.
     * @type {D3D12_VIDEO_ENCODER_PROFILE_DESC}
     */
    EncodeProfile{
        get {
            if(!this.HasProp("__EncodeProfile"))
                this.__EncodeProfile := D3D12_VIDEO_ENCODER_PROFILE_DESC(16, this)
            return this.__EncodeProfile
        }
    }

    /**
     * A [DXGI_FORMAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) specifying the format of the source stream.
     * @type {Integer}
     */
    InputFormat {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION](ns-d3d12video-d3d12_video_encoder_codec_configuration.md) structure specifying codec configuration parameters.
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION}
     */
    CodecConfiguration{
        get {
            if(!this.HasProp("__CodecConfiguration"))
                this.__CodecConfiguration := D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION(40, this)
            return this.__CodecConfiguration
        }
    }

    /**
     * A value from the [D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE](ne-d3d12video-d3d12_video_encoder_motion_estimation_precision_mode.md) enumeration the maximum number of motion vectors allowed.
     * @type {Integer}
     */
    MaxMotionEstimationPrecision {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
