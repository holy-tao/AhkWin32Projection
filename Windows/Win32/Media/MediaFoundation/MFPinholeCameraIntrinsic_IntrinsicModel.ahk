#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MF_FLOAT2.ahk
#Include .\MFCameraIntrinsic_PinholeCameraModel.ahk
#Include .\MFCameraIntrinsic_DistortionModel.ahk

/**
 * Represents a pinhole camera intrinsic model for a specified resolution.
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-mfpinholecameraintrinsic_intrinsicmodel
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFPinholeCameraIntrinsic_IntrinsicModel extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The width for the pinhole camera intrinsic model, in pixels.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height for the pinhole camera intrinsic model, in pixels.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The pinhole camera model.
     * @type {MFCameraIntrinsic_PinholeCameraModel}
     */
    CameraModel{
        get {
            if(!this.HasProp("__CameraModel"))
                this.__CameraModel := MFCameraIntrinsic_PinholeCameraModel(8, this)
            return this.__CameraModel
        }
    }

    /**
     * The lens distortion model.
     * @type {MFCameraIntrinsic_DistortionModel}
     */
    DistortionModel{
        get {
            if(!this.HasProp("__DistortionModel"))
                this.__DistortionModel := MFCameraIntrinsic_DistortionModel(24, this)
            return this.__DistortionModel
        }
    }
}
