#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PREDICT_FAILURE extends Win32Struct
{
    static sizeof => 516

    static packingSize => 4

    /**
     * @type {Integer}
     */
    PredictFailure {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    VendorSpecific{
        get {
            if(!this.HasProp("__VendorSpecificProxyArray"))
                this.__VendorSpecificProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__VendorSpecificProxyArray
        }
    }
}
