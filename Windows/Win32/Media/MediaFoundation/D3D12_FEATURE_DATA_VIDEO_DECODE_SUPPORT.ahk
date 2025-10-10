#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_DECODE_CONFIGURATION.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk

/**
 * Retrieves support information for video decoding.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_feature_data_video_decode_support
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_DECODE_SUPPORT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [D3D12\_VIDEO\_DECODE\_CONFIGURATION](ns-d3d12video-d3d12_video_decode_configuration.md) structure specifying the decode profile, bitstream encryption, and interlace type of the source stream.
     * @type {D3D12_VIDEO_DECODE_CONFIGURATION}
     */
    Configuration{
        get {
            if(!this.HasProp("__Configuration"))
                this.__Configuration := D3D12_VIDEO_DECODE_CONFIGURATION(this.ptr + 8)
            return this.__Configuration
        }
    }

    /**
     * The decode width of the source stream.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The decode height of the source stream
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The [DXGI\_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) to use as the decode format.  This format is the output format if no decoder conversion is specified.
     * @type {Integer}
     */
    DecodeFormat {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The frame rate of the video format. A value of 0 means the frame rate is unknown.
     * @type {DXGI_RATIONAL}
     */
    FrameRate{
        get {
            if(!this.HasProp("__FrameRate"))
                this.__FrameRate := DXGI_RATIONAL(this.ptr + 40)
            return this.__FrameRate
        }
    }

    /**
     * The average bits per second data compression rate for the compressed video stream.  This information is used by the driver to determine whether the video can be decoded in real-time. A value of 0 means the bit rate is unknown.
     * @type {Integer}
     */
    BitRate {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A combination of values from the [D3D12\_VIDEO\_DECODE\_SUPPORT\_FLAGS](ne-d3d12video-d3d12_video_decode_support_flags.md) enumeration indicating the support for video decoding. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * A combination of values from the [D3D12\_VIDEO\_DECODE\_CONFIGURATION\_FLAGS](ne-d3d12video-d3d12_video_decode_configuration_flags.md) eumeration describing the video decode configuration. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     * @type {Integer}
     */
    ConfigurationFlags {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * A member of the [D3D12\_VIDEO\_DECODE\_TIER](ne-d3d12video-d3d12_video_decode_tier.md) enumeration specifying the decoding tier of a hardware video decoder.
     * @type {Integer}
     */
    DecodeTier {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }
}
