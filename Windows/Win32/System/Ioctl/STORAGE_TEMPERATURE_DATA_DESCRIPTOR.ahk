#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\STORAGE_TEMPERATURE_INFO.ahk" { STORAGE_TEMPERATURE_INFO }

/**
 * This structure is used in conjunction with IOCTL_STORAGE_QUERY_PROPERTY to return temperature data from a storage device or adapter.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_temperature_data_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_TEMPERATURE_DATA_DESCRIPTOR {
    #StructPack 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this structure.
     */
    Size : UInt32

    /**
     * Indicates the minimum temperature in degrees Celsius that may prevent normal operation. Exceeding this temperature may result in possible data loss, automatic device shutdown, extreme performance throttling, or permanent damage.
     */
    CriticalTemperature : Int16

    /**
     * Indicates the maximum temperature in degrees Celsius at which the device is capable of operating continuously without degrading operation or reliability.
     */
    WarningTemperature : Int16

    /**
     * Specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_temperature_info">STORAGE_TEMPERATURE_INFO</a> structures reported in <b>TemperatureInfo</b>. More than one set of temperature data may be returned when there are multiple sensors in the drive.
     */
    InfoCount : UInt16

    /**
     * Reserved for future use.
     */
    Reserved0 : Int8[2]

    /**
     * Reserved for future use.
     */
    Reserved1 : UInt32[2]

    /**
     * Device temperature data, of type <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_temperature_info">STORAGE_TEMPERATURE_INFO</a>.
     */
    TemperatureInfo : STORAGE_TEMPERATURE_INFO[1]

}
