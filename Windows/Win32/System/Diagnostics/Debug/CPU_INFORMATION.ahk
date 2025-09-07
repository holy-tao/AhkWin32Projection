#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class CPU_INFORMATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Array<UInt32>}
     */
    VendorId{
        get {
            if(!this.HasProp("__VendorIdProxyArray"))
                this.__VendorIdProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__VendorIdProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    VersionInformation {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    FeatureInformation {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    AMDExtendedCpuFeatures {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<UInt64>}
     */
    ProcessorFeatures{
        get {
            if(!this.HasProp("__ProcessorFeaturesProxyArray"))
                this.__ProcessorFeaturesProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "uint")
            return this.__ProcessorFeaturesProxyArray
        }
    }
}
