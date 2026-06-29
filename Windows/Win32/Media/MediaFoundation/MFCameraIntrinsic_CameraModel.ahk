#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFCameraIntrinsic_CameraModel {
    #StructPack 4

    FocalLength_x : Float32

    FocalLength_y : Float32

    PrincipalPoint_x : Float32

    PrincipalPoint_y : Float32

}
