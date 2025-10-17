#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WIA_PATCH_CODE_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIA_PATCH_CODES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Tag {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<WIA_PATCH_CODE_INFO>}
     */
    PatchCodes{
        get {
            if(!this.HasProp("__PatchCodesProxyArray"))
                this.__PatchCodesProxyArray := Win32FixedArray(this.ptr + 16, 1, WIA_PATCH_CODE_INFO, "")
            return this.__PatchCodesProxyArray
        }
    }
}
