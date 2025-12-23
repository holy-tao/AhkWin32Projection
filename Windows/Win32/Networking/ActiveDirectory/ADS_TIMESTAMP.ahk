#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_TIMESTAMP structure is an ADSI representation of the Timestamp attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_timestamp
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_TIMESTAMP extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Number of seconds, with zero value being equal to 12:00 AM, January, 1970, UTC.
     * @type {Integer}
     */
    WholeSeconds {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An event identifier, in the order of occurrence, within the period specified by <b>WholeSeconds</b>.
     * @type {Integer}
     */
    EventID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
