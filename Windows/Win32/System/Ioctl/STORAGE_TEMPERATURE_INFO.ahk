#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Describes device temperature data. Returned as part of STORAGE_TEMPERATURE_DATA_DESCRIPTOR when querying for temperature data with an IOCTL_STORAGE_QUERY_PROPERTY request.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_temperature_info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_TEMPERATURE_INFO {
    #StructPack 4

    /**
     * Identifies the instance of temperature information. Starts from 0. Index 0 may indicate a composite value.
     */
    Index : UInt16

    /**
     * A signed value that indicates the current temperature, in degrees Celsius.
     */
    Temperature : Int16

    /**
     * A signed value that specifies the maximum temperature within the desired threshold, in degrees Celsius.
     */
    OverThreshold : Int16

    /**
     * A signed value that specifies the minimum temperature within the desired threshold, in degrees Celsius.
     */
    UnderThreshold : Int16

    /**
     * Indicates if <i>OverThreshold</i> can be changed by using <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_set_temperature_threshold">IOCTL_STORAGE_SET_TEMPERATURE_THRESHOLD</a>.
     */
    OverThresholdChangable : BOOLEAN

    /**
     * Indicates if <i>UnderThreshold</i> can be changed by using <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_set_temperature_threshold">IOCTL_STORAGE_SET_TEMPERATURE_THRESHOLD</a>.
     */
    UnderThresholdChangable : BOOLEAN

    /**
     * Indicates if a notification will be generated when the current temperature crosses a threshold.
     */
    EventGenerated : BOOLEAN

    /**
     * Reserved for future use.
     */
    Reserved0 : Int8

    /**
     * Reserved for future use.
     */
    Reserved1 : UInt32

}
