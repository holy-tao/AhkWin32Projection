#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_PROCESSOR_IDENTIFICATION_ARM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Model {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<SByte>}
     */
    VendorString{
        get {
            if(!this.HasProp("__VendorStringProxyArray"))
                this.__VendorStringProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__VendorStringProxyArray
        }
    }
}
