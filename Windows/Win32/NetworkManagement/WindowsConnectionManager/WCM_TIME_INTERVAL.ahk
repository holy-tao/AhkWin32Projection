#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a time interval.
 * @see https://docs.microsoft.com/windows/win32/api//wcmapi/ns-wcmapi-wcm_time_interval
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class WCM_TIME_INTERVAL extends Win32Struct
{
    static sizeof => 14

    static packingSize => 2

    /**
     * Type: <b>WORD</b>
     * 
     * Years.
     * @type {Integer}
     */
    wYear {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Months.
     * @type {Integer}
     */
    wMonth {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Days.
     * @type {Integer}
     */
    wDay {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Hours.
     * @type {Integer}
     */
    wHour {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Minutes.
     * @type {Integer}
     */
    wMinute {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Seconds.
     * @type {Integer}
     */
    wSecond {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Milliseconds.
     * @type {Integer}
     */
    wMilliseconds {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }
}
