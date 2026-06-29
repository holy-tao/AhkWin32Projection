#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFCameraIntrinsic_DistortionModelArcTan {
    #StructPack 4

    Radial_k0 : Float32

    DistortionCenter_x : Float32

    DistortionCenter_y : Float32

    Tangential_x : Float32

    Tangential_y : Float32

}
