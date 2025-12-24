#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_VERSION.ahk
#Include .\WINBIO_REGISTERED_FORMAT.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_SENSOR_ATTRIBUTES extends Win32Struct
{
    static sizeof => 1584

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PayloadSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HRESULT}
     */
    WinBioHresult {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {WINBIO_VERSION}
     */
    WinBioVersion{
        get {
            if(!this.HasProp("__WinBioVersion"))
                this.__WinBioVersion := WINBIO_VERSION(8, this)
            return this.__WinBioVersion
        }
    }

    /**
     * @type {Integer}
     */
    SensorType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SensorSubType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<UInt16>}
     */
    ManufacturerName{
        get {
            if(!this.HasProp("__ManufacturerNameProxyArray"))
                this.__ManufacturerNameProxyArray := Win32FixedArray(this.ptr + 28, 256, Primitive, "ushort")
            return this.__ManufacturerNameProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    ModelName{
        get {
            if(!this.HasProp("__ModelNameProxyArray"))
                this.__ModelNameProxyArray := Win32FixedArray(this.ptr + 540, 256, Primitive, "ushort")
            return this.__ModelNameProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumberProxyArray"))
                this.__SerialNumberProxyArray := Win32FixedArray(this.ptr + 1052, 256, Primitive, "ushort")
            return this.__SerialNumberProxyArray
        }
    }

    /**
     * @type {WINBIO_VERSION}
     */
    FirmwareVersion{
        get {
            if(!this.HasProp("__FirmwareVersion"))
                this.__FirmwareVersion := WINBIO_VERSION(1564, this)
            return this.__FirmwareVersion
        }
    }

    /**
     * @type {Integer}
     */
    SupportedFormatEntries {
        get => NumGet(this, 1572, "uint")
        set => NumPut("uint", value, this, 1572)
    }

    /**
     * @type {Array<WINBIO_REGISTERED_FORMAT>}
     */
    SupportedFormat{
        get {
            if(!this.HasProp("__SupportedFormatProxyArray"))
                this.__SupportedFormatProxyArray := Win32FixedArray(this.ptr + 1576, 1, WINBIO_REGISTERED_FORMAT, "")
            return this.__SupportedFormatProxyArray
        }
    }
}
