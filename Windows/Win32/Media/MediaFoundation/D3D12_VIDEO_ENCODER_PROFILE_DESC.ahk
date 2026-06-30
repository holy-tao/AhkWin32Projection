#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk

/**
 * Describes an encoder profile.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_profile_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_PROFILE_DESC extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * The data size of the provided encoder profile value.
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_PROFILE_H264>}
     */
    pH264Profile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_PROFILE_HEVC>}
     */
    pHEVCProfile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_AV1_PROFILE>}
     */
    pAV1Profile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
