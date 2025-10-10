#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * MI_Interval represents an interval of time.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_interval
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Interval extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The number of days in the interval. (0-99999999)
     * @type {Integer}
     */
    days {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The remaining number of hours in the interval. (0-23)
     * @type {Integer}
     */
    hours {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The remaining number of minutes in the interval. (0-59)
     * @type {Integer}
     */
    minutes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The remaining number of seconds in the interval. (0-59)
     * @type {Integer}
     */
    seconds {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The remaining number of microseconds in the interval. (0-999999)
     * @type {Integer}
     */
    microseconds {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved. The <b>MI_Interval</b> structure is padded to have the same size as <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_timestamp">MI_Timestamp</a>.
     * @type {Integer}
     */
    __padding1 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved. The <b>MI_Interval</b> structure is padded to have the same size as <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_timestamp">MI_Timestamp</a>.
     * @type {Integer}
     */
    __padding2 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved. The <b>MI_Interval</b> structure is padded to have the same size as <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_timestamp">MI_Timestamp</a>.
     * @type {Integer}
     */
    __padding3 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
