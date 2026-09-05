#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_COMP_PREDICTION_TYPE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_COMP_PREDICTION_TYPE_SINGLE_REFERENCE
     * @type {Integer (Int32)}
     */
    static SINGLE_REFERENCE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_COMP_PREDICTION_TYPE_COMPOUND_REFERENCE
     * @type {Integer (Int32)}
     */
    static COMPOUND_REFERENCE => 1
}
