#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_CONFIG {
    #StructPack 8

    BaseQIndex : Int64

    YDCDeltaQ : Int64

    UDCDeltaQ : Int64

    UACDeltaQ : Int64

    VDCDeltaQ : Int64

    VACDeltaQ : Int64

    UsingQMatrix : Int64

    QMY : Int64

    QMU : Int64

    QMV : Int64

}
