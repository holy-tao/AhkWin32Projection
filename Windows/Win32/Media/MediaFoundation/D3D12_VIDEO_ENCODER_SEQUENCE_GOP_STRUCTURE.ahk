#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_H264.ahk" { D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_HEVC.ahk" { D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_AV1_SEQUENCE_STRUCTURE.ahk" { D3D12_VIDEO_ENCODER_AV1_SEQUENCE_STRUCTURE }

/**
 * Represents the GOP structure for multiple video codecs.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_sequence_gop_structure
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE {
    #StructPack 8

    /**
     * The data size of the provided encoder GOP structure.
     */
    DataSize : UInt32

    pH264GroupOfPictures : D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_H264.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pHEVCGroupOfPictures', { type: D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_HEVC.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pAV1SequenceStructure', { type: D3D12_VIDEO_ENCODER_AV1_SEQUENCE_STRUCTURE.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
