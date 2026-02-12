#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\Calendar.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\DateTime.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ICalendar extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendar
     * @type {Guid}
     */
    static IID => Guid("{ca30221d-86d9-40fb-a26b-d44eb7cf08ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "SetToMin", "SetToMax", "get_Languages", "get_NumeralSystem", "put_NumeralSystem", "GetCalendarSystem", "ChangeCalendarSystem", "GetClock", "ChangeClock", "GetDateTime", "SetDateTime", "SetToNow", "get_FirstEra", "get_LastEra", "get_NumberOfEras", "get_Era", "put_Era", "AddEras", "EraAsFullString", "EraAsString1", "get_FirstYearInThisEra", "get_LastYearInThisEra", "get_NumberOfYearsInThisEra", "get_Year", "put_Year", "AddYears", "YearAsString", "YearAsTruncatedString", "YearAsPaddedString", "get_FirstMonthInThisYear", "get_LastMonthInThisYear", "get_NumberOfMonthsInThisYear", "get_Month", "put_Month", "AddMonths", "MonthAsFullString", "MonthAsString1", "MonthAsFullSoloString", "MonthAsSoloString1", "MonthAsNumericString", "MonthAsPaddedNumericString", "AddWeeks", "get_FirstDayInThisMonth", "get_LastDayInThisMonth", "get_NumberOfDaysInThisMonth", "get_Day", "put_Day", "AddDays", "DayAsString", "DayAsPaddedString", "get_DayOfWeek", "DayOfWeekAsFullString", "DayOfWeekAsString1", "DayOfWeekAsFullSoloString", "DayOfWeekAsSoloString1", "get_FirstPeriodInThisDay", "get_LastPeriodInThisDay", "get_NumberOfPeriodsInThisDay", "get_Period", "put_Period", "AddPeriods", "PeriodAsFullString", "PeriodAsString1", "get_FirstHourInThisPeriod", "get_LastHourInThisPeriod", "get_NumberOfHoursInThisPeriod", "get_Hour", "put_Hour", "AddHours", "HourAsString", "HourAsPaddedString", "get_Minute", "put_Minute", "AddMinutes", "MinuteAsString", "MinuteAsPaddedString", "get_Second", "put_Second", "AddSeconds", "SecondAsString", "SecondAsPaddedString", "get_Nanosecond", "put_Nanosecond", "AddNanoseconds", "NanosecondAsString", "NanosecondAsPaddedString", "Compare", "CompareDateTime", "CopyTo", "get_FirstMinuteInThisHour", "get_LastMinuteInThisHour", "get_NumberOfMinutesInThisHour", "get_FirstSecondInThisMinute", "get_LastSecondInThisMinute", "get_NumberOfSecondsInThisMinute", "get_ResolvedLanguage", "get_IsDaylightSavingTime"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * @type {HSTRING} 
     */
    NumeralSystem {
        get => this.get_NumeralSystem()
        set => this.put_NumeralSystem(value)
    }

    /**
     * @type {Integer} 
     */
    FirstEra {
        get => this.get_FirstEra()
    }

    /**
     * @type {Integer} 
     */
    LastEra {
        get => this.get_LastEra()
    }

    /**
     * @type {Integer} 
     */
    NumberOfEras {
        get => this.get_NumberOfEras()
    }

    /**
     * @type {Integer} 
     */
    Era {
        get => this.get_Era()
        set => this.put_Era(value)
    }

    /**
     * @type {Integer} 
     */
    FirstYearInThisEra {
        get => this.get_FirstYearInThisEra()
    }

    /**
     * @type {Integer} 
     */
    LastYearInThisEra {
        get => this.get_LastYearInThisEra()
    }

    /**
     * @type {Integer} 
     */
    NumberOfYearsInThisEra {
        get => this.get_NumberOfYearsInThisEra()
    }

    /**
     * @type {Integer} 
     */
    Year {
        get => this.get_Year()
        set => this.put_Year(value)
    }

    /**
     * @type {Integer} 
     */
    FirstMonthInThisYear {
        get => this.get_FirstMonthInThisYear()
    }

    /**
     * @type {Integer} 
     */
    LastMonthInThisYear {
        get => this.get_LastMonthInThisYear()
    }

    /**
     * @type {Integer} 
     */
    NumberOfMonthsInThisYear {
        get => this.get_NumberOfMonthsInThisYear()
    }

    /**
     * @type {Integer} 
     */
    Month {
        get => this.get_Month()
        set => this.put_Month(value)
    }

    /**
     * @type {Integer} 
     */
    FirstDayInThisMonth {
        get => this.get_FirstDayInThisMonth()
    }

    /**
     * @type {Integer} 
     */
    LastDayInThisMonth {
        get => this.get_LastDayInThisMonth()
    }

    /**
     * @type {Integer} 
     */
    NumberOfDaysInThisMonth {
        get => this.get_NumberOfDaysInThisMonth()
    }

    /**
     * @type {Integer} 
     */
    Day {
        get => this.get_Day()
        set => this.put_Day(value)
    }

    /**
     * @type {Integer} 
     */
    DayOfWeek {
        get => this.get_DayOfWeek()
    }

    /**
     * @type {Integer} 
     */
    FirstPeriodInThisDay {
        get => this.get_FirstPeriodInThisDay()
    }

    /**
     * @type {Integer} 
     */
    LastPeriodInThisDay {
        get => this.get_LastPeriodInThisDay()
    }

    /**
     * @type {Integer} 
     */
    NumberOfPeriodsInThisDay {
        get => this.get_NumberOfPeriodsInThisDay()
    }

    /**
     * @type {Integer} 
     */
    Period {
        get => this.get_Period()
        set => this.put_Period(value)
    }

    /**
     * @type {Integer} 
     */
    FirstHourInThisPeriod {
        get => this.get_FirstHourInThisPeriod()
    }

    /**
     * @type {Integer} 
     */
    LastHourInThisPeriod {
        get => this.get_LastHourInThisPeriod()
    }

    /**
     * @type {Integer} 
     */
    NumberOfHoursInThisPeriod {
        get => this.get_NumberOfHoursInThisPeriod()
    }

    /**
     * @type {Integer} 
     */
    Hour {
        get => this.get_Hour()
        set => this.put_Hour(value)
    }

    /**
     * @type {Integer} 
     */
    Minute {
        get => this.get_Minute()
        set => this.put_Minute(value)
    }

    /**
     * @type {Integer} 
     */
    Second {
        get => this.get_Second()
        set => this.put_Second(value)
    }

    /**
     * @type {Integer} 
     */
    Nanosecond {
        get => this.get_Nanosecond()
        set => this.put_Nanosecond(value)
    }

    /**
     * @type {Integer} 
     */
    FirstMinuteInThisHour {
        get => this.get_FirstMinuteInThisHour()
    }

    /**
     * @type {Integer} 
     */
    LastMinuteInThisHour {
        get => this.get_LastMinuteInThisHour()
    }

    /**
     * @type {Integer} 
     */
    NumberOfMinutesInThisHour {
        get => this.get_NumberOfMinutesInThisHour()
    }

    /**
     * @type {Integer} 
     */
    FirstSecondInThisMinute {
        get => this.get_FirstSecondInThisMinute()
    }

    /**
     * @type {Integer} 
     */
    LastSecondInThisMinute {
        get => this.get_LastSecondInThisMinute()
    }

    /**
     * @type {Integer} 
     */
    NumberOfSecondsInThisMinute {
        get => this.get_NumberOfSecondsInThisMinute()
    }

    /**
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * @type {Boolean} 
     */
    IsDaylightSavingTime {
        get => this.get_IsDaylightSavingTime()
    }

    /**
     * Clone Method Example (VC++)
     * @returns {Calendar} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Calendar(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetToMin() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetToMax() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Languages() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NumeralSystem() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_NumeralSystem(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetCalendarSystem() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    ChangeCalendarSystem(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetClock() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    ChangeClock(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    GetDateTime() {
        result_ := DateTime()
        result := ComCall(16, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    SetDateTime(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetToNow() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstEra() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastEra() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfEras() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Era() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Era(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} eras 
     * @returns {HRESULT} 
     */
    AddEras(eras) {
        result := ComCall(24, this, "int", eras, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    EraAsFullString() {
        result_ := HSTRING()
        result := ComCall(25, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     */
    EraAsString1(idealLength) {
        result_ := HSTRING()
        result := ComCall(26, this, "int", idealLength, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstYearInThisEra() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastYearInThisEra() {
        result := ComCall(28, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfYearsInThisEra() {
        result := ComCall(29, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Year() {
        result := ComCall(30, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Year(value) {
        result := ComCall(31, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} years 
     * @returns {HRESULT} 
     */
    AddYears(years) {
        result := ComCall(32, this, "int", years, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    YearAsString() {
        result_ := HSTRING()
        result := ComCall(33, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} remainingDigits 
     * @returns {HSTRING} 
     */
    YearAsTruncatedString(remainingDigits) {
        result_ := HSTRING()
        result := ComCall(34, this, "int", remainingDigits, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} minDigits 
     * @returns {HSTRING} 
     */
    YearAsPaddedString(minDigits) {
        result_ := HSTRING()
        result := ComCall(35, this, "int", minDigits, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstMonthInThisYear() {
        result := ComCall(36, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastMonthInThisYear() {
        result := ComCall(37, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfMonthsInThisYear() {
        result := ComCall(38, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Month() {
        result := ComCall(39, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Month(value) {
        result := ComCall(40, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} months 
     * @returns {HRESULT} 
     */
    AddMonths(months) {
        result := ComCall(41, this, "int", months, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    MonthAsFullString() {
        result_ := HSTRING()
        result := ComCall(42, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     */
    MonthAsString1(idealLength) {
        result_ := HSTRING()
        result := ComCall(43, this, "int", idealLength, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    MonthAsFullSoloString() {
        result_ := HSTRING()
        result := ComCall(44, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     */
    MonthAsSoloString1(idealLength) {
        result_ := HSTRING()
        result := ComCall(45, this, "int", idealLength, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    MonthAsNumericString() {
        result_ := HSTRING()
        result := ComCall(46, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} minDigits 
     * @returns {HSTRING} 
     */
    MonthAsPaddedNumericString(minDigits) {
        result_ := HSTRING()
        result := ComCall(47, this, "int", minDigits, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} weeks 
     * @returns {HRESULT} 
     */
    AddWeeks(weeks) {
        result := ComCall(48, this, "int", weeks, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstDayInThisMonth() {
        result := ComCall(49, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastDayInThisMonth() {
        result := ComCall(50, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfDaysInThisMonth() {
        result := ComCall(51, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Day() {
        result := ComCall(52, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Day(value) {
        result := ComCall(53, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     */
    AddDays(days) {
        result := ComCall(54, this, "int", days, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    DayAsString() {
        result_ := HSTRING()
        result := ComCall(55, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} minDigits 
     * @returns {HSTRING} 
     */
    DayAsPaddedString(minDigits) {
        result_ := HSTRING()
        result := ComCall(56, this, "int", minDigits, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DayOfWeek() {
        result := ComCall(57, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    DayOfWeekAsFullString() {
        result_ := HSTRING()
        result := ComCall(58, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     */
    DayOfWeekAsString1(idealLength) {
        result_ := HSTRING()
        result := ComCall(59, this, "int", idealLength, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    DayOfWeekAsFullSoloString() {
        result_ := HSTRING()
        result := ComCall(60, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     */
    DayOfWeekAsSoloString1(idealLength) {
        result_ := HSTRING()
        result := ComCall(61, this, "int", idealLength, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstPeriodInThisDay() {
        result := ComCall(62, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastPeriodInThisDay() {
        result := ComCall(63, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfPeriodsInThisDay() {
        result := ComCall(64, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Period() {
        result := ComCall(65, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Period(value) {
        result := ComCall(66, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} periods 
     * @returns {HRESULT} 
     */
    AddPeriods(periods) {
        result := ComCall(67, this, "int", periods, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    PeriodAsFullString() {
        result_ := HSTRING()
        result := ComCall(68, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     */
    PeriodAsString1(idealLength) {
        result_ := HSTRING()
        result := ComCall(69, this, "int", idealLength, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstHourInThisPeriod() {
        result := ComCall(70, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastHourInThisPeriod() {
        result := ComCall(71, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfHoursInThisPeriod() {
        result := ComCall(72, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Hour() {
        result := ComCall(73, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Hour(value) {
        result := ComCall(74, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} hours 
     * @returns {HRESULT} 
     */
    AddHours(hours) {
        result := ComCall(75, this, "int", hours, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    HourAsString() {
        result_ := HSTRING()
        result := ComCall(76, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} minDigits 
     * @returns {HSTRING} 
     */
    HourAsPaddedString(minDigits) {
        result_ := HSTRING()
        result := ComCall(77, this, "int", minDigits, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Minute() {
        result := ComCall(78, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Minute(value) {
        result := ComCall(79, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     */
    AddMinutes(minutes) {
        result := ComCall(80, this, "int", minutes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    MinuteAsString() {
        result_ := HSTRING()
        result := ComCall(81, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} minDigits 
     * @returns {HSTRING} 
     */
    MinuteAsPaddedString(minDigits) {
        result_ := HSTRING()
        result := ComCall(82, this, "int", minDigits, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Second() {
        result := ComCall(83, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Second(value) {
        result := ComCall(84, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} seconds 
     * @returns {HRESULT} 
     */
    AddSeconds(seconds) {
        result := ComCall(85, this, "int", seconds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    SecondAsString() {
        result_ := HSTRING()
        result := ComCall(86, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} minDigits 
     * @returns {HSTRING} 
     */
    SecondAsPaddedString(minDigits) {
        result_ := HSTRING()
        result := ComCall(87, this, "int", minDigits, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Nanosecond() {
        result := ComCall(88, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Nanosecond(value) {
        result := ComCall(89, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} nanoseconds 
     * @returns {HRESULT} 
     */
    AddNanoseconds(nanoseconds) {
        result := ComCall(90, this, "int", nanoseconds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    NanosecondAsString() {
        result_ := HSTRING()
        result := ComCall(91, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} minDigits 
     * @returns {HSTRING} 
     */
    NanosecondAsPaddedString(minDigits) {
        result_ := HSTRING()
        result := ComCall(92, this, "int", minDigits, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * The CompareAddresses function compares two addresses, indicating that one of the addresses is greater than, less than, or equal to the other address.
     * @remarks
     * An address that is less than another address indicates a previous frame. An address that is greater than another address indicates a later frame.
     * 
     * Network Monitor provides two other functions, [CompareFrameDestAddress](compareframedestaddress.md) and [CompareFrameSourceAddress](compareframesourceaddress.md), which you can use to compare addresses. The **CompareFrameDestAddress** function compares a given address to the frame's destination address, and the **CompareFrameSourceAddress** function compares a given address to the frame's source address.
     * @param {Calendar} other 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/compareaddresses
     */
    Compare(other) {
        result := ComCall(93, this, "ptr", other, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DateTime} other 
     * @returns {Integer} 
     */
    CompareDateTime(other) {
        result := ComCall(94, this, "ptr", other, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * CopyTo Method (ADO)
     * @remarks
     * This method copies the specified number of characters or bytes, starting from the current position specified by the [Position](./position-property-ado.md) property. If the specified number is more than the available number of bytes until **EOS**, then only characters or bytes from the current position to **EOS** are copied. If the value of *NumChars* is -1, or omitted, all characters or bytes starting from the current position are copied.  
     *   
     *  If there are existing characters or bytes in the destination stream, all contents beyond the point where the copy ends remain, and are not truncated. **Position** becomes the byte immediately following the last byte copied. If you want to truncate these bytes, call [SetEOS](./seteos-method.md).  
     *   
     *  **CopyTo** should be used to copy data to a destination **Stream** of the same type as the source **Stream** (their **Type** property settings are both **adTypeText** or both **adTypeBinary**). For text **Stream** objects, you can change the [Charset](./charset-property-ado.md) property setting of the destination **Stream** to translate from one character set to another. Also, text **Stream** objects can be successfully copied into binary **Stream** objects, but binary **Stream** objects cannot be copied into text **Stream** objects.
     * @param {Calendar} other 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/copyto-method-ado
     */
    CopyTo(other) {
        result := ComCall(95, this, "ptr", other, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstMinuteInThisHour() {
        result := ComCall(96, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastMinuteInThisHour() {
        result := ComCall(97, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfMinutesInThisHour() {
        result := ComCall(98, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstSecondInThisMinute() {
        result := ComCall(99, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastSecondInThisMinute() {
        result := ComCall(100, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfSecondsInThisMinute() {
        result := ComCall(101, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedLanguage() {
        value := HSTRING()
        result := ComCall(102, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDaylightSavingTime() {
        result := ComCall(103, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
