#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Time
 * @version v4.0.30319
 */
class Time {

;@region Constants

    /**
     * @type {String}
     */
    static wszW32TimeRegKeyTimeProviders => "System\CurrentControlSet\Services\W32Time\TimeProviders"

    /**
     * @type {String}
     */
    static wszW32TimeRegKeyPolicyTimeProviders => "Software\Policies\Microsoft\W32Time\TimeProviders"

    /**
     * @type {String}
     */
    static wszW32TimeRegValueEnabled => "Enabled"

    /**
     * @type {String}
     */
    static wszW32TimeRegValueDllName => "DllName"

    /**
     * @type {String}
     */
    static wszW32TimeRegValueInputProvider => "InputProvider"

    /**
     * @type {String}
     */
    static wszW32TimeRegValueMetaDataProvider => "MetaDataProvider"

    /**
     * @type {Integer (UInt32)}
     */
    static TSF_Hardware => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TSF_Authenticated => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TSF_IPv6 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TSF_SignatureAuthenticated => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_ZONE_ID_INVALID => 4294967295
;@endregion Constants

;@region Methods
    /**
     * Converts a time in Coordinated Universal Time (UTC) to a specified time zone's corresponding local time.
     * @param {Pointer<TIME_ZONE_INFORMATION>} lpTimeZoneInformation A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information">TIME_ZONE_INFORMATION</a> structure that specifies the time zone of interest. 
     * 
     * 
     * 
     * 
     * If <i>lpTimeZone</i> is <b>NULL</b>, the function uses the currently active time zone.
     * @param {Pointer<SYSTEMTIME>} lpUniversalTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that specifies the UTC time to be converted. The function converts this universal time to the specified time zone's corresponding local time.
     * @param {Pointer<SYSTEMTIME>} lpLocalTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the local time.
     * @returns {Integer} If the function succeeds, the return value is nonzero, and the function sets the members of the 
     * <a href="/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure pointed to by <i>lpLocalTime</i> to the appropriate local time values.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-systemtimetotzspecificlocaltime
     * @since windows5.0
     */
    static SystemTimeToTzSpecificLocalTime(lpTimeZoneInformation, lpUniversalTime, lpLocalTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SystemTimeToTzSpecificLocalTime", "ptr", lpTimeZoneInformation, "ptr", lpUniversalTime, "ptr", lpLocalTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a local time to a time in Coordinated Universal Time (UTC).
     * @param {Pointer<TIME_ZONE_INFORMATION>} lpTimeZoneInformation A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information">TIME_ZONE_INFORMATION</a> structure that specifies the time zone for the time specified in <i>lpLocalTime</i>.
     * 
     * If <i>lpTimeZoneInformation</i> is <b>NULL</b>, the function uses the currently active time zone.
     * @param {Pointer<SYSTEMTIME>} lpLocalTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that specifies the local time to be converted. The function converts this time to the corresponding UTC time.
     * @param {Pointer<SYSTEMTIME>} lpUniversalTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the UTC time.
     * @returns {Integer} If the function succeeds, the return value is nonzero, and the function sets the members of the 
     * <a href="/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure pointed to by <i>lpUniversalTime</i> to the appropriate values.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-tzspecificlocaltimetosystemtime
     * @since windows5.1.2600
     */
    static TzSpecificLocalTimeToSystemTime(lpTimeZoneInformation, lpLocalTime, lpUniversalTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\TzSpecificLocalTimeToSystemTime", "ptr", lpTimeZoneInformation, "ptr", lpLocalTime, "ptr", lpUniversalTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a file time to system time format. System time is based on Coordinated Universal Time (UTC).
     * @param {Pointer<FILETIME>} lpFileTime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the file 
     *        time to be converted to system (UTC) date and time format.
     * 
     * This value must be less than 0x8000000000000000. Otherwise, the function fails.
     * @param {Pointer<SYSTEMTIME>} lpSystemTime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure to receive the 
     *       converted file time.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *       <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-filetimetosystemtime
     * @since windows5.1.2600
     */
    static FileTimeToSystemTime(lpFileTime, lpSystemTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FileTimeToSystemTime", "ptr", lpFileTime, "ptr", lpSystemTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a system time to file time format. System time is based on Coordinated Universal Time (UTC).
     * @param {Pointer<SYSTEMTIME>} lpSystemTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the system time to be converted from UTC to file time format. 
     * 
     * 
     * 
     * 
     * The <b>wDayOfWeek</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure is ignored.
     * @param {Pointer<FILETIME>} lpFileTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure to receive the converted system time.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * > [!NOTE]
     * > A False return value can indicate that the passed SYSTEMTIME structure represents an invalid date. Certain situations, such as the additional day added in a leap year, can result in application logic unexpectedly creating an invalid date. For more information on avoiding these issues, see [leap year readiness](https://techcommunity.microsoft.com/t5/azure-developer-community-blog/it-s-2020-is-your-code-ready-for-leap-day/ba-p/1157279).
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-systemtimetofiletime
     * @since windows5.0
     */
    static SystemTimeToFileTime(lpSystemTime, lpFileTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SystemTimeToFileTime", "ptr", lpSystemTime, "ptr", lpFileTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current time zone settings. These settings control the translations between Coordinated Universal Time (UTC) and local time.
     * @param {Pointer<TIME_ZONE_INFORMATION>} lpTimeZoneInformation A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information">TIME_ZONE_INFORMATION</a> structure to receive the current settings.
     * @returns {Integer} If the function succeeds, it returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TIME_ZONE_ID_UNKNOWN</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Daylight saving time is not used in the current time zone, because there are no transition dates or automatic adjustment for daylight saving time is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TIME_ZONE_ID_STANDARD</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is operating in the range covered by the <b>StandardDate</b> member of the 
     * <a href="/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information">TIME_ZONE_INFORMATION</a> structure. 
     * 
     * 
     * 
     * 							
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TIME_ZONE_ID_DAYLIGHT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is operating in the range covered by the <b>DaylightDate</b> member of the 
     * <a href="/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information">TIME_ZONE_INFORMATION</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails for other reasons, such as an out of memory error, it returns TIME_ZONE_ID_INVALID. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-gettimezoneinformation
     * @since windows5.0
     */
    static GetTimeZoneInformation(lpTimeZoneInformation) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetTimeZoneInformation", "ptr", lpTimeZoneInformation, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the current time zone settings. These settings control translations from Coordinated Universal Time (UTC) to local time.
     * @param {Pointer<TIME_ZONE_INFORMATION>} lpTimeZoneInformation A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information">TIME_ZONE_INFORMATION</a> structure that contains the new settings.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-settimezoneinformation
     * @since windows5.0
     */
    static SetTimeZoneInformation(lpTimeZoneInformation) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetTimeZoneInformation", "ptr", lpTimeZoneInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the current time zone and dynamic daylight saving time settings. These settings control translations from Coordinated Universal Time (UTC) to local time.
     * @param {Pointer<DYNAMIC_TIME_ZONE_INFORMATION>} lpTimeZoneInformation A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-dynamic_time_zone_information">DYNAMIC_TIME_ZONE_INFORMATION</a> structure.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-setdynamictimezoneinformation
     * @since windows6.0.6000
     */
    static SetDynamicTimeZoneInformation(lpTimeZoneInformation) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetDynamicTimeZoneInformation", "ptr", lpTimeZoneInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current time zone and dynamic daylight saving time settings. These settings control the translations between Coordinated Universal Time (UTC) and local time.
     * @param {Pointer<DYNAMIC_TIME_ZONE_INFORMATION>} pTimeZoneInformation A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-dynamic_time_zone_information">DYNAMIC_TIME_ZONE_INFORMATION</a> structure.
     * @returns {Integer} If the function succeeds, it returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TIME_ZONE_ID_UNKNOWN</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Daylight saving time is not used in the current time zone, because there are no transition dates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TIME_ZONE_ID_STANDARD</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is operating in the range covered by the <b>StandardDate</b> member of the 
     * <a href="/windows/desktop/api/timezoneapi/ns-timezoneapi-dynamic_time_zone_information">DYNAMIC_TIME_ZONE_INFORMATION</a> structure. 
     * 
     * 
     * 
     * 							
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TIME_ZONE_ID_DAYLIGHT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is operating in the range covered by the <b>DaylightDate</b> member of the 
     * <a href="/windows/desktop/api/timezoneapi/ns-timezoneapi-dynamic_time_zone_information">DYNAMIC_TIME_ZONE_INFORMATION</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, it returns TIME_ZONE_ID_INVALID. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-getdynamictimezoneinformation
     * @since windows6.0.6000
     */
    static GetDynamicTimeZoneInformation(pTimeZoneInformation) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetDynamicTimeZoneInformation", "ptr", pTimeZoneInformation, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the time zone settings for the specified year and time zone. These settings control the translations between Coordinated Universal Time (UTC) and local time.
     * @param {Integer} wYear The year for which the time zone settings are to be retrieved. The <i>wYear</i> parameter must be a local time value.
     * @param {Pointer<DYNAMIC_TIME_ZONE_INFORMATION>} pdtzi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-dynamic_time_zone_information">DYNAMIC_TIME_ZONE_INFORMATION</a> structure that specifies the time zone.  To populate this parameter, call <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-enumdynamictimezoneinformation">EnumDynamicTimeZoneInformation</a> with the index of the time zone you want. If this parameter is <b>NULL</b>, the current time zone is used.
     * @param {Pointer<TIME_ZONE_INFORMATION>} ptzi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information">TIME_ZONE_INFORMATION</a> structure that receives the time zone settings.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-gettimezoneinformationforyear
     * @since windows6.0.6000
     */
    static GetTimeZoneInformationForYear(wYear, pdtzi, ptzi) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetTimeZoneInformationForYear", "ushort", wYear, "ptr", pdtzi, "ptr", ptzi, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates DYNAMIC_TIME_ZONE_INFORMATION entries stored in the registry.
     * @param {Integer} dwIndex Index value that represents the location of a <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-dynamic_time_zone_information">DYNAMIC_TIME_ZONE_INFORMATION</a> entry.
     * @param {Pointer<DYNAMIC_TIME_ZONE_INFORMATION>} lpTimeZoneInformation Specifies settings for  a time zone and dynamic daylight saving time.
     * @returns {Integer} This function returns DWORD. Possible return values include:
     * 
     * | Value                   | Description                                       | 
     * |-------------------------|---------------------------------------------------|
     * | ERROR_SUCCESS           | The operation succeeded.                          |
     * | ERROR_NO_MORE_ITEMS     | No more data is available for the given index.    |
     * | ERROR_INVALID_PARAMETER | A parameter is invalid.                           |
     * | Any other value         | The operation failed.                             |
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-enumdynamictimezoneinformation
     * @since windows8.0
     */
    static EnumDynamicTimeZoneInformation(dwIndex, lpTimeZoneInformation) {
        result := DllCall("ADVAPI32.dll\EnumDynamicTimeZoneInformation", "uint", dwIndex, "ptr", lpTimeZoneInformation, "uint")
        return result
    }

    /**
     * Gets a range, expressed in years, for which a DYNAMIC_TIME_ZONE_INFORMATION has valid entries.
     * @param {Pointer<DYNAMIC_TIME_ZONE_INFORMATION>} lpTimeZoneInformation Specifies settings for  a time zone and dynamic daylight saving time.
     * @param {Pointer<UInt32>} FirstYear The year that marks the beginning of the range to pass to <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-gettimezoneinformationforyear">GetTimeZoneInformationForYear</a>.
     * @param {Pointer<UInt32>} LastYear The year that marks the end of the range to pass to <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-gettimezoneinformationforyear">GetTimeZoneInformationForYear</a>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system cannot find the effective years.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameter values is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>Any other value</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-getdynamictimezoneinformationeffectiveyears
     * @since windows8.0
     */
    static GetDynamicTimeZoneInformationEffectiveYears(lpTimeZoneInformation, FirstYear, LastYear) {
        result := DllCall("ADVAPI32.dll\GetDynamicTimeZoneInformationEffectiveYears", "ptr", lpTimeZoneInformation, "uint*", FirstYear, "uint*", LastYear, "uint")
        return result
    }

    /**
     * Converts a time in Coordinated Universal Time (UTC) with dynamic daylight saving time settings to a specified time zone's corresponding local time.
     * @param {Pointer<DYNAMIC_TIME_ZONE_INFORMATION>} lpTimeZoneInformation A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-dynamic_time_zone_information">DYNAMIC_TIME_ZONE_INFORMATION</a> structure that specifies  the time zone and dynamic daylight saving time.
     * @param {Pointer<SYSTEMTIME>} lpUniversalTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that specifies the UTC time to be converted. The function converts this universal time to the specified time zone's corresponding local time.
     * @param {Pointer<SYSTEMTIME>} lpLocalTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the local time.
     * @returns {Integer} If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-systemtimetotzspecificlocaltimeex
     * @since windows6.1
     */
    static SystemTimeToTzSpecificLocalTimeEx(lpTimeZoneInformation, lpUniversalTime, lpLocalTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SystemTimeToTzSpecificLocalTimeEx", "ptr", lpTimeZoneInformation, "ptr", lpUniversalTime, "ptr", lpLocalTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a local time to a time with dynamic daylight saving time settings to Coordinated Universal Time (UTC).
     * @param {Pointer<DYNAMIC_TIME_ZONE_INFORMATION>} lpTimeZoneInformation A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-dynamic_time_zone_information">DYNAMIC_TIME_ZONE_INFORMATION</a> structure that specifies  the time zone and dynamic daylight saving time.
     * @param {Pointer<SYSTEMTIME>} lpLocalTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that specifies the local time to be converted. The function converts this time to the corresponding UTC time.
     * @param {Pointer<SYSTEMTIME>} lpUniversalTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the UTC time.
     * @returns {Integer} If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//timezoneapi/nf-timezoneapi-tzspecificlocaltimetosystemtimeex
     * @since windows6.1
     */
    static TzSpecificLocalTimeToSystemTimeEx(lpTimeZoneInformation, lpLocalTime, lpUniversalTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\TzSpecificLocalTimeToSystemTimeEx", "ptr", lpTimeZoneInformation, "ptr", lpLocalTime, "ptr", lpUniversalTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<TIME_ZONE_INFORMATION>} timeZoneInformation 
     * @param {Pointer<FILETIME>} localFileTime 
     * @param {Pointer<SYSTEMTIME>} localSystemTime 
     * @returns {Integer} 
     */
    static LocalFileTimeToLocalSystemTime(timeZoneInformation, localFileTime, localSystemTime) {
        result := DllCall("KERNEL32.dll\LocalFileTimeToLocalSystemTime", "ptr", timeZoneInformation, "ptr", localFileTime, "ptr", localSystemTime, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<TIME_ZONE_INFORMATION>} timeZoneInformation 
     * @param {Pointer<SYSTEMTIME>} localSystemTime 
     * @param {Pointer<FILETIME>} localFileTime 
     * @returns {Integer} 
     */
    static LocalSystemTimeToLocalFileTime(timeZoneInformation, localSystemTime, localFileTime) {
        result := DllCall("KERNEL32.dll\LocalSystemTimeToLocalFileTime", "ptr", timeZoneInformation, "ptr", localSystemTime, "ptr", localFileTime, "int")
        return result
    }

;@endregion Methods
}
