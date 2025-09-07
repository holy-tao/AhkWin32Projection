#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FAX_TIME structure represents a time, using individual members for the current hour and minute. The time is expressed in Coordinated Universal Time (UTC).
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_configurationa">FAX_CONFIGURATION</a> structure includes a <b>FAX_TIME</b> structure to describe the discount period that applies when a fax server is sending fax transmissions.
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_time
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_TIME extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Type: <b>WORD</b>
     * 
     * Specifies a 16-bit unsigned integer that is the current hour. Valid values are 0 through 23.
     * @type {Integer}
     */
    Hour {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Specifies a 16-bit unsigned integer that is the current minute. Valid values are 0 through 59.
     * @type {Integer}
     */
    Minute {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
