#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFindAppointmentsOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a set of options that modifies a query for appointments.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.findappointmentsoptions
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class FindAppointmentsOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFindAppointmentsOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFindAppointmentsOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of calendar IDs that will be included in the find appointments query. If this list is empty, then appointments will be returned from all calendars.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.findappointmentsoptions.calendarids
     * @type {IVector<HSTRING>} 
     */
    CalendarIds {
        get => this.get_CalendarIds()
    }

    /**
     * Gets the list of appointment property names that will be populated with data in the find appointment query results.
     * @remarks
     * The following properties are always returned from a find appointment query, even if they are not explicitly specified in the **FetchProperties** list.
     * 
     * 
     * + [CalendarId](appointment_calendarid.md)
     * + [LocalId](appointment_localid.md)
     * + [OriginalStartTime](appointment_originalstarttime.md)
     * + [Recurrence](appointment_recurrence.md)
     * + [RoamingId](appointment_roamingid.md)
     * 
     * 
     * The list of valid properties is documented in the [AppointmentProperties](appointmentproperties.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.findappointmentsoptions.fetchproperties
     * @type {IVector<HSTRING>} 
     */
    FetchProperties {
        get => this.get_FetchProperties()
    }

    /**
     * Gets or sets a value indicating whether appointments belonging to hidden calendars will be included in the find appointments query result.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.findappointmentsoptions.includehidden
     * @type {Boolean} 
     */
    IncludeHidden {
        get => this.get_IncludeHidden()
        set => this.put_IncludeHidden(value)
    }

    /**
     * Gets or sets the maximum number of appointments that should be included in the find appointments query result.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.findappointmentsoptions.maxcount
     * @type {Integer} 
     */
    MaxCount {
        get => this.get_MaxCount()
        set => this.put_MaxCount(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [FindAppointmentsOptions](findappointmentsoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.FindAppointmentsOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_CalendarIds() {
        if (!this.HasProp("__IFindAppointmentsOptions")) {
            if ((queryResult := this.QueryInterface(IFindAppointmentsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindAppointmentsOptions := IFindAppointmentsOptions(outPtr)
        }

        return this.__IFindAppointmentsOptions.get_CalendarIds()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_FetchProperties() {
        if (!this.HasProp("__IFindAppointmentsOptions")) {
            if ((queryResult := this.QueryInterface(IFindAppointmentsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindAppointmentsOptions := IFindAppointmentsOptions(outPtr)
        }

        return this.__IFindAppointmentsOptions.get_FetchProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeHidden() {
        if (!this.HasProp("__IFindAppointmentsOptions")) {
            if ((queryResult := this.QueryInterface(IFindAppointmentsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindAppointmentsOptions := IFindAppointmentsOptions(outPtr)
        }

        return this.__IFindAppointmentsOptions.get_IncludeHidden()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeHidden(value) {
        if (!this.HasProp("__IFindAppointmentsOptions")) {
            if ((queryResult := this.QueryInterface(IFindAppointmentsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindAppointmentsOptions := IFindAppointmentsOptions(outPtr)
        }

        return this.__IFindAppointmentsOptions.put_IncludeHidden(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxCount() {
        if (!this.HasProp("__IFindAppointmentsOptions")) {
            if ((queryResult := this.QueryInterface(IFindAppointmentsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindAppointmentsOptions := IFindAppointmentsOptions(outPtr)
        }

        return this.__IFindAppointmentsOptions.get_MaxCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxCount(value) {
        if (!this.HasProp("__IFindAppointmentsOptions")) {
            if ((queryResult := this.QueryInterface(IFindAppointmentsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindAppointmentsOptions := IFindAppointmentsOptions(outPtr)
        }

        return this.__IFindAppointmentsOptions.put_MaxCount(value)
    }

;@endregion Instance Methods
}
