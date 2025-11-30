#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATISTICS_POLICY extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Array<UInt64>}
     */
    PreferApertureForRead{
        get {
            if(!this.HasProp("__PreferApertureForReadProxyArray"))
                this.__PreferApertureForReadProxyArray := Win32FixedArray(this.ptr + 0, 5, Primitive, "uint")
            return this.__PreferApertureForReadProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    PreferAperture{
        get {
            if(!this.HasProp("__PreferApertureProxyArray"))
                this.__PreferApertureProxyArray := Win32FixedArray(this.ptr + 40, 5, Primitive, "uint")
            return this.__PreferApertureProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    MemResetOnPaging {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    RemovePagesFromWorkingSetOnPaging {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    MigrationEnabled {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
