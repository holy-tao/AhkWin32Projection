#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves a value indicating if the specified codec is supported for video encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_codec
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_CODEC extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which encoder support is being queried.
     * @type {Integer}
     */
    Codec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Receives a boolean value indicating if the specified codec is supported.
     * @type {Integer}
     */
    IsSupported {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
