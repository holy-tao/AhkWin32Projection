#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a polynomial lens distortion model.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mfcameraintrinsic_distortionmodel
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCameraIntrinsic_DistortionModel extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The first radial distortion coefficient.
     * @type {Float}
     */
    Radial_k1 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The second radial distortion coefficient.
     * @type {Float}
     */
    Radial_k2 {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The third radial distortion coefficient.
     * @type {Float}
     */
    Radial_k3 {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The first tangential distortion coefficient.
     * @type {Float}
     */
    Tangential_p1 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * The second tangential distortion coefficient.
     * @type {Float}
     */
    Tangential_p2 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }
}
