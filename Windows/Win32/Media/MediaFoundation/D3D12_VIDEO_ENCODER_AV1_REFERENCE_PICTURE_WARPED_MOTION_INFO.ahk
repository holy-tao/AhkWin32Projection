#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_AV1_REFERENCE_PICTURE_WARPED_MOTION_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Integer}
     */
    TransformationType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<Int32>}
     */
    TransformationMatrix{
        get {
            if(!this.HasProp("__TransformationMatrixProxyArray"))
                this.__TransformationMatrixProxyArray := Win32FixedArray(this.ptr + 4, 8, Primitive, "int")
            return this.__TransformationMatrixProxyArray
        }
    }

    /**
     * @type {BOOL}
     */
    InvalidAffineSet {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
