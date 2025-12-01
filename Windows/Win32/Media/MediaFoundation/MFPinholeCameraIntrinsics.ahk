#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MF_FLOAT2.ahk
#Include .\MFCameraIntrinsic_PinholeCameraModel.ahk
#Include .\MFCameraIntrinsic_DistortionModel.ahk
#Include .\MFPinholeCameraIntrinsic_IntrinsicModel.ahk

/**
 * Contains zero or 1 pinhole camera intrinsic models that describe how to project a 3D point in physical world onto the 2D image frame of a camera.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mfpinholecameraintrinsics
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFPinholeCameraIntrinsics extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of camera intrinsic models in the <i>IntrinsicModels</i> array.
     * @type {Integer}
     */
    IntrinsicModelCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The array of camera intrinsic models in the intrinsic data.
     * @type {Array<MFPinholeCameraIntrinsic_IntrinsicModel>}
     */
    IntrinsicModels{
        get {
            if(!this.HasProp("__IntrinsicModelsProxyArray"))
                this.__IntrinsicModelsProxyArray := Win32FixedArray(this.ptr + 8, 1, MFPinholeCameraIntrinsic_IntrinsicModel, "")
            return this.__IntrinsicModelsProxyArray
        }
    }
}
