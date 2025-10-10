#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_VERSION.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_UNIT_SCHEMA extends Win32Struct
{
    static sizeof => 2592

    static packingSize => 8

    /**
     * @type {Integer}
     */
    UnitId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PoolType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    BiometricFactor {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SensorSubType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<UInt16>}
     */
    DeviceInstanceId{
        get {
            if(!this.HasProp("__DeviceInstanceIdProxyArray"))
                this.__DeviceInstanceIdProxyArray := Win32FixedArray(this.ptr + 20, 256, Primitive, "ushort")
            return this.__DeviceInstanceIdProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    Description{
        get {
            if(!this.HasProp("__DescriptionProxyArray"))
                this.__DescriptionProxyArray := Win32FixedArray(this.ptr + 532, 256, Primitive, "ushort")
            return this.__DescriptionProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    Manufacturer{
        get {
            if(!this.HasProp("__ManufacturerProxyArray"))
                this.__ManufacturerProxyArray := Win32FixedArray(this.ptr + 1044, 256, Primitive, "ushort")
            return this.__ManufacturerProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    Model{
        get {
            if(!this.HasProp("__ModelProxyArray"))
                this.__ModelProxyArray := Win32FixedArray(this.ptr + 1556, 256, Primitive, "ushort")
            return this.__ModelProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumberProxyArray"))
                this.__SerialNumberProxyArray := Win32FixedArray(this.ptr + 2068, 256, Primitive, "ushort")
            return this.__SerialNumberProxyArray
        }
    }

    /**
     * @type {WINBIO_VERSION}
     */
    FirmwareVersion{
        get {
            if(!this.HasProp("__FirmwareVersion"))
                this.__FirmwareVersion := WINBIO_VERSION(this.ptr + 2584)
            return this.__FirmwareVersion
        }
    }
}
