#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskRecurrenceProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents when and how often a task occurs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskrecurrenceproperties
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskRecurrenceProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskRecurrenceProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskRecurrenceProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a [UserDataTaskRecurrenceUnit](userdatataskrecurrenceunit.md)-typed value that indicates the frequency for which the task occurs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskrecurrenceproperties.unit
     * @type {Integer} 
     */
    Unit {
        get => this.get_Unit()
        set => this.put_Unit(value)
    }

    /**
     * Gets or sets the number of times a task recurs. Occurrences is of type [IReference(UInt32)](../windows.foundation/ireference_1.md) and is **NULL** by default. Occurrences is mutually exclusive with [Until](userdatataskrecurrenceproperties_until.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskrecurrenceproperties.occurrences
     * @type {IReference<Integer>} 
     */
    Occurrences {
        get => this.get_Occurrences()
        set => this.put_Occurrences(value)
    }

    /**
     * Gets or sets the date and time until which a task is valid. Until is of type [IReference(DateTime)](../windows.foundation/ireference_1.md) and is **NULL** by default. Until is mutually exclusive with [Occurrences](userdatataskrecurrenceproperties_occurrences.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskrecurrenceproperties.until
     * @type {IReference<DateTime>} 
     */
    Until {
        get => this.get_Until()
        set => this.put_Until(value)
    }

    /**
     * Gets or sets the interval between occurrences of a task. Interval is of type [UInt32](/dotnet/api/system.uint32?view=dotnet-uwp-10.0&preserve-view=true) and has a default value of 1. For daily, the interval is the number of days in between, for weekly, the number of weeks, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskrecurrenceproperties.interval
     * @type {Integer} 
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

    /**
     * Gets or sets a combination of [UserDataTaskDaysOfWeek](userdatataskdaysofweek.md)-typed values for all the days of the week on which a task occurs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskrecurrenceproperties.daysofweek
     * @type {IReference<Integer>} 
     */
    DaysOfWeek {
        get => this.get_DaysOfWeek()
        set => this.put_DaysOfWeek(value)
    }

    /**
     * Gets or sets a [UserDataTaskWeekOfMonth](userdatataskweekofmonth.md)-typed value that indicates the week of the month for which the task occurs. The first week is the default.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskrecurrenceproperties.weekofmonth
     * @type {IReference<Integer>} 
     */
    WeekOfMonth {
        get => this.get_WeekOfMonth()
        set => this.put_WeekOfMonth(value)
    }

    /**
     * Gets or sets the month on which a task occurs. Month is of type [UInt32](/dotnet/api/system.uint32?view=dotnet-uwp-10.0&preserve-view=true), has a default value of 1, and can be a value from 1 to 12.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskrecurrenceproperties.month
     * @type {IReference<Integer>} 
     */
    Month {
        get => this.get_Month()
        set => this.put_Month(value)
    }

    /**
     * Gets or sets the day on which a task occurs. Day is of type [UInt32](/dotnet/api/system.uint32?view=dotnet-uwp-10.0&preserve-view=true), has a default value of 1, and can be a value from 1 to 31.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskrecurrenceproperties.day
     * @type {IReference<Integer>} 
     */
    Day {
        get => this.get_Day()
        set => this.put_Day(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [UserDataTaskRecurrenceProperties](userdatataskrecurrenceproperties.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataTasks.UserDataTaskRecurrenceProperties")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unit() {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.get_Unit()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Unit(value) {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.put_Unit(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Occurrences() {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.get_Occurrences()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Occurrences(value) {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.put_Occurrences(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Until() {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.get_Until()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Until(value) {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.put_Until(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Interval() {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.get_Interval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Interval(value) {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.put_Interval(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DaysOfWeek() {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.get_DaysOfWeek()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_DaysOfWeek(value) {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.put_DaysOfWeek(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_WeekOfMonth() {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.get_WeekOfMonth()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_WeekOfMonth(value) {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.put_WeekOfMonth(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Month() {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.get_Month()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Month(value) {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.put_Month(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Day() {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.get_Day()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Day(value) {
        if (!this.HasProp("__IUserDataTaskRecurrenceProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRecurrenceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRecurrenceProperties := IUserDataTaskRecurrenceProperties(outPtr)
        }

        return this.__IUserDataTaskRecurrenceProperties.put_Day(value)
    }

;@endregion Instance Methods
}
