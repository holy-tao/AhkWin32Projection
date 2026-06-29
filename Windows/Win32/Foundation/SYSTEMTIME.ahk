#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct SYSTEMTIME {
    #StructPack 2

    /**
     * The year. The valid values for this member are 1601 through 30827.
     */
    wYear : UInt16

    wMonth : UInt16

    wDayOfWeek : UInt16

    /**
     * The day of the month. The valid values for this member are 1 through 31.
     */
    wDay : UInt16

    /**
     * The hour. The valid values for this member are 0 through 23.
     */
    wHour : UInt16

    /**
     * The minute. The valid values for this member are 0 through 59.
     */
    wMinute : UInt16

    /**
     * The second. The valid values for this member are 0 through 59.
     */
    wSecond : UInt16

    /**
     * The millisecond. The valid values for this member are 0 through 999.
     */
    wMilliseconds : UInt16

}
