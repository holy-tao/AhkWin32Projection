#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_CONFIG {
    #StructPack 8

    LoopFilterLevel : Int64[2]

    LoopFilterLevelU : Int64

    LoopFilterLevelV : Int64

    LoopFilterSharpnessLevel : Int64

    LoopFilterDeltaEnabled : Int64

    UpdateRefDelta : Int64

    RefDeltas : Int64[8]

    UpdateModeDelta : Int64

    ModeDeltas : Int64[2]

}
