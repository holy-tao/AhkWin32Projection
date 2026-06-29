#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFCameraIntrinsic_CameraModel.ahk" { MFCameraIntrinsic_CameraModel }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFExtendedCameraIntrinsic_IntrinsicModel {
    #StructPack 4

    Width : UInt32

    Height : UInt32

    SplitFrameId : UInt32

    CameraModel : MFCameraIntrinsic_CameraModel

}
