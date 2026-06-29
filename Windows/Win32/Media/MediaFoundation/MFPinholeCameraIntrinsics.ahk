#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFCameraIntrinsic_DistortionModel.ahk" { MFCameraIntrinsic_DistortionModel }
#Import ".\MF_FLOAT2.ahk" { MF_FLOAT2 }
#Import ".\MFPinholeCameraIntrinsic_IntrinsicModel.ahk" { MFPinholeCameraIntrinsic_IntrinsicModel }
#Import ".\MFCameraIntrinsic_PinholeCameraModel.ahk" { MFCameraIntrinsic_PinholeCameraModel }

/**
 * Contains zero or 1 pinhole camera intrinsic models that describe how to project a 3D point in physical world onto the 2D image frame of a camera.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mfpinholecameraintrinsics
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFPinholeCameraIntrinsics {
    #StructPack 4

    /**
     * The number of camera intrinsic models in the <i>IntrinsicModels</i> array.
     */
    IntrinsicModelCount : UInt32

    /**
     * The array of camera intrinsic models in the intrinsic data.
     */
    IntrinsicModels : MFPinholeCameraIntrinsic_IntrinsicModel[1]

}
