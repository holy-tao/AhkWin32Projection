#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_SET_MAINTENANCE_MODE_INPUT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    InMaintenance{
        get {
            if(!this.HasProp("__InMaintenance"))
                this.__InMaintenance := BOOL(this.ptr + 0)
            return this.__InMaintenance
        }
    }

    /**
     * @type {Integer}
     */
    ExtraParameterSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    ExtraParameter{
        get {
            if(!this.HasProp("__ExtraParameterProxyArray"))
                this.__ExtraParameterProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__ExtraParameterProxyArray
        }
    }
}
