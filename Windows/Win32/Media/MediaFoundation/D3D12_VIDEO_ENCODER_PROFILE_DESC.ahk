#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk" { D3D12_VIDEO_ENCODER_PROFILE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk" { D3D12_VIDEO_ENCODER_AV1_PROFILE }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_HEVC }

/**
 * Describes an encoder profile.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_profile_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_PROFILE_DESC {
    #StructPack 8

    /**
     * The data size of the provided encoder profile value.
     */
    DataSize : UInt32

    pH264Profile : D3D12_VIDEO_ENCODER_PROFILE_H264.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pHEVCProfile', { type: D3D12_VIDEO_ENCODER_PROFILE_HEVC.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pAV1Profile', { type: D3D12_VIDEO_ENCODER_AV1_PROFILE.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
