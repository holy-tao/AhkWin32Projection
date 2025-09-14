#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_ANALYSIS_PROCESSOR_INFO extends Win32Struct
{
    static sizeof => 328

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Model {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Family {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Stepping {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Architecture {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    CurrentClockSpeed {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    CurrentVoltage {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    MaxClockSpeed {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ProcessorType {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Array<SByte>}
     */
    DeviceID{
        get {
            if(!this.HasProp("__DeviceIDProxyArray"))
                this.__DeviceIDProxyArray := Win32FixedArray(this.ptr + 40, 32, Primitive, "char")
            return this.__DeviceIDProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    Manufacturer{
        get {
            if(!this.HasProp("__ManufacturerProxyArray"))
                this.__ManufacturerProxyArray := Win32FixedArray(this.ptr + 72, 64, Primitive, "char")
            return this.__ManufacturerProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    Name{
        get {
            if(!this.HasProp("__NameProxyArray"))
                this.__NameProxyArray := Win32FixedArray(this.ptr + 136, 64, Primitive, "char")
            return this.__NameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    Version{
        get {
            if(!this.HasProp("__VersionProxyArray"))
                this.__VersionProxyArray := Win32FixedArray(this.ptr + 200, 64, Primitive, "char")
            return this.__VersionProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    Description{
        get {
            if(!this.HasProp("__DescriptionProxyArray"))
                this.__DescriptionProxyArray := Win32FixedArray(this.ptr + 264, 64, Primitive, "char")
            return this.__DescriptionProxyArray
        }
    }
}
