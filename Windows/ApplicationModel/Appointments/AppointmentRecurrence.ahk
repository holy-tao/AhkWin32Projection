#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentRecurrence.ahk
#Include .\IAppointmentRecurrence2.ahk
#Include .\IAppointmentRecurrence3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents when and how often an appointment occurs.
 * @remarks
 * For info about how to manage appointments, see [Managing appointments](/windows/uwp/contacts-and-calendar/managing-appointments) and [Quickstart: Managing appointments ](/previous-versions/windows/apps/dn495338(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentRecurrence extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentRecurrence

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentRecurrence.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a [AppointmentRecurrenceUnit](appointmentrecurrenceunit.md)-typed value that indicates the frequency for which the appointment occurs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence.unit
     * @type {Integer} 
     */
    Unit {
        get => this.get_Unit()
        set => this.put_Unit(value)
    }

    /**
     * Gets or sets the number of times an appointment recurs. Occurrences is of type [IReference(UInt32)](../windows.foundation/ireference_1.md) and is **NULL** by default. Occurrences is mutually exclusive with [Until](appointmentrecurrence_until.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence.occurrences
     * @type {IReference<Integer>} 
     */
    Occurrences {
        get => this.get_Occurrences()
        set => this.put_Occurrences(value)
    }

    /**
     * Gets or sets the date and time until which an appointment is valid. Until is of type [IReference(DateTime)](../windows.foundation/ireference_1.md) and is **NULL** by default. Until is mutually exclusive with [Occurrences](appointmentrecurrence_occurrences.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence.until
     * @type {IReference<DateTime>} 
     */
    Until {
        get => this.get_Until()
        set => this.put_Until(value)
    }

    /**
     * Gets or sets the interval between occurrences of an appointment. Interval is of type [UInt32](/dotnet/api/system.uint32?view=dotnet-uwp-10.0&preserve-view=true) and has a default value of 1. For daily, the interval is the number of days in between, for weekly, the number of weeks, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence.interval
     * @type {Integer} 
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

    /**
     * Gets or sets a combination of [AppointmentDaysOfWeek](appointmentdaysofweek.md)-typed values for all the days of the week on which an appointment occurs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence.daysofweek
     * @type {Integer} 
     */
    DaysOfWeek {
        get => this.get_DaysOfWeek()
        set => this.put_DaysOfWeek(value)
    }

    /**
     * Gets or sets a [AppointmentWeekOfMonth](appointmentweekofmonth.md)-typed value that indicates the week of the month for which the appointment occurs. The first week is the default.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence.weekofmonth
     * @type {Integer} 
     */
    WeekOfMonth {
        get => this.get_WeekOfMonth()
        set => this.put_WeekOfMonth(value)
    }

    /**
     * Gets or sets the month on which an appointment occurs. Month is of type [UInt32](/dotnet/api/system.uint32?view=dotnet-uwp-10.0&preserve-view=true), has a default value of 1, and can be a value from 1 to 12.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence.month
     * @type {Integer} 
     */
    Month {
        get => this.get_Month()
        set => this.put_Month(value)
    }

    /**
     * Gets or sets the day on which an appointment occurs. Day is of type [UInt32](/dotnet/api/system.uint32?view=dotnet-uwp-10.0&preserve-view=true), has a default value of 1, and can be a value from 1 to 31.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence.day
     * @type {Integer} 
     */
    Day {
        get => this.get_Day()
        set => this.put_Day(value)
    }

    /**
     * Gets a value indicating what type of recurrence applies to the associated appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence.recurrencetype
     * @type {Integer} 
     */
    RecurrenceType {
        get => this.get_RecurrenceType()
    }

    /**
     * Gets or sets the time zone for the recurrence.
     * @remarks
     * [StartTime](appointment_starttime.md) is projected to type **DateTimeOffset** in C# and JavaScript and DateTime in C++. Because these types represents absolute point in time, setting the **TimeZone** of the recurrence will not change what time the appointment occurs. This field can be used by your app's UI to simply show the time zone value or to localize the appointment time to the time zone.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence.timezone
     * @type {HSTRING} 
     */
    TimeZone {
        get => this.get_TimeZone()
        set => this.put_TimeZone(value)
    }

    /**
     * Gets a string that identifies the type of the calendar as represented by [CalendarIdentifiers](../windows.globalization/calendaridentifiers.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrence.calendaridentifier
     * @type {HSTRING} 
     */
    CalendarIdentifier {
        get => this.get_CalendarIdentifier()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AppointmentRecurrence](appointmentrecurrence.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentRecurrence")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unit() {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.get_Unit()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Unit(value) {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.put_Unit(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Occurrences() {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.get_Occurrences()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Occurrences(value) {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.put_Occurrences(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Until() {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.get_Until()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Until(value) {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.put_Until(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Interval() {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.get_Interval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Interval(value) {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.put_Interval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DaysOfWeek() {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.get_DaysOfWeek()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DaysOfWeek(value) {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.put_DaysOfWeek(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WeekOfMonth() {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.get_WeekOfMonth()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WeekOfMonth(value) {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.put_WeekOfMonth(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Month() {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.get_Month()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Month(value) {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.put_Month(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Day() {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.get_Day()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Day(value) {
        if (!this.HasProp("__IAppointmentRecurrence")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence := IAppointmentRecurrence(outPtr)
        }

        return this.__IAppointmentRecurrence.put_Day(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RecurrenceType() {
        if (!this.HasProp("__IAppointmentRecurrence2")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence2 := IAppointmentRecurrence2(outPtr)
        }

        return this.__IAppointmentRecurrence2.get_RecurrenceType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TimeZone() {
        if (!this.HasProp("__IAppointmentRecurrence2")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence2 := IAppointmentRecurrence2(outPtr)
        }

        return this.__IAppointmentRecurrence2.get_TimeZone()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TimeZone(value) {
        if (!this.HasProp("__IAppointmentRecurrence2")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence2 := IAppointmentRecurrence2(outPtr)
        }

        return this.__IAppointmentRecurrence2.put_TimeZone(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CalendarIdentifier() {
        if (!this.HasProp("__IAppointmentRecurrence3")) {
            if ((queryResult := this.QueryInterface(IAppointmentRecurrence3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentRecurrence3 := IAppointmentRecurrence3(outPtr)
        }

        return this.__IAppointmentRecurrence3.get_CalendarIdentifier()
    }

;@endregion Instance Methods
}
