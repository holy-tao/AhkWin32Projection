#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICalendar.ahk
#Include .\ITimeZoneOnCalendar.ahk
#Include .\ICalendarFactory2.ahk
#Include .\ICalendarFactory.ahk
#Include ..\..\Guid.ahk

/**
 * Manipulates the representation of a [DateTime](../windows.foundation/datetime.md) within a given calendar and clock.
 * @remarks
 * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
 * 
 * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class Calendar extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICalendar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICalendar.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [Calendar](calendar.md) object that is initialized with a language list, calendar, clock, and time zone.
     * @param {IIterable<HSTRING>} languages The list of language identifiers, in priority order, representing the choice of languages. These are used for resolving patterns to strings. See Remarks for [Calendar](calendar.md).
     * @param {HSTRING} calendar_ The calendar identifier to use.
     * @param {HSTRING} clock The clock identifier to use.
     * @param {HSTRING} timeZoneId An identifier from the [IANA Time Zone Database](https://www.iana.org/time-zones) which identifies the time zone that should be used (for example, "America/Los_Angeles" for Pacific Time).
     * @returns {Calendar} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.#ctor
     */
    static CreateCalendarWithTimeZone(languages, calendar_, clock, timeZoneId) {
        if (!Calendar.HasProp("__ICalendarFactory2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Calendar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarFactory2.IID)
            Calendar.__ICalendarFactory2 := ICalendarFactory2(factoryPtr)
        }

        return Calendar.__ICalendarFactory2.CreateCalendarWithTimeZone(languages, calendar_, clock, timeZoneId)
    }

    /**
     * Creates a [Calendar](calendar.md) object that is initialized with a language list.
     * @remarks
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
     * @param {IIterable<HSTRING>} languages The list of language identifiers, in priority order, that represents the choice of languages. These are used for resolving patterns to strings.
     * @returns {Calendar} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.#ctor
     */
    static CreateCalendarDefaultCalendarAndClock(languages) {
        if (!Calendar.HasProp("__ICalendarFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Calendar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarFactory.IID)
            Calendar.__ICalendarFactory := ICalendarFactory(factoryPtr)
        }

        return Calendar.__ICalendarFactory.CreateCalendarDefaultCalendarAndClock(languages)
    }

    /**
     * Creates a [Calendar](calendar.md) object that is initialized with a language list, calendar, and clock.
     * @param {IIterable<HSTRING>} languages The list of language identifiers, in priority order, representing the choice of languages. These are used for resolving patterns to strings. See Remarks for [Calendar](calendar.md).
     * @param {HSTRING} calendar_ The calendar identifier to use.
     * @param {HSTRING} clock The clock identifier to use.
     * @returns {Calendar} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.#ctor
     */
    static CreateCalendar(languages, calendar_, clock) {
        if (!Calendar.HasProp("__ICalendarFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Calendar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarFactory.IID)
            Calendar.__ICalendarFactory := ICalendarFactory(factoryPtr)
        }

        return Calendar.__ICalendarFactory.CreateCalendar(languages, calendar_, clock)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the priority list of language identifiers that is used when formatting components as strings.
     * @remarks
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.languages
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * Gets or sets the numbering system that is used when formatting components as strings.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.numeralsystem
     * @type {HSTRING} 
     */
    NumeralSystem {
        get => this.get_NumeralSystem()
        set => this.put_NumeralSystem(value)
    }

    /**
     * Gets the first [Era](calendar_era.md) available in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.firstera
     * @type {Integer} 
     */
    FirstEra {
        get => this.get_FirstEra()
    }

    /**
     * Gets the last [Era](calendar_era.md) available in the calendar.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.lastera
     * @type {Integer} 
     */
    LastEra {
        get => this.get_LastEra()
    }

    /**
     * Gets the number of eras in this [Calendar](calendar.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.numberoferas
     * @type {Integer} 
     */
    NumberOfEras {
        get => this.get_NumberOfEras()
    }

    /**
     * Gets or sets the era.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.era
     * @type {Integer} 
     */
    Era {
        get => this.get_Era()
        set => this.put_Era(value)
    }

    /**
     * Gets the first [Year](calendar_year.md) of the current [Era](calendar_era.md).
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.firstyearinthisera
     * @type {Integer} 
     */
    FirstYearInThisEra {
        get => this.get_FirstYearInThisEra()
    }

    /**
     * Gets the last [Year](calendar_year.md) of the current [Era](calendar_era.md).
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.lastyearinthisera
     * @type {Integer} 
     */
    LastYearInThisEra {
        get => this.get_LastYearInThisEra()
    }

    /**
     * Gets the number of years in the current era of this [Calendar](calendar.md) object.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.numberofyearsinthisera
     * @type {Integer} 
     */
    NumberOfYearsInThisEra {
        get => this.get_NumberOfYearsInThisEra()
    }

    /**
     * Gets or sets the year.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.year
     * @type {Integer} 
     */
    Year {
        get => this.get_Year()
        set => this.put_Year(value)
    }

    /**
     * Gets the first [Month](calendar_month.md) of the current [Year](calendar_year.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.firstmonthinthisyear
     * @type {Integer} 
     */
    FirstMonthInThisYear {
        get => this.get_FirstMonthInThisYear()
    }

    /**
     * Gets the last [Month](calendar_month.md) of the current [Year](calendar_year.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.lastmonthinthisyear
     * @type {Integer} 
     */
    LastMonthInThisYear {
        get => this.get_LastMonthInThisYear()
    }

    /**
     * Gets the number of months in the current year of this [Calendar](calendar.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.numberofmonthsinthisyear
     * @type {Integer} 
     */
    NumberOfMonthsInThisYear {
        get => this.get_NumberOfMonthsInThisYear()
    }

    /**
     * Gets or sets the month.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.month
     * @type {Integer} 
     */
    Month {
        get => this.get_Month()
        set => this.put_Month(value)
    }

    /**
     * Gets the first [Day](calendar_day.md) of the current [Month](calendar_month.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.firstdayinthismonth
     * @type {Integer} 
     */
    FirstDayInThisMonth {
        get => this.get_FirstDayInThisMonth()
    }

    /**
     * Gets the last [Day](calendar_day.md) of the current [Month](calendar_month.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.lastdayinthismonth
     * @type {Integer} 
     */
    LastDayInThisMonth {
        get => this.get_LastDayInThisMonth()
    }

    /**
     * Gets the number of days in the current month of this [Calendar](calendar.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.numberofdaysinthismonth
     * @type {Integer} 
     */
    NumberOfDaysInThisMonth {
        get => this.get_NumberOfDaysInThisMonth()
    }

    /**
     * Gets or sets the day.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.day
     * @type {Integer} 
     */
    Day {
        get => this.get_Day()
        set => this.put_Day(value)
    }

    /**
     * Gets the day of the week.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.dayofweek
     * @type {Integer} 
     */
    DayOfWeek {
        get => this.get_DayOfWeek()
    }

    /**
     * Gets the first [Period](calendar_period.md) of the current [Day](calendar_day.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.firstperiodinthisday
     * @type {Integer} 
     */
    FirstPeriodInThisDay {
        get => this.get_FirstPeriodInThisDay()
    }

    /**
     * Gets the last [Period](calendar_period.md) of the current [Day](calendar_day.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.lastperiodinthisday
     * @type {Integer} 
     */
    LastPeriodInThisDay {
        get => this.get_LastPeriodInThisDay()
    }

    /**
     * Gets the number of periods in the current day of this [Calendar](calendar.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.numberofperiodsinthisday
     * @type {Integer} 
     */
    NumberOfPeriodsInThisDay {
        get => this.get_NumberOfPeriodsInThisDay()
    }

    /**
     * Gets or sets the period of the current day.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.period
     * @type {Integer} 
     */
    Period {
        get => this.get_Period()
        set => this.put_Period(value)
    }

    /**
     * Gets the first [Hour](calendar_hour.md) of the current [Period](calendar_period.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.firsthourinthisperiod
     * @type {Integer} 
     */
    FirstHourInThisPeriod {
        get => this.get_FirstHourInThisPeriod()
    }

    /**
     * Gets the last [Hour](calendar_hour.md) of the current [Period](calendar_period.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.lasthourinthisperiod
     * @type {Integer} 
     */
    LastHourInThisPeriod {
        get => this.get_LastHourInThisPeriod()
    }

    /**
     * Gets the number of hours in the current day period of this [Calendar](calendar.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.numberofhoursinthisperiod
     * @type {Integer} 
     */
    NumberOfHoursInThisPeriod {
        get => this.get_NumberOfHoursInThisPeriod()
    }

    /**
     * Gets or sets the hour.
     * @remarks
     * This value is dependent on the Preferred languages setting in Settings -> Time & Language -> Language.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.hour
     * @type {Integer} 
     */
    Hour {
        get => this.get_Hour()
        set => this.put_Hour(value)
    }

    /**
     * Gets or sets the minute.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.minute
     * @type {Integer} 
     */
    Minute {
        get => this.get_Minute()
        set => this.put_Minute(value)
    }

    /**
     * Gets or sets the second.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.second
     * @type {Integer} 
     */
    Second {
        get => this.get_Second()
        set => this.put_Second(value)
    }

    /**
     * Gets or sets the nanosecond.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.nanosecond
     * @type {Integer} 
     */
    Nanosecond {
        get => this.get_Nanosecond()
        set => this.put_Nanosecond(value)
    }

    /**
     * Gets the first [Minute](calendar_minute.md) of the current [Hour](calendar_hour.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.firstminuteinthishour
     * @type {Integer} 
     */
    FirstMinuteInThisHour {
        get => this.get_FirstMinuteInThisHour()
    }

    /**
     * Gets the last [Minute](calendar_minute.md) of the current [Hour](calendar_hour.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.lastminuteinthishour
     * @type {Integer} 
     */
    LastMinuteInThisHour {
        get => this.get_LastMinuteInThisHour()
    }

    /**
     * Gets the number of [Minute](calendar_minute.md)s in the current [Hour](calendar_hour.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.numberofminutesinthishour
     * @type {Integer} 
     */
    NumberOfMinutesInThisHour {
        get => this.get_NumberOfMinutesInThisHour()
    }

    /**
     * Gets the first [Second](calendar_second.md) of the current [Minute](calendar_minute.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.firstsecondinthisminute
     * @type {Integer} 
     */
    FirstSecondInThisMinute {
        get => this.get_FirstSecondInThisMinute()
    }

    /**
     * Gets the last [Second](calendar_second.md) of the current [Minute](calendar_minute.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.lastsecondinthisminute
     * @type {Integer} 
     */
    LastSecondInThisMinute {
        get => this.get_LastSecondInThisMinute()
    }

    /**
     * Gets the number of [Second](calendar_second.md)s in the current [Minute](calendar_minute.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.numberofsecondsinthisminute
     * @type {Integer} 
     */
    NumberOfSecondsInThisMinute {
        get => this.get_NumberOfSecondsInThisMinute()
    }

    /**
     * Gets the language that was most recently used to perform calendar formatting or operations.
     * @remarks
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.resolvedlanguage
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * Gets a [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) indicating if Daylight Saving Time is in effect for the date of this [Calendar](calendar.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.isdaylightsavingtime
     * @type {Boolean} 
     */
    IsDaylightSavingTime {
        get => this.get_IsDaylightSavingTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [Calendar](calendar.md) object and initializes it to the current [DateTime](../windows.foundation/datetime.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Calendar")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Creates a copy of the [Calendar](calendar.md) object.
     * @returns {Calendar} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.clone
     */
    Clone() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.Clone()
    }

    /**
     * Sets the components of this [Calendar](calendar.md) object to the earliest [DateTime](../windows.foundation/datetime.md) supported.
     * @remarks
     * If you're using a .NET language (for example, C#, or Visual Basic), then use the Coordinated Universal Time (UTC) time zone with a **Calendar** object if you wish to follow this set of steps.
     * - Call either SetToMin or [SetToMax](calendar_settomax_44967827.md), and then
     * - Call [GetDateTime](calendar_getdatetime_624256552.md) to convert the **Calendar** to a .NET [System.DateTime](/dotnet/api/system.datetime?view=dotnet-uwp-10.0&preserve-view=true) struct.
     * 
     * If you don't use the Coordinated Universal Time (UTC) time zone, then **GetDateTime** will throw an exception because the computed number of ticks will under- or overflow due to the timezone offset.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.settomin
     */
    SetToMin() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.SetToMin()
    }

    /**
     * Sets the components of this [Calendar](calendar.md) object to the latest [DateTime](../windows.foundation/datetime.md) supported.
     * @remarks
     * If you're using a .NET language (for example, C#, or Visual Basic), then use the Coordinated Universal Time (UTC) time zone with a **Calendar** object if you wish to follow this set of steps.
     * - Call either [SetToMin](calendar_settomin_1929870661.md) or **SetToMax**, and then
     * - Call [GetDateTime](calendar_getdatetime_624256552.md) to convert the **Calendar** to a .NET [System.DateTime](/dotnet/api/system.datetime?view=dotnet-uwp-10.0&preserve-view=true) struct.
     * 
     * If you don't use the Coordinated Universal Time (UTC) time zone, then **GetDateTime** will throw an exception because the computed number of ticks will under- or overflow due to the timezone offset.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.settomax
     */
    SetToMax() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.SetToMax()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Languages() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_Languages()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NumeralSystem() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_NumeralSystem()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_NumeralSystem(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.put_NumeralSystem(value)
    }

    /**
     * Gets the calendar system that is used by this [Calendar](calendar.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.getcalendarsystem
     */
    GetCalendarSystem() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.GetCalendarSystem()
    }

    /**
     * Sets a new calendar system to be used by this [Calendar](calendar.md) object.
     * @param {HSTRING} value The calendar identifier to use. This can be any identifier from the [CalendarIdentifiers](calendaridentifiers.md) class.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.changecalendarsystem
     */
    ChangeCalendarSystem(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.ChangeCalendarSystem(value)
    }

    /**
     * Gets the clock that is used by this [Calendar](calendar.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.getclock
     */
    GetClock() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.GetClock()
    }

    /**
     * Sets a new clock to be used by this [Calendar](calendar.md) object.
     * @param {HSTRING} value The clock identifier to use.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.changeclock
     */
    ChangeClock(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.ChangeClock(value)
    }

    /**
     * Builds a date and time, given the components of this [Calendar](calendar.md) object.
     * @remarks
     * If you're using a .NET language (for example, C#, or Visual Basic), then use the Coordinated Universal Time (UTC) time zone with a **Calendar** object if you wish to follow this set of steps.
     * - Call either **SetToMin** or [SetToMax](calendar_settomax_44967827.md), and then
     * - Call GetDateTime to convert the **Calendar** to a .NET [System.DateTime](/dotnet/api/system.datetime?view=dotnet-uwp-10.0&preserve-view=true) struct.
     * 
     * If you don't use the Coordinated Universal Time (UTC) time zone, then **GetDateTime** will throw an exception because the computed number of ticks will under- or overflow due to the timezone offset.
     * @returns {DateTime} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.getdatetime
     */
    GetDateTime() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.GetDateTime()
    }

    /**
     * Sets all the date and time fields to the date and time represented by the [DateTime](../windows.foundation/datetime.md) parameter.
     * @param {DateTime} value The [DateTime](../windows.foundation/datetime.md) that is used to set all of the date and time fields.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.setdatetime
     */
    SetDateTime(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.SetDateTime(value)
    }

    /**
     * Sets the components of this [Calendar](calendar.md) object to the current [DateTime](../windows.foundation/datetime.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.settonow
     */
    SetToNow() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.SetToNow()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstEra() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_FirstEra()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastEra() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_LastEra()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfEras() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_NumberOfEras()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Era() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_Era()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Era(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.put_Era(value)
    }

    /**
     * Increments or decrements the era.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {Integer} eras The number of eras by which to increment the era (if the value is positive) or decrement the era (if the value is negative).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.adderas
     */
    AddEras(eras) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.AddEras(eras)
    }

    /**
     * Returns a string representation of the era. The string chosen is closest in length to the ideal length.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.eraasstring
     */
    EraAsFullString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.EraAsFullString()
    }

    /**
     * Returns a string representation of the era.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.eraasstring
     */
    EraAsString(idealLength) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.EraAsString1(idealLength)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstYearInThisEra() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_FirstYearInThisEra()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastYearInThisEra() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_LastYearInThisEra()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfYearsInThisEra() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_NumberOfYearsInThisEra()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Year() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_Year()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Year(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.put_Year(value)
    }

    /**
     * Increments or decrements the year.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * 
     * > [!NOTE]
     * > This API takes leap years into account when calculating the resulting year. The month and time-of-day part of the resulting Calendar object remains the same as this instance. If the current instance represents the leap day (February 29th) in a leap year, date returned will be February 29th of the resulting year only if that year is a leap year, and February 28th of the resulting year otherwise. For more information on leap years in your app, see [leap year readiness](https://techcommunity.microsoft.com/t5/azure-developer-community-blog/it-s-2020-is-your-code-ready-for-leap-day/ba-p/1157279).
     * @param {Integer} years The number of years by which to increment the year (if the value is positive) or decrement the year (if the value is negative).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.addyears
     */
    AddYears(years) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.AddYears(years)
    }

    /**
     * Returns a string representation of the year without any initial zero padding.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.yearasstring
     */
    YearAsString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.YearAsString()
    }

    /**
     * Returns a string representation of the year, optionally truncated.
     * @param {Integer} remainingDigits A positive integer that represents the number of least significant digits that should be included. For example, for the year 1234, a parameter of 2 returns 34, and a parameter of 4 or larger returns 1234.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.yearastruncatedstring
     */
    YearAsTruncatedString(remainingDigits) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.YearAsTruncatedString(remainingDigits)
    }

    /**
     * Returns a string representation of the year, optionally zero-padded.
     * @param {Integer} minDigits The minimum number of integer digits to be displayed. If the year does not have enough integer digits, it will be padded with zeros to the correct amount. For example, for the year 42, a parameter of 1 or 2 returns 42, and a parameter of 3 returns 042.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.yearaspaddedstring
     */
    YearAsPaddedString(minDigits) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.YearAsPaddedString(minDigits)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstMonthInThisYear() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_FirstMonthInThisYear()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastMonthInThisYear() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_LastMonthInThisYear()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfMonthsInThisYear() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_NumberOfMonthsInThisYear()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Month() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_Month()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Month(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.put_Month(value)
    }

    /**
     * Increments or decrements the month.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {Integer} months The number of months by which to increment the month (if the value is positive) or decrement the month (if the value is negative).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.addmonths
     */
    AddMonths(months) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.AddMonths(months)
    }

    /**
     * Returns a string representation of the month suitable for inclusion with other date components.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.monthasstring
     */
    MonthAsFullString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.MonthAsFullString()
    }

    /**
     * Returns a string representation of the month suitable for inclusion with other date components.
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.monthasstring
     */
    MonthAsString(idealLength) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.MonthAsString1(idealLength)
    }

    /**
     * Returns a string representation of the month suitable for stand-alone display.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.monthassolostring
     */
    MonthAsFullSoloString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.MonthAsFullSoloString()
    }

    /**
     * Returns a string representation of the month suitable for stand-alone display.
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.monthassolostring
     */
    MonthAsSoloString(idealLength) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.MonthAsSoloString1(idealLength)
    }

    /**
     * Returns a string that contains the numeric representation of the month.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.monthasnumericstring
     */
    MonthAsNumericString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.MonthAsNumericString()
    }

    /**
     * Returns a string representation of the month, optionally zero-padded.
     * @param {Integer} minDigits The minimum number of integer digits to be displayed. If the month does not have enough integer digits, it will be padded with zeros to the correct amount. For example, for the month 3, a parameter of 1 returns 3, and a parameter of 2 returns 03.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.monthaspaddednumericstring
     */
    MonthAsPaddedNumericString(minDigits) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.MonthAsPaddedNumericString(minDigits)
    }

    /**
     * Increments or decrements the day by the specified number of weeks.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {Integer} weeks The number of weeks by which to increment the day (if the value is positive) or decrement the day (if the value is negative).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.addweeks
     */
    AddWeeks(weeks) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.AddWeeks(weeks)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstDayInThisMonth() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_FirstDayInThisMonth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastDayInThisMonth() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_LastDayInThisMonth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfDaysInThisMonth() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_NumberOfDaysInThisMonth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Day() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_Day()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Day(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.put_Day(value)
    }

    /**
     * Increments or decrements the day.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {Integer} days The number of days by which to increment the day (if the value is positive) or decrement the day (if the value is negative).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.adddays
     */
    AddDays(days) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.AddDays(days)
    }

    /**
     * Returns a string that contains the numeric representation of the day.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.dayasstring
     */
    DayAsString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.DayAsString()
    }

    /**
     * Returns a string representation of the day, optionally zero-padded.
     * @param {Integer} minDigits The minimum number of integer digits to be displayed. If the day does not have enough integer digits, it will be padded with zeros to the correct amount. For example, for the day 3, a parameter of 1 returns 3, and a parameter of 2 returns 03.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.dayaspaddedstring
     */
    DayAsPaddedString(minDigits) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.DayAsPaddedString(minDigits)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DayOfWeek() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_DayOfWeek()
    }

    /**
     * Returns a string representation of the day of the week suitable for inclusion with other date components.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.dayofweekasstring
     */
    DayOfWeekAsFullString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.DayOfWeekAsFullString()
    }

    /**
     * Returns a string representation of the day of the week suitable for inclusion with other date components.
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.dayofweekasstring
     */
    DayOfWeekAsString(idealLength) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.DayOfWeekAsString1(idealLength)
    }

    /**
     * Returns a string representation of the day of the week suitable for stand-alone display.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.dayofweekassolostring
     */
    DayOfWeekAsFullSoloString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.DayOfWeekAsFullSoloString()
    }

    /**
     * Returns a string representation of the day of the week suitable for stand-alone display.
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.dayofweekassolostring
     */
    DayOfWeekAsSoloString(idealLength) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.DayOfWeekAsSoloString1(idealLength)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstPeriodInThisDay() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_FirstPeriodInThisDay()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastPeriodInThisDay() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_LastPeriodInThisDay()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfPeriodsInThisDay() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_NumberOfPeriodsInThisDay()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Period() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_Period()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Period(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.put_Period(value)
    }

    /**
     * Increments or decrements the period.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {Integer} periods The number of periods by which to increment the period (if the value is positive) or decrement the period (if the value is negative).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.addperiods
     */
    AddPeriods(periods) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.AddPeriods(periods)
    }

    /**
     * Returns a string representation of the day period, such as AM or PM.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.periodasstring
     */
    PeriodAsFullString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.PeriodAsFullString()
    }

    /**
     * Returns a string representation of the day period, such as AM or PM, that uses the most common abbreviation available.
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.periodasstring
     */
    PeriodAsString(idealLength) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.PeriodAsString1(idealLength)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstHourInThisPeriod() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_FirstHourInThisPeriod()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastHourInThisPeriod() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_LastHourInThisPeriod()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfHoursInThisPeriod() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_NumberOfHoursInThisPeriod()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Hour() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_Hour()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Hour(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.put_Hour(value)
    }

    /**
     * Increments or decrements the hour.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {Integer} hours The number of hours by which to increment the hour (if the value is positive) or decrement the hour (if the value is negative).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.addhours
     */
    AddHours(hours) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.AddHours(hours)
    }

    /**
     * Returns a string that contains the numeric representation of the hour.
     * @remarks
     * This value is dependent on the Preferred languages setting in Settings -> Time & Language -> Language.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.hourasstring
     */
    HourAsString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.HourAsString()
    }

    /**
     * Returns a string representation of the hour, optionally zero-padded.
     * @remarks
     * This value is dependent on the Preferred languages setting in Settings -> Time & Language -> Language.
     * @param {Integer} minDigits The minimum number of integer digits to be displayed. If the hour does not have enough integer digits, it will be padded with zeros to the correct amount. For example, for the hour 3, a parameter of 1 returns 3, and a parameter of 2 returns 03.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.houraspaddedstring
     */
    HourAsPaddedString(minDigits) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.HourAsPaddedString(minDigits)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Minute() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_Minute()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Minute(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.put_Minute(value)
    }

    /**
     * Increments or decrements the minute.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {Integer} minutes The number of minutes by which to increment the minute (if the value is positive) or decrement the minute (if the value is negative).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.addminutes
     */
    AddMinutes(minutes) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.AddMinutes(minutes)
    }

    /**
     * Returns a string that contains the numeric representation of the minute.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.minuteasstring
     */
    MinuteAsString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.MinuteAsString()
    }

    /**
     * Returns a string representation of the minute, optionally zero-padded.
     * @param {Integer} minDigits The minimum number of integer digits to be displayed. If the minute does not have enough integer digits, it will be padded with zeros to the correct amount. For example, for the minute 3, a parameter of 1 returns 3, and a parameter of 2 returns 03.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.minuteaspaddedstring
     */
    MinuteAsPaddedString(minDigits) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.MinuteAsPaddedString(minDigits)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Second() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_Second()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Second(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.put_Second(value)
    }

    /**
     * Increments or decrements the second.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {Integer} seconds The number of seconds by which to increment the second (if the value is positive) or decrement the second (if the value is negative).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.addseconds
     */
    AddSeconds(seconds) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.AddSeconds(seconds)
    }

    /**
     * Returns a string that contains the numeric representation of the second.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.secondasstring
     */
    SecondAsString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.SecondAsString()
    }

    /**
     * Returns a string representation of the second, optionally zero-padded.
     * @param {Integer} minDigits The minimum number of integer digits to be displayed. If the second does not have enough integer digits, it will be padded with zeros to the correct amount. For example, for the second 3, a parameter of 1 returns 3, and a parameter of 2 returns 03.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.secondaspaddedstring
     */
    SecondAsPaddedString(minDigits) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.SecondAsPaddedString(minDigits)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Nanosecond() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_Nanosecond()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Nanosecond(value) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.put_Nanosecond(value)
    }

    /**
     * Increments or decrements the nanosecond.
     * @remarks
     * > [!NOTE]
     * > This API is being updated to support the May 2019 Japanese era change. If your application supports the Japanese calendar, you should validate that it properly handles the new era. See [Prepare your application for the Japanese era change](/windows/uwp/design/globalizing/japanese-era-change) for more information.
     * @param {Integer} nanoseconds The number of nanoseconds by which to increment the nanosecond (if the value is positive) or decrement the nanosecond (if the value is negative).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.addnanoseconds
     */
    AddNanoseconds(nanoseconds) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.AddNanoseconds(nanoseconds)
    }

    /**
     * Returns a string that contains the numeric representation of the nanosecond.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.nanosecondasstring
     */
    NanosecondAsString() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.NanosecondAsString()
    }

    /**
     * Returns a string representation of the nanosecond, optionally zero-padded.
     * @param {Integer} minDigits The minimum number of integer digits to be displayed. If the nanosecond does not have enough integer digits, it will be padded with zeros to the correct amount. For example, for the nanosecond 42, a parameter of 1 or 2 returns 42, and a parameter of 3 returns 042.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.nanosecondaspaddedstring
     */
    NanosecondAsPaddedString(minDigits) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.NanosecondAsPaddedString(minDigits)
    }

    /**
     * Compares this calendar to another [Calendar](calendar.md) object and indicates whether the [DateTime](../windows.foundation/datetime.md) of one is earlier, equal to, or later than that of the other.
     * @param {Calendar} other The [Calendar](calendar.md) object to compare to the current calendar.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.compare
     */
    Compare(other) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.Compare(other)
    }

    /**
     * Compares this calendar to a [DateTime](../windows.foundation/datetime.md) object and indicates whether the date and time of one is earlier, equal to, or later than that of the other.
     * @param {DateTime} other The [DateTime](../windows.foundation/datetime.md) object to compare to the current calendar.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.comparedatetime
     */
    CompareDateTime(other) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.CompareDateTime(other)
    }

    /**
     * Copies the values from another [Calendar](calendar.md) object into this [Calendar](calendar.md).
     * @param {Calendar} other The [Calendar](calendar.md) object to be copied.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.copyto
     */
    CopyTo(other) {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.CopyTo(other)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstMinuteInThisHour() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_FirstMinuteInThisHour()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastMinuteInThisHour() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_LastMinuteInThisHour()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfMinutesInThisHour() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_NumberOfMinutesInThisHour()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstSecondInThisMinute() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_FirstSecondInThisMinute()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastSecondInThisMinute() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_LastSecondInThisMinute()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfSecondsInThisMinute() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_NumberOfSecondsInThisMinute()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedLanguage() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_ResolvedLanguage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDaylightSavingTime() {
        if (!this.HasProp("__ICalendar")) {
            if ((queryResult := this.QueryInterface(ICalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendar := ICalendar(outPtr)
        }

        return this.__ICalendar.get_IsDaylightSavingTime()
    }

    /**
     * Gets the identifier that identifies the time zone that is used by this [Calendar](calendar.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.gettimezone
     */
    GetTimeZone() {
        if (!this.HasProp("__ITimeZoneOnCalendar")) {
            if ((queryResult := this.QueryInterface(ITimeZoneOnCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeZoneOnCalendar := ITimeZoneOnCalendar(outPtr)
        }

        return this.__ITimeZoneOnCalendar.GetTimeZone()
    }

    /**
     * Sets a new time zone to be used by this [Calendar](calendar.md) object.
     * @remarks
     * The values of other properties of this [Calendar](calendar.md) object may change as a result.
     * @param {HSTRING} timeZoneId An identifier from the [IANA Time Zone Database](https://www.iana.org/time-zones) which identifies the time zone that should be used (for example, "America/Los_Angeles" for Pacific Time).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.changetimezone
     */
    ChangeTimeZone(timeZoneId) {
        if (!this.HasProp("__ITimeZoneOnCalendar")) {
            if ((queryResult := this.QueryInterface(ITimeZoneOnCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeZoneOnCalendar := ITimeZoneOnCalendar(outPtr)
        }

        return this.__ITimeZoneOnCalendar.ChangeTimeZone(timeZoneId)
    }

    /**
     * Returns the abbreviated time zone name applicable at the instant of time that this [Calendar](calendar.md) object represents.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.timezoneasstring
     */
    TimeZoneAsFullString() {
        if (!this.HasProp("__ITimeZoneOnCalendar")) {
            if ((queryResult := this.QueryInterface(ITimeZoneOnCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeZoneOnCalendar := ITimeZoneOnCalendar(outPtr)
        }

        return this.__ITimeZoneOnCalendar.TimeZoneAsFullString()
    }

    /**
     * Returns the full time zone name applicable at the instant of time that this [Calendar](calendar.md) object represents.
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.calendar.timezoneasstring
     */
    TimeZoneAsString(idealLength) {
        if (!this.HasProp("__ITimeZoneOnCalendar")) {
            if ((queryResult := this.QueryInterface(ITimeZoneOnCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeZoneOnCalendar := ITimeZoneOnCalendar(outPtr)
        }

        return this.__ITimeZoneOnCalendar.TimeZoneAsString1(idealLength)
    }

;@endregion Instance Methods
}
