#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFCameraIntrinsic_CameraModel.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFExtendedCameraIntrinsic_IntrinsicModel extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SplitFrameId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {MFCameraIntrinsic_CameraModel}
     */
    CameraModel{
        get {
            if(!this.HasProp("__CameraModel"))
                this.__CameraModel := MFCameraIntrinsic_CameraModel(12, this)
            return this.__CameraModel
        }
    }
}
