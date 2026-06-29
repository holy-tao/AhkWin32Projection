#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264.ahk" { D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_CODEC_DATA.ahk" { D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_CODEC_DATA }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC.ahk" { D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC1.ahk" { D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC1 }

/**
 * Represents the picture level control elements for the associated EncodeFrame command for multiple codecs.
 * @remarks
 * Slice-level picture reference lists reordering is unsupported.
 * 
 * Weighted inter-prediction is unsupported.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_picture_control_codec_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA {
    #StructPack 8

    /**
     * The data size of the provided picture level control structure.
     */
    DataSize : UInt32

    pH264PicData : D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pHEVCPicData', { type: D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pHEVCPicData1', { type: D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC1.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pAV1PicData', { type: D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_CODEC_DATA.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
