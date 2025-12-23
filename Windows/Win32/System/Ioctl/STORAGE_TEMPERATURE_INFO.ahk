#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes device temperature data. Returned as part of STORAGE_TEMPERATURE_DATA_DESCRIPTOR when querying for temperature data with an IOCTL_STORAGE_QUERY_PROPERTY request.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_temperature_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_TEMPERATURE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Identifies the instance of temperature information. Starts from 0. Index 0 may indicate a composite value.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A signed value that indicates the current temperature, in degrees Celsius.
     * @type {Integer}
     */
    Temperature {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * A signed value that specifies the maximum temperature within the desired threshold, in degrees Celsius.
     * @type {Integer}
     */
    OverThreshold {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * A signed value that specifies the minimum temperature within the desired threshold, in degrees Celsius.
     * @type {Integer}
     */
    UnderThreshold {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }

    /**
     * Indicates if <i>OverThreshold</i> can be changed by using <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_set_temperature_threshold">IOCTL_STORAGE_SET_TEMPERATURE_THRESHOLD</a>.
     * @type {BOOLEAN}
     */
    OverThresholdChangable {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Indicates if <i>UnderThreshold</i> can be changed by using <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_set_temperature_threshold">IOCTL_STORAGE_SET_TEMPERATURE_THRESHOLD</a>.
     * @type {BOOLEAN}
     */
    UnderThresholdChangable {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Indicates if a notification will be generated when the current temperature crosses a threshold.
     * @type {BOOLEAN}
     */
    EventGenerated {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
