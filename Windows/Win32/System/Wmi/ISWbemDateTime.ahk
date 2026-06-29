#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemDateTime extends IDispatch {
    /**
     * The interface identifier for ISWbemDateTime
     * @type {Guid}
     */
    static IID := Guid("{5e97458a-cf77-11d3-b38f-00105a1f473a}")

    /**
     * The class identifier for SWbemDateTime
     * @type {Guid}
     */
    static CLSID := Guid("{47dfbe54-cf76-11d3-b38f-00105a1f473a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemDateTime interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Value                 : IntPtr
        put_Value                 : IntPtr
        get_Year                  : IntPtr
        put_Year                  : IntPtr
        get_YearSpecified         : IntPtr
        put_YearSpecified         : IntPtr
        get_Month                 : IntPtr
        put_Month                 : IntPtr
        get_MonthSpecified        : IntPtr
        put_MonthSpecified        : IntPtr
        get_Day                   : IntPtr
        put_Day                   : IntPtr
        get_DaySpecified          : IntPtr
        put_DaySpecified          : IntPtr
        get_Hours                 : IntPtr
        put_Hours                 : IntPtr
        get_HoursSpecified        : IntPtr
        put_HoursSpecified        : IntPtr
        get_Minutes               : IntPtr
        put_Minutes               : IntPtr
        get_MinutesSpecified      : IntPtr
        put_MinutesSpecified      : IntPtr
        get_Seconds               : IntPtr
        put_Seconds               : IntPtr
        get_SecondsSpecified      : IntPtr
        put_SecondsSpecified      : IntPtr
        get_Microseconds          : IntPtr
        put_Microseconds          : IntPtr
        get_MicrosecondsSpecified : IntPtr
        put_MicrosecondsSpecified : IntPtr
        get_UTC                   : IntPtr
        put_UTC                   : IntPtr
        get_UTCSpecified          : IntPtr
        put_UTCSpecified          : IntPtr
        get_IsInterval            : IntPtr
        put_IsInterval            : IntPtr
        GetVarDate                : IntPtr
        SetVarDate                : IntPtr
        GetFileTime               : IntPtr
        SetFileTime               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemDateTime.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        strValue := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, strValue, "HRESULT")
        return strValue
    }

    /**
     * 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    put_Value(strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(8, this, BSTR, strValue, "HRESULT")
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
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &bYearSpecified := 0, "HRESULT")
        return bYearSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bYearSpecified 
     * @returns {HRESULT} 
     */
    put_YearSpecified(bYearSpecified) {
        result := ComCall(12, this, VARIANT_BOOL, bYearSpecified, "HRESULT")
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
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &bMonthSpecified := 0, "HRESULT")
        return bMonthSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bMonthSpecified 
     * @returns {HRESULT} 
     */
    put_MonthSpecified(bMonthSpecified) {
        result := ComCall(16, this, VARIANT_BOOL, bMonthSpecified, "HRESULT")
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
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &bDaySpecified := 0, "HRESULT")
        return bDaySpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bDaySpecified 
     * @returns {HRESULT} 
     */
    put_DaySpecified(bDaySpecified) {
        result := ComCall(20, this, VARIANT_BOOL, bDaySpecified, "HRESULT")
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
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &bHoursSpecified := 0, "HRESULT")
        return bHoursSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bHoursSpecified 
     * @returns {HRESULT} 
     */
    put_HoursSpecified(bHoursSpecified) {
        result := ComCall(24, this, VARIANT_BOOL, bHoursSpecified, "HRESULT")
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
        result := ComCall(27, this, VARIANT_BOOL.Ptr, &bMinutesSpecified := 0, "HRESULT")
        return bMinutesSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bMinutesSpecified 
     * @returns {HRESULT} 
     */
    put_MinutesSpecified(bMinutesSpecified) {
        result := ComCall(28, this, VARIANT_BOOL, bMinutesSpecified, "HRESULT")
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
        result := ComCall(31, this, VARIANT_BOOL.Ptr, &bSecondsSpecified := 0, "HRESULT")
        return bSecondsSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSecondsSpecified 
     * @returns {HRESULT} 
     */
    put_SecondsSpecified(bSecondsSpecified) {
        result := ComCall(32, this, VARIANT_BOOL, bSecondsSpecified, "HRESULT")
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
        result := ComCall(35, this, VARIANT_BOOL.Ptr, &bMicrosecondsSpecified := 0, "HRESULT")
        return bMicrosecondsSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bMicrosecondsSpecified 
     * @returns {HRESULT} 
     */
    put_MicrosecondsSpecified(bMicrosecondsSpecified) {
        result := ComCall(36, this, VARIANT_BOOL, bMicrosecondsSpecified, "HRESULT")
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
        result := ComCall(39, this, VARIANT_BOOL.Ptr, &bUTCSpecified := 0, "HRESULT")
        return bUTCSpecified
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUTCSpecified 
     * @returns {HRESULT} 
     */
    put_UTCSpecified(bUTCSpecified) {
        result := ComCall(40, this, VARIANT_BOOL, bUTCSpecified, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsInterval() {
        result := ComCall(41, this, VARIANT_BOOL.Ptr, &bIsInterval := 0, "HRESULT")
        return bIsInterval
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsInterval 
     * @returns {HRESULT} 
     */
    put_IsInterval(bIsInterval) {
        result := ComCall(42, this, VARIANT_BOOL, bIsInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsLocal 
     * @returns {Float} 
     */
    GetVarDate(bIsLocal) {
        result := ComCall(43, this, VARIANT_BOOL, bIsLocal, "double*", &dVarDate := 0, "HRESULT")
        return dVarDate
    }

    /**
     * 
     * @param {Float} dVarDate 
     * @param {VARIANT_BOOL} bIsLocal 
     * @returns {HRESULT} 
     */
    SetVarDate(dVarDate, bIsLocal) {
        result := ComCall(44, this, "double", dVarDate, VARIANT_BOOL, bIsLocal, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfiletime
     */
    GetFileTime(bIsLocal) {
        strFileTime := BSTR.Owned()
        result := ComCall(45, this, VARIANT_BOOL, bIsLocal, BSTR.Ptr, strFileTime, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfiletime
     */
    SetFileTime(strFileTime, bIsLocal) {
        strFileTime := strFileTime is String ? BSTR.Alloc(strFileTime).Value : strFileTime

        result := ComCall(46, this, BSTR, strFileTime, VARIANT_BOOL, bIsLocal, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISWbemDateTime.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
        this.vtbl.get_Year := CallbackCreate(GetMethod(implObj, "get_Year"), flags, 2)
        this.vtbl.put_Year := CallbackCreate(GetMethod(implObj, "put_Year"), flags, 2)
        this.vtbl.get_YearSpecified := CallbackCreate(GetMethod(implObj, "get_YearSpecified"), flags, 2)
        this.vtbl.put_YearSpecified := CallbackCreate(GetMethod(implObj, "put_YearSpecified"), flags, 2)
        this.vtbl.get_Month := CallbackCreate(GetMethod(implObj, "get_Month"), flags, 2)
        this.vtbl.put_Month := CallbackCreate(GetMethod(implObj, "put_Month"), flags, 2)
        this.vtbl.get_MonthSpecified := CallbackCreate(GetMethod(implObj, "get_MonthSpecified"), flags, 2)
        this.vtbl.put_MonthSpecified := CallbackCreate(GetMethod(implObj, "put_MonthSpecified"), flags, 2)
        this.vtbl.get_Day := CallbackCreate(GetMethod(implObj, "get_Day"), flags, 2)
        this.vtbl.put_Day := CallbackCreate(GetMethod(implObj, "put_Day"), flags, 2)
        this.vtbl.get_DaySpecified := CallbackCreate(GetMethod(implObj, "get_DaySpecified"), flags, 2)
        this.vtbl.put_DaySpecified := CallbackCreate(GetMethod(implObj, "put_DaySpecified"), flags, 2)
        this.vtbl.get_Hours := CallbackCreate(GetMethod(implObj, "get_Hours"), flags, 2)
        this.vtbl.put_Hours := CallbackCreate(GetMethod(implObj, "put_Hours"), flags, 2)
        this.vtbl.get_HoursSpecified := CallbackCreate(GetMethod(implObj, "get_HoursSpecified"), flags, 2)
        this.vtbl.put_HoursSpecified := CallbackCreate(GetMethod(implObj, "put_HoursSpecified"), flags, 2)
        this.vtbl.get_Minutes := CallbackCreate(GetMethod(implObj, "get_Minutes"), flags, 2)
        this.vtbl.put_Minutes := CallbackCreate(GetMethod(implObj, "put_Minutes"), flags, 2)
        this.vtbl.get_MinutesSpecified := CallbackCreate(GetMethod(implObj, "get_MinutesSpecified"), flags, 2)
        this.vtbl.put_MinutesSpecified := CallbackCreate(GetMethod(implObj, "put_MinutesSpecified"), flags, 2)
        this.vtbl.get_Seconds := CallbackCreate(GetMethod(implObj, "get_Seconds"), flags, 2)
        this.vtbl.put_Seconds := CallbackCreate(GetMethod(implObj, "put_Seconds"), flags, 2)
        this.vtbl.get_SecondsSpecified := CallbackCreate(GetMethod(implObj, "get_SecondsSpecified"), flags, 2)
        this.vtbl.put_SecondsSpecified := CallbackCreate(GetMethod(implObj, "put_SecondsSpecified"), flags, 2)
        this.vtbl.get_Microseconds := CallbackCreate(GetMethod(implObj, "get_Microseconds"), flags, 2)
        this.vtbl.put_Microseconds := CallbackCreate(GetMethod(implObj, "put_Microseconds"), flags, 2)
        this.vtbl.get_MicrosecondsSpecified := CallbackCreate(GetMethod(implObj, "get_MicrosecondsSpecified"), flags, 2)
        this.vtbl.put_MicrosecondsSpecified := CallbackCreate(GetMethod(implObj, "put_MicrosecondsSpecified"), flags, 2)
        this.vtbl.get_UTC := CallbackCreate(GetMethod(implObj, "get_UTC"), flags, 2)
        this.vtbl.put_UTC := CallbackCreate(GetMethod(implObj, "put_UTC"), flags, 2)
        this.vtbl.get_UTCSpecified := CallbackCreate(GetMethod(implObj, "get_UTCSpecified"), flags, 2)
        this.vtbl.put_UTCSpecified := CallbackCreate(GetMethod(implObj, "put_UTCSpecified"), flags, 2)
        this.vtbl.get_IsInterval := CallbackCreate(GetMethod(implObj, "get_IsInterval"), flags, 2)
        this.vtbl.put_IsInterval := CallbackCreate(GetMethod(implObj, "put_IsInterval"), flags, 2)
        this.vtbl.GetVarDate := CallbackCreate(GetMethod(implObj, "GetVarDate"), flags, 3)
        this.vtbl.SetVarDate := CallbackCreate(GetMethod(implObj, "SetVarDate"), flags, 3)
        this.vtbl.GetFileTime := CallbackCreate(GetMethod(implObj, "GetFileTime"), flags, 3)
        this.vtbl.SetFileTime := CallbackCreate(GetMethod(implObj, "SetFileTime"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
        CallbackFree(this.vtbl.get_Year)
        CallbackFree(this.vtbl.put_Year)
        CallbackFree(this.vtbl.get_YearSpecified)
        CallbackFree(this.vtbl.put_YearSpecified)
        CallbackFree(this.vtbl.get_Month)
        CallbackFree(this.vtbl.put_Month)
        CallbackFree(this.vtbl.get_MonthSpecified)
        CallbackFree(this.vtbl.put_MonthSpecified)
        CallbackFree(this.vtbl.get_Day)
        CallbackFree(this.vtbl.put_Day)
        CallbackFree(this.vtbl.get_DaySpecified)
        CallbackFree(this.vtbl.put_DaySpecified)
        CallbackFree(this.vtbl.get_Hours)
        CallbackFree(this.vtbl.put_Hours)
        CallbackFree(this.vtbl.get_HoursSpecified)
        CallbackFree(this.vtbl.put_HoursSpecified)
        CallbackFree(this.vtbl.get_Minutes)
        CallbackFree(this.vtbl.put_Minutes)
        CallbackFree(this.vtbl.get_MinutesSpecified)
        CallbackFree(this.vtbl.put_MinutesSpecified)
        CallbackFree(this.vtbl.get_Seconds)
        CallbackFree(this.vtbl.put_Seconds)
        CallbackFree(this.vtbl.get_SecondsSpecified)
        CallbackFree(this.vtbl.put_SecondsSpecified)
        CallbackFree(this.vtbl.get_Microseconds)
        CallbackFree(this.vtbl.put_Microseconds)
        CallbackFree(this.vtbl.get_MicrosecondsSpecified)
        CallbackFree(this.vtbl.put_MicrosecondsSpecified)
        CallbackFree(this.vtbl.get_UTC)
        CallbackFree(this.vtbl.put_UTC)
        CallbackFree(this.vtbl.get_UTCSpecified)
        CallbackFree(this.vtbl.put_UTCSpecified)
        CallbackFree(this.vtbl.get_IsInterval)
        CallbackFree(this.vtbl.put_IsInterval)
        CallbackFree(this.vtbl.GetVarDate)
        CallbackFree(this.vtbl.SetVarDate)
        CallbackFree(this.vtbl.GetFileTime)
        CallbackFree(this.vtbl.SetFileTime)
    }
}
