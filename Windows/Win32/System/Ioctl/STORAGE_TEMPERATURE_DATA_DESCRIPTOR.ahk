#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_TEMPERATURE_INFO.ahk

/**
 * This structure is used in conjunction with IOCTL_STORAGE_QUERY_PROPERTY to return temperature data from a storage device or adapter.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_temperature_data_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_TEMPERATURE_DATA_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to the structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates the minimum temperature in degrees Celsius that may prevent normal operation. Exceeding this temperature may result in possible data loss, automatic device shutdown, extreme performance throttling, or permanent damage.
     * @type {Integer}
     */
    CriticalTemperature {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * Indicates the maximum temperature in degrees Celsius at which the device is capable of operating continuously without degrading operation or reliability.
     * @type {Integer}
     */
    WarningTemperature {
        get => NumGet(this, 10, "short")
        set => NumPut("short", value, this, 10)
    }

    /**
     * Specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_temperature_info">STORAGE_TEMPERATURE_INFO</a> structures reported in <b>TemperatureInfo</b>. More than one set of temperature data may be returned when there are multiple sensors in the drive.
     * @type {Integer}
     */
    InfoCount {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Reserved for future use.
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 14, 2, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * Reserved for future use.
     * @type {Array<UInt32>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 16, 2, Primitive, "uint")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * Device temperature data, of type <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_temperature_info">STORAGE_TEMPERATURE_INFO</a>.
     * @type {Array<STORAGE_TEMPERATURE_INFO>}
     */
    TemperatureInfo{
        get {
            if(!this.HasProp("__TemperatureInfoProxyArray"))
                this.__TemperatureInfoProxyArray := Win32FixedArray(this.ptr + 24, 1, STORAGE_TEMPERATURE_INFO, "")
            return this.__TemperatureInfoProxyArray
        }
    }
}
