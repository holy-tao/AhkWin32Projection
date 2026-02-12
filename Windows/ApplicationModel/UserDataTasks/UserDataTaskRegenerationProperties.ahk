#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskRegenerationProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents how often a task occurs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskregenerationproperties
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskRegenerationProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskRegenerationProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskRegenerationProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a [UserDataTaskRecurrenceUnit](userdatataskregenerationunit.md)-typed value that indicates the frequency for which the task occurs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskregenerationproperties.unit
     * @type {Integer} 
     */
    Unit {
        get => this.get_Unit()
        set => this.put_Unit(value)
    }

    /**
     * Gets or sets the number of times a task recurs. Occurrences is of type [IReference(UInt32)](../windows.foundation/ireference_1.md) and is **NULL** by default. Occurrences is mutually exclusive with [Until](userdatataskregenerationproperties_until.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskregenerationproperties.occurrences
     * @type {IReference<Integer>} 
     */
    Occurrences {
        get => this.get_Occurrences()
        set => this.put_Occurrences(value)
    }

    /**
     * Gets or sets the date and time until which a task is valid. Until is of type [IReference(DateTime)](../windows.foundation/ireference_1.md) and is **NULL** by default. Until is mutually exclusive with [Occurrences](userdatataskregenerationproperties_occurrences.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskregenerationproperties.until
     * @type {IReference<DateTime>} 
     */
    Until {
        get => this.get_Until()
        set => this.put_Until(value)
    }

    /**
     * Gets or sets the interval between occurrences of a task. Interval is of type [UInt32](/dotnet/api/system.uint32?view=dotnet-uwp-10.0&preserve-view=true) and has a default value of 1. For daily, the interval is the number of days in between, for weekly, the number of weeks, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskregenerationproperties.interval
     * @type {Integer} 
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [UserDataTaskRegenerationProperties](userdatataskregenerationproperties.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataTasks.UserDataTaskRegenerationProperties")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unit() {
        if (!this.HasProp("__IUserDataTaskRegenerationProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRegenerationProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRegenerationProperties := IUserDataTaskRegenerationProperties(outPtr)
        }

        return this.__IUserDataTaskRegenerationProperties.get_Unit()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Unit(value) {
        if (!this.HasProp("__IUserDataTaskRegenerationProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRegenerationProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRegenerationProperties := IUserDataTaskRegenerationProperties(outPtr)
        }

        return this.__IUserDataTaskRegenerationProperties.put_Unit(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Occurrences() {
        if (!this.HasProp("__IUserDataTaskRegenerationProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRegenerationProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRegenerationProperties := IUserDataTaskRegenerationProperties(outPtr)
        }

        return this.__IUserDataTaskRegenerationProperties.get_Occurrences()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Occurrences(value) {
        if (!this.HasProp("__IUserDataTaskRegenerationProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRegenerationProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRegenerationProperties := IUserDataTaskRegenerationProperties(outPtr)
        }

        return this.__IUserDataTaskRegenerationProperties.put_Occurrences(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Until() {
        if (!this.HasProp("__IUserDataTaskRegenerationProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRegenerationProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRegenerationProperties := IUserDataTaskRegenerationProperties(outPtr)
        }

        return this.__IUserDataTaskRegenerationProperties.get_Until()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Until(value) {
        if (!this.HasProp("__IUserDataTaskRegenerationProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRegenerationProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRegenerationProperties := IUserDataTaskRegenerationProperties(outPtr)
        }

        return this.__IUserDataTaskRegenerationProperties.put_Until(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Interval() {
        if (!this.HasProp("__IUserDataTaskRegenerationProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRegenerationProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRegenerationProperties := IUserDataTaskRegenerationProperties(outPtr)
        }

        return this.__IUserDataTaskRegenerationProperties.get_Interval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Interval(value) {
        if (!this.HasProp("__IUserDataTaskRegenerationProperties")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskRegenerationProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskRegenerationProperties := IUserDataTaskRegenerationProperties(outPtr)
        }

        return this.__IUserDataTaskRegenerationProperties.put_Interval(value)
    }

;@endregion Instance Methods
}
