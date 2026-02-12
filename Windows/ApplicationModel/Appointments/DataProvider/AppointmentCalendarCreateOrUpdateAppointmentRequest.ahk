#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarCreateOrUpdateAppointmentRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the user's request to change the response to a calendar meeting.
 * @remarks
 * The system generates an instance of this class and sets it as a property in the [AppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs](appointmentcalendarcreateorupdateappointmentrequesteventargs.md) argument of the [CreateOrUpdateAppointmentRequested](appointmentdataproviderconnection_createorupdateappointmentrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcreateorupdateappointmentrequest
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarCreateOrUpdateAppointmentRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarCreateOrUpdateAppointmentRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarCreateOrUpdateAppointmentRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a string that uniquely identifies the calendar associated with the appointment on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcreateorupdateappointmentrequest.appointmentcalendarlocalid
     * @type {HSTRING} 
     */
    AppointmentCalendarLocalId {
        get => this.get_AppointmentCalendarLocalId()
    }

    /**
     * Gets the appointment to create or update.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcreateorupdateappointmentrequest.appointment
     * @type {Appointment} 
     */
    Appointment {
        get => this.get_Appointment()
    }

    /**
     * Gets a Boolean value indicating if invitees should be notified.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcreateorupdateappointmentrequest.notifyinvitees
     * @type {Boolean} 
     */
    NotifyInvitees {
        get => this.get_NotifyInvitees()
    }

    /**
     * Gets a list of properties that the user wished to change or set in an appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcreateorupdateappointmentrequest.changedproperties
     * @type {IVectorView<HSTRING>} 
     */
    ChangedProperties {
        get => this.get_ChangedProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppointmentCalendarLocalId() {
        if (!this.HasProp("__IAppointmentCalendarCreateOrUpdateAppointmentRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCreateOrUpdateAppointmentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest := IAppointmentCalendarCreateOrUpdateAppointmentRequest(outPtr)
        }

        return this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest.get_AppointmentCalendarLocalId()
    }

    /**
     * 
     * @returns {Appointment} 
     */
    get_Appointment() {
        if (!this.HasProp("__IAppointmentCalendarCreateOrUpdateAppointmentRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCreateOrUpdateAppointmentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest := IAppointmentCalendarCreateOrUpdateAppointmentRequest(outPtr)
        }

        return this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest.get_Appointment()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NotifyInvitees() {
        if (!this.HasProp("__IAppointmentCalendarCreateOrUpdateAppointmentRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCreateOrUpdateAppointmentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest := IAppointmentCalendarCreateOrUpdateAppointmentRequest(outPtr)
        }

        return this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest.get_NotifyInvitees()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_ChangedProperties() {
        if (!this.HasProp("__IAppointmentCalendarCreateOrUpdateAppointmentRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCreateOrUpdateAppointmentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest := IAppointmentCalendarCreateOrUpdateAppointmentRequest(outPtr)
        }

        return this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest.get_ChangedProperties()
    }

    /**
     * Notifies the system that the task of creating or updating an appointment has completed.
     * @remarks
     * This method should be called only if the app has successfully created or updated an appointment.
     * @param {Appointment} createdOrUpdatedAppointment The calendar appointment that has been created or updated.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcreateorupdateappointmentrequest.reportcompletedasync
     */
    ReportCompletedAsync(createdOrUpdatedAppointment) {
        if (!this.HasProp("__IAppointmentCalendarCreateOrUpdateAppointmentRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCreateOrUpdateAppointmentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest := IAppointmentCalendarCreateOrUpdateAppointmentRequest(outPtr)
        }

        return this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest.ReportCompletedAsync(createdOrUpdatedAppointment)
    }

    /**
     * Notifies the system that the task of creating or updating an appointment has failed.
     * @remarks
     * This method should be called only if the app has failed to create or update an appointment.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcreateorupdateappointmentrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IAppointmentCalendarCreateOrUpdateAppointmentRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCreateOrUpdateAppointmentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest := IAppointmentCalendarCreateOrUpdateAppointmentRequest(outPtr)
        }

        return this.__IAppointmentCalendarCreateOrUpdateAppointmentRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
