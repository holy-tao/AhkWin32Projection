#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains system time change settings.
 * @remarks
 * The time values in the <i>liNewTime</i> and <i>liOldTime</i> members cannot be used directly with the time functions, which typically require a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> or <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure. Convert the  <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> structure to a  <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-ularge_integer~r1">ULARGE_INTEGER</a> structure, copy the <b>ULARGE_INTEGER</b> structure to a <b>FILETIME</b> structure, and then if necessary use the <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-filetimetosystemtime">FileTimeToSystemTime</a> function to convert the <b>FILETIME</b> structure to a <b>SYSTEMTIME</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_timechange_info
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_TIMECHANGE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The new system time.
     * @type {Integer}
     */
    liNewTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The previous system time.
     * @type {Integer}
     */
    liOldTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
