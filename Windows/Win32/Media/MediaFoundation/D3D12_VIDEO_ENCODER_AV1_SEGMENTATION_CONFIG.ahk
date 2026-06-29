#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_AV1_SEGMENT_DATA.ahk" { D3D12_VIDEO_ENCODER_AV1_SEGMENT_DATA }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_CONFIG {
    #StructPack 8

    UpdateMap : Int64

    TemporalUpdate : Int64

    UpdateData : Int64

    NumSegments : Int64

    SegmentsData : D3D12_VIDEO_ENCODER_AV1_SEGMENT_DATA[8]

}
