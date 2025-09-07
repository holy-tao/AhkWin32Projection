#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCameraIntrinsic_CameraModel extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Float}
     */
    FocalLength_x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    FocalLength_y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    PrincipalPoint_x {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    PrincipalPoint_y {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
