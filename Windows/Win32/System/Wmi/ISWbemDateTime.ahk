#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemDateTime extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemDateTime
     * @type {Guid}
     */
    static IID => Guid("{5e97458a-cf77-11d3-b38f-00105a1f473a}")

    /**
     * The class identifier for SWbemDateTime
     * @type {Guid}
     */
    static CLSID => Guid("{47dfbe54-cf76-11d3-b38f-00105a1f473a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Value", "get_Year", "put_Year", "get_YearSpecified", "put_YearSpecified", "get_Month", "put_Month", "get_MonthSpecified", "put_MonthSpecified", "get_Day", "put_Day", "get_DaySpecified", "put_DaySpecified", "get_Hours", "put_Hours", "get_HoursSpecified", "put_HoursSpecified", "get_Minutes", "put_Minutes", "get_MinutesSpecified", "put_MinutesSpecified", "get_Seconds", "put_Seconds", "get_SecondsSpecified", "put_SecondsSpecified", "get_Microseconds", "put_Microseconds", "get_MicrosecondsSpecified", "put_MicrosecondsSpecified", "get_UTC", "put_UTC", "get_UTCSpecified", "put_UTCSpecified", "get_IsInterval", "put_IsInterval", "GetVarDate", "SetVarDate", "GetFileTime", "SetFileTime"]

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {Integer} 
     */
    Year {
        get => this.get_Year()
        set => this.put_Year(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    YearSpecified {
        get => this.get_YearSpecified()
        set => this.put_YearSpecified(value)
    }

    /**
     * @type {Integer} 
     */
    Month {
        get => this.get_Month()
        set => this.put_Month(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MonthSpecified {
        get => this.get_MonthSpecified()
        set => this.put_MonthSpecified(value)
    }

    /**
     * @type {Integer} 
     */
    Day {
        get => this.get_Day()
        set => this.put_Day(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DaySpecified {
        get => this.get_DaySpecified()
        set => this.put_DaySpecified(value)
    }

    /**
     * @type {Integer} 
     */
    Hours {
        get => this.get_Hours()
        set => this.put_Hours(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    HoursSpecified {
        get => this.get_HoursSpecified()
        set => this.put_HoursSpecified(value)
    }

    /**
     * @type {Integer} 
     */
    Minutes {
        get => this.get_Minutes()
        set => this.put_Minutes(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MinutesSpecified {
        get => this.get_MinutesSpecified()
        set => this.put_MinutesSpecified(value)
    }

    /**
     * @type {Integer} 
     */
    Seconds {
        get => this.get_Seconds()
        set => this.put_Seconds(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SecondsSpecified {
        get => this.get_SecondsSpecified()
        set => this.put_SecondsSpecified(value)
    }

    /**
     * @type {Integer} 
     */
    Microseconds {
        get => this.get_Microseconds()
        set => this.put_Microseconds(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MicrosecondsSpecified {
        get => this.get_MicrosecondsSpecified()
        set => this.put_MicrosecondsSpecified(value)
    }

    /**
     * @type {Integer} 
     */
    UTC {
        get => this.get_UTC()
        set => this.put_UTC(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UTCSpecified {
        get => this.get_UTCSpecified()
        set => this.put_UTCSpecified(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsInterval {
        get => this.get_IsInterval()
        set => this.put_IsInterval(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Value() {
        strValue := BSTR()
        result := ComCall(7, this, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strValue
    }

    /**
     * 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    put_Value(strValue) {
        if(strValue is String) {
            pin := BSTR.Alloc(strValue)
            strValue := pin.Value
        }

        result := ComCall(8, this, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Year() {
        result := ComCall(9, this, "int*", &iYear := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return iYear
    }

    /**
     * 
     * @param {Integer} iYear 
     * @returns {HRESULT} 
     */
    put_Year(iYear) {
        result := ComCall(10, this, "int", iYear, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_YearSpecified() {
        result := ComCall(11, this, "short*", &bYearSpecified := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bYearSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bYearSpecified 
     * @returns {HRESULT} 
     */
    put_YearSpecified(bYearSpecified) {
        result := ComCall(12, this, "short", bYearSpecified, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Month() {
        result := ComCall(13, this, "int*", &iMonth := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return iMonth
    }

    /**
     * 
     * @param {Integer} iMonth 
     * @returns {HRESULT} 
     */
    put_Month(iMonth) {
        result := ComCall(14, this, "int", iMonth, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MonthSpecified() {
        result := ComCall(15, this, "short*", &bMonthSpecified := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bMonthSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bMonthSpecified 
     * @returns {HRESULT} 
     */
    put_MonthSpecified(bMonthSpecified) {
        result := ComCall(16, this, "short", bMonthSpecified, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Day() {
        result := ComCall(17, this, "int*", &iDay := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return iDay
    }

    /**
     * 
     * @param {Integer} iDay 
     * @returns {HRESULT} 
     */
    put_Day(iDay) {
        result := ComCall(18, this, "int", iDay, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_DaySpecified() {
        result := ComCall(19, this, "short*", &bDaySpecified := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bDaySpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bDaySpecified 
     * @returns {HRESULT} 
     */
    put_DaySpecified(bDaySpecified) {
        result := ComCall(20, this, "short", bDaySpecified, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Hours() {
        result := ComCall(21, this, "int*", &iHours := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return iHours
    }

    /**
     * 
     * @param {Integer} iHours 
     * @returns {HRESULT} 
     */
    put_Hours(iHours) {
        result := ComCall(22, this, "int", iHours, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_HoursSpecified() {
        result := ComCall(23, this, "short*", &bHoursSpecified := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bHoursSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bHoursSpecified 
     * @returns {HRESULT} 
     */
    put_HoursSpecified(bHoursSpecified) {
        result := ComCall(24, this, "short", bHoursSpecified, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Minutes() {
        result := ComCall(25, this, "int*", &iMinutes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return iMinutes
    }

    /**
     * 
     * @param {Integer} iMinutes 
     * @returns {HRESULT} 
     */
    put_Minutes(iMinutes) {
        result := ComCall(26, this, "int", iMinutes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MinutesSpecified() {
        result := ComCall(27, this, "short*", &bMinutesSpecified := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bMinutesSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bMinutesSpecified 
     * @returns {HRESULT} 
     */
    put_MinutesSpecified(bMinutesSpecified) {
        result := ComCall(28, this, "short", bMinutesSpecified, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Seconds() {
        result := ComCall(29, this, "int*", &iSeconds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return iSeconds
    }

    /**
     * 
     * @param {Integer} iSeconds 
     * @returns {HRESULT} 
     */
    put_Seconds(iSeconds) {
        result := ComCall(30, this, "int", iSeconds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_SecondsSpecified() {
        result := ComCall(31, this, "short*", &bSecondsSpecified := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bSecondsSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSecondsSpecified 
     * @returns {HRESULT} 
     */
    put_SecondsSpecified(bSecondsSpecified) {
        result := ComCall(32, this, "short", bSecondsSpecified, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Microseconds() {
        result := ComCall(33, this, "int*", &iMicroseconds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return iMicroseconds
    }

    /**
     * 
     * @param {Integer} iMicroseconds 
     * @returns {HRESULT} 
     */
    put_Microseconds(iMicroseconds) {
        result := ComCall(34, this, "int", iMicroseconds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MicrosecondsSpecified() {
        result := ComCall(35, this, "short*", &bMicrosecondsSpecified := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bMicrosecondsSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bMicrosecondsSpecified 
     * @returns {HRESULT} 
     */
    put_MicrosecondsSpecified(bMicrosecondsSpecified) {
        result := ComCall(36, this, "short", bMicrosecondsSpecified, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UTC() {
        result := ComCall(37, this, "int*", &iUTC := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return iUTC
    }

    /**
     * 
     * @param {Integer} iUTC 
     * @returns {HRESULT} 
     */
    put_UTC(iUTC) {
        result := ComCall(38, this, "int", iUTC, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_UTCSpecified() {
        result := ComCall(39, this, "short*", &bUTCSpecified := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bUTCSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUTCSpecified 
     * @returns {HRESULT} 
     */
    put_UTCSpecified(bUTCSpecified) {
        result := ComCall(40, this, "short", bUTCSpecified, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsInterval() {
        result := ComCall(41, this, "short*", &bIsInterval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bIsInterval
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsInterval 
     * @returns {HRESULT} 
     */
    put_IsInterval(bIsInterval) {
        result := ComCall(42, this, "short", bIsInterval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsLocal 
     * @returns {Float} 
     */
    GetVarDate(bIsLocal) {
        result := ComCall(43, this, "short", bIsLocal, "double*", &dVarDate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dVarDate
    }

    /**
     * 
     * @param {Float} dVarDate 
     * @param {VARIANT_BOOL} bIsLocal 
     * @returns {HRESULT} 
     */
    SetVarDate(dVarDate, bIsLocal) {
        result := ComCall(44, this, "double", dVarDate, "short", bIsLocal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the date and time that a file or directory was created, last accessed, and last modified.
     * @remarks
     * Not all file systems can record creation and last access times and not all file systems record them in the 
     *     same manner. For example, on  FAT, create time has a resolution of 10 milliseconds, write time has a resolution of 
     *     2 seconds, and access time has a resolution of 1 day (really, the access date). Therefore, the 
     *     <b>GetFileTime</b> function may not return the same file time 
     *     information set using the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> function.
     * 
     * NTFS delays updates to the last access time for a file by up to one hour after the last access. NTFS also 
     *     permits last access time updates to be disabled. Last access time is not updated on NTFS volumes by default.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Last access time is updated on NTFS volumes by default.
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/file-times">File Times</a>.
     * 
     * If you rename or delete a file, then restore it shortly thereafter, Windows searches the cache for file 
     *     information to restore. Cached information includes its short/long name pair and creation time.
     * @param {VARIANT_BOOL} bIsLocal 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fileapi/nf-fileapi-getfiletime
     */
    GetFileTime(bIsLocal) {
        strFileTime := BSTR()
        result := ComCall(45, this, "short", bIsLocal, "ptr", strFileTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strFileTime
    }

    /**
     * Sets the date and time that the specified file or directory was created, last accessed, or last modified.
     * @remarks
     * Not all file systems can record creation and last access times and not all file systems record them in the same manner. For example, on  FAT, create time has a resolution of 10 milliseconds, write time has a resolution of 2 seconds, and access time has a resolution of 1 day (really, the access date). Therefore, the [GetFileTime](/windows/win32/api/fileapi/nf-fileapi-getfiletime) function may not return the same file time information set using **SetFileTime**. NTFS delays updates to the last access time for a file by up to one hour after the last access.
     * @param {BSTR} strFileTime 
     * @param {VARIANT_BOOL} bIsLocal 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api//content/fileapi/nf-fileapi-setfiletime
     */
    SetFileTime(strFileTime, bIsLocal) {
        if(strFileTime is String) {
            pin := BSTR.Alloc(strFileTime)
            strFileTime := pin.Value
        }

        result := ComCall(46, this, "ptr", strFileTime, "short", bIsLocal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
