#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_AV1_CDEF_CONFIG {
    #StructPack 8

    CdefBits : Int64

    CdefDampingMinus3 : Int64

    CdefYPriStrength : Int64[8]

    CdefUVPriStrength : Int64[8]

    CdefYSecStrength : Int64[8]

    CdefUVSecStrength : Int64[8]

}
