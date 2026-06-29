#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFCameraIntrinsic_DistortionModel.ahk" { MFCameraIntrinsic_DistortionModel }
#Import ".\MF_FLOAT2.ahk" { MF_FLOAT2 }
#Import ".\MFCameraIntrinsic_PinholeCameraModel.ahk" { MFCameraIntrinsic_PinholeCameraModel }

/**
 * Represents a pinhole camera intrinsic model for a specified resolution.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mfpinholecameraintrinsic_intrinsicmodel
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFPinholeCameraIntrinsic_IntrinsicModel {
    #StructPack 4

    /**
     * The width for the pinhole camera intrinsic model, in pixels.
     */
    Width : UInt32

    /**
     * The height for the pinhole camera intrinsic model, in pixels.
     */
    Height : UInt32

    /**
     * The pinhole camera model.
     */
    CameraModel : MFCameraIntrinsic_PinholeCameraModel

    /**
     * The lens distortion model.
     */
    DistortionModel : MFCameraIntrinsic_DistortionModel

}
