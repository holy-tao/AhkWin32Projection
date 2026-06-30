#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MF_FLOAT3.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MF_QUATERNION.ahk
#Include .\MFCameraExtrinsic_CalibratedTransform.ahk

/**
 * Describes the location of a camera relative to other cameras or an established external reference.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mfcameraextrinsics
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFCameraExtrinsics extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

    /**
     * The number of transforms in the <i>CalibratedTransforms</i> array.
     * @type {Integer}
     */
    TransformCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The array of transforms in the extrinsic data.
     * @type {MFCameraExtrinsic_CalibratedTransform}
     */
    CalibratedTransforms {
        get {
            if(!this.HasProp("__CalibratedTransformsProxyArray"))
                this.__CalibratedTransformsProxyArray := Win32FixedArray(this.ptr + 4, 1, MFCameraExtrinsic_CalibratedTransform, "")
            return this.__CalibratedTransformsProxyArray
        }
    }
}
