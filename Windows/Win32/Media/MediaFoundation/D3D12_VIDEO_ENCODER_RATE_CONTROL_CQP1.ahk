#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP1 {
    #StructPack 4

    ConstantQP_FullIntracodedFrame : UInt32

    ConstantQP_InterPredictedFrame_PrevRefOnly : UInt32

    ConstantQP_InterPredictedFrame_BiDirectionalRef : UInt32

    QualityVsSpeed : UInt32

}
