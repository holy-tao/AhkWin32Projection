#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Specifies a date and time, using individual members for the month, day, year, weekday, hour, minute, second, and millisecond. The time is either in coordinated universal time (UTC) or local time, depending on the function that is being called.
 * @remarks
 * > [!NOTE]
  * > The <b>SYSTEMTIME</b> does not check to see if the date represented is a real and valid date. When working with this API, you should ensure its validity, especially in leap year scenarios. See [leap day readiness](https://techcommunity.microsoft.com/t5/azure-developer-community-blog/it-s-2020-is-your-code-ready-for-leap-day/ba-p/1157279) for more information.
  * 
  * It is not recommended that you add and subtract values from the 
  * <b>SYSTEMTIME</b> structure to obtain relative times. Instead, you should
  * 
  * <ul>
  * <li>Convert the 
  * <b>SYSTEMTIME</b> structure to a 
  * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.</li>
  * <li>Copy the resulting 
  * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure to a 
  * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-ularge_integer-r1">ULARGE_INTEGER</a> structure.</li>
  * <li>Use normal 64-bit arithmetic on the <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-ularge_integer-r1">ULARGE_INTEGER</a> value.</li>
  * </ul>
  * The system can periodically refresh the time by synchronizing with a time source. Because the system time can be adjusted either forward or backward, do not compare system time readings to determine elapsed time. Instead, use one of the methods described in 
  * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/windows-time">Windows Time</a>.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-systemtime
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class SYSTEMTIME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 2

    /**
     * The year. The valid values for this member are 1601 through 30827.
     * @type {Integer}
     */
    wYear {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    wMonth {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * 
     * @type {Integer}
     */
    wDayOfWeek {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The day of the month. The valid values for this member are 1 through 31.
     * @type {Integer}
     */
    wDay {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The hour. The valid values for this member are 0 through 23.
     * @type {Integer}
     */
    wHour {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The minute. The valid values for this member are 0 through 59.
     * @type {Integer}
     */
    wMinute {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The second. The valid values for this member are 0 through 59.
     * @type {Integer}
     */
    wSecond {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * The millisecond. The valid values for this member are 0 through 999.
     * @type {Integer}
     */
    wMilliseconds {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
