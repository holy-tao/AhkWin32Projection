#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentStoreChange.ahk
#Include .\IAppointmentStoreChange2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a change that has occurred in an appointment store.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechange
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentStoreChange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentStoreChange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentStoreChange.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [Appointment](appointment.md) associated with the change.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechange.appointment
     * @type {Appointment} 
     */
    Appointment {
        get => this.get_Appointment()
    }

    /**
     * Gets an [AppointmentStoreChangeType](appointmentstorechangetype.md) value indicating the type of change represented by the object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechange.changetype
     * @type {Integer} 
     */
    ChangeType {
        get => this.get_ChangeType()
    }

    /**
     * Gets the [AppointmentCalendar](appointmentcalendar.md) in which the change occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechange.appointmentcalendar
     * @type {AppointmentCalendar} 
     */
    AppointmentCalendar {
        get => this.get_AppointmentCalendar()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Appointment} 
     */
    get_Appointment() {
        if (!this.HasProp("__IAppointmentStoreChange")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChange := IAppointmentStoreChange(outPtr)
        }

        return this.__IAppointmentStoreChange.get_Appointment()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeType() {
        if (!this.HasProp("__IAppointmentStoreChange")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChange := IAppointmentStoreChange(outPtr)
        }

        return this.__IAppointmentStoreChange.get_ChangeType()
    }

    /**
     * 
     * @returns {AppointmentCalendar} 
     */
    get_AppointmentCalendar() {
        if (!this.HasProp("__IAppointmentStoreChange2")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChange2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChange2 := IAppointmentStoreChange2(outPtr)
        }

        return this.__IAppointmentStoreChange2.get_AppointmentCalendar()
    }

;@endregion Instance Methods
}
