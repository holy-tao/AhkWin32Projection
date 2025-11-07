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
     * 
     * @returns {BSTR} 
     */
    get_Value() {
        strValue := BSTR()
        result := ComCall(7, this, "ptr", strValue, "HRESULT")
        return strValue
    }

    /**
     * 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    put_Value(strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(8, this, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Year() {
        result := ComCall(9, this, "int*", &iYear := 0, "HRESULT")
        return iYear
    }

    /**
     * 
     * @param {Integer} iYear 
     * @returns {HRESULT} 
     */
    put_Year(iYear) {
        result := ComCall(10, this, "int", iYear, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_YearSpecified() {
        result := ComCall(11, this, "short*", &bYearSpecified := 0, "HRESULT")
        return bYearSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bYearSpecified 
     * @returns {HRESULT} 
     */
    put_YearSpecified(bYearSpecified) {
        result := ComCall(12, this, "short", bYearSpecified, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Month() {
        result := ComCall(13, this, "int*", &iMonth := 0, "HRESULT")
        return iMonth
    }

    /**
     * 
     * @param {Integer} iMonth 
     * @returns {HRESULT} 
     */
    put_Month(iMonth) {
        result := ComCall(14, this, "int", iMonth, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MonthSpecified() {
        result := ComCall(15, this, "short*", &bMonthSpecified := 0, "HRESULT")
        return bMonthSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bMonthSpecified 
     * @returns {HRESULT} 
     */
    put_MonthSpecified(bMonthSpecified) {
        result := ComCall(16, this, "short", bMonthSpecified, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Day() {
        result := ComCall(17, this, "int*", &iDay := 0, "HRESULT")
        return iDay
    }

    /**
     * 
     * @param {Integer} iDay 
     * @returns {HRESULT} 
     */
    put_Day(iDay) {
        result := ComCall(18, this, "int", iDay, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_DaySpecified() {
        result := ComCall(19, this, "short*", &bDaySpecified := 0, "HRESULT")
        return bDaySpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bDaySpecified 
     * @returns {HRESULT} 
     */
    put_DaySpecified(bDaySpecified) {
        result := ComCall(20, this, "short", bDaySpecified, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Hours() {
        result := ComCall(21, this, "int*", &iHours := 0, "HRESULT")
        return iHours
    }

    /**
     * 
     * @param {Integer} iHours 
     * @returns {HRESULT} 
     */
    put_Hours(iHours) {
        result := ComCall(22, this, "int", iHours, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_HoursSpecified() {
        result := ComCall(23, this, "short*", &bHoursSpecified := 0, "HRESULT")
        return bHoursSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bHoursSpecified 
     * @returns {HRESULT} 
     */
    put_HoursSpecified(bHoursSpecified) {
        result := ComCall(24, this, "short", bHoursSpecified, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Minutes() {
        result := ComCall(25, this, "int*", &iMinutes := 0, "HRESULT")
        return iMinutes
    }

    /**
     * 
     * @param {Integer} iMinutes 
     * @returns {HRESULT} 
     */
    put_Minutes(iMinutes) {
        result := ComCall(26, this, "int", iMinutes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MinutesSpecified() {
        result := ComCall(27, this, "short*", &bMinutesSpecified := 0, "HRESULT")
        return bMinutesSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bMinutesSpecified 
     * @returns {HRESULT} 
     */
    put_MinutesSpecified(bMinutesSpecified) {
        result := ComCall(28, this, "short", bMinutesSpecified, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Seconds() {
        result := ComCall(29, this, "int*", &iSeconds := 0, "HRESULT")
        return iSeconds
    }

    /**
     * 
     * @param {Integer} iSeconds 
     * @returns {HRESULT} 
     */
    put_Seconds(iSeconds) {
        result := ComCall(30, this, "int", iSeconds, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_SecondsSpecified() {
        result := ComCall(31, this, "short*", &bSecondsSpecified := 0, "HRESULT")
        return bSecondsSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSecondsSpecified 
     * @returns {HRESULT} 
     */
    put_SecondsSpecified(bSecondsSpecified) {
        result := ComCall(32, this, "short", bSecondsSpecified, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Microseconds() {
        result := ComCall(33, this, "int*", &iMicroseconds := 0, "HRESULT")
        return iMicroseconds
    }

    /**
     * 
     * @param {Integer} iMicroseconds 
     * @returns {HRESULT} 
     */
    put_Microseconds(iMicroseconds) {
        result := ComCall(34, this, "int", iMicroseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MicrosecondsSpecified() {
        result := ComCall(35, this, "short*", &bMicrosecondsSpecified := 0, "HRESULT")
        return bMicrosecondsSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bMicrosecondsSpecified 
     * @returns {HRESULT} 
     */
    put_MicrosecondsSpecified(bMicrosecondsSpecified) {
        result := ComCall(36, this, "short", bMicrosecondsSpecified, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UTC() {
        result := ComCall(37, this, "int*", &iUTC := 0, "HRESULT")
        return iUTC
    }

    /**
     * 
     * @param {Integer} iUTC 
     * @returns {HRESULT} 
     */
    put_UTC(iUTC) {
        result := ComCall(38, this, "int", iUTC, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_UTCSpecified() {
        result := ComCall(39, this, "short*", &bUTCSpecified := 0, "HRESULT")
        return bUTCSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUTCSpecified 
     * @returns {HRESULT} 
     */
    put_UTCSpecified(bUTCSpecified) {
        result := ComCall(40, this, "short", bUTCSpecified, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsInterval() {
        result := ComCall(41, this, "short*", &bIsInterval := 0, "HRESULT")
        return bIsInterval
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsInterval 
     * @returns {HRESULT} 
     */
    put_IsInterval(bIsInterval) {
        result := ComCall(42, this, "short", bIsInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsLocal 
     * @returns {Float} 
     */
    GetVarDate(bIsLocal) {
        result := ComCall(43, this, "short", bIsLocal, "double*", &dVarDate := 0, "HRESULT")
        return dVarDate
    }

    /**
     * 
     * @param {Float} dVarDate 
     * @param {VARIANT_BOOL} bIsLocal 
     * @returns {HRESULT} 
     */
    SetVarDate(dVarDate, bIsLocal) {
        result := ComCall(44, this, "double", dVarDate, "short", bIsLocal, "HRESULT")
        return result
    }

    /**
     * Retrieves the date and time that a file or directory was created, last accessed, and last modified.
     * @param {VARIANT_BOOL} bIsLocal 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfiletime
     */
    GetFileTime(bIsLocal) {
        strFileTime := BSTR()
        result := ComCall(45, this, "short", bIsLocal, "ptr", strFileTime, "HRESULT")
        return strFileTime
    }

    /**
     * Sets the date and time that the specified file or directory was created, last accessed, or last modified.
     * @param {BSTR} strFileTime 
     * @param {VARIANT_BOOL} bIsLocal 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-setfiletime
     */
    SetFileTime(strFileTime, bIsLocal) {
        strFileTime := strFileTime is String ? BSTR.Alloc(strFileTime).Value : strFileTime

        result := ComCall(46, this, "ptr", strFileTime, "short", bIsLocal, "HRESULT")
        return result
    }
}
