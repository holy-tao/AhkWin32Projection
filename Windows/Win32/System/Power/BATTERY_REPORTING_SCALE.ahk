#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the granularity of the battery capacity that is reported by IOCTL_BATTERY_QUERY_STATUS.
 * @remarks
 * The total number of <b>BATTERY_REPORTING_SCALE</b> entries returned from <a href="https://docs.microsoft.com/windows/desktop/Power/ioctl-battery-query-information">IOCTL_BATTERY_QUERY_INFORMATION</a> is indicated by the value of the <i>lpBytesReturned</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a>. To determine the number of elements in the array, divide the value of <i>lpBytesReturned</i> by the size of the 
  * <b>BATTERY_REPORTING_SCALE</b> structure. The maximum number of array entries that can be returned is four.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-battery_reporting_scale
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class BATTERY_REPORTING_SCALE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The granularity of the capacity reading returned by <a href="https://docs.microsoft.com/windows/desktop/Power/ioctl-battery-query-status">IOCTL_BATTERY_QUERY_STATUS</a> in milliwatt-hours (mWh).  Granularity may change over time as battery discharge and recharge lowers the range of readings.
     * @type {Integer}
     */
    Granularity {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The upper capacity limit for <i>Granularity</i>.   The value of <i>Granularity</i> is valid for capacities reported by <a href="https://docs.microsoft.com/windows/desktop/Power/ioctl-battery-query-status">IOCTL_BATTERY_QUERY_STATUS</a> that are less than or equal to this capacity (mWh), but greater than or equal to the capacity given in the previous array element, or zero if this is the first array element.
     * @type {Integer}
     */
    Capacity {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
