#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarCancelMeetingRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the user's request to cancel a calendar meeting.
 * @remarks
 * The system generates an instance of this class and sets it as a property in the [AppointmentCalendarCancelMeetingRequestEventArgs](appointmentcalendarcancelmeetingrequesteventargs.md) argument of the [CancelMeetingRequested](appointmentdataproviderconnection_cancelmeetingrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequest
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarCancelMeetingRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarCancelMeetingRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarCancelMeetingRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Uniquely identifies the calendar on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequest.appointmentcalendarlocalid
     * @type {HSTRING} 
     */
    AppointmentCalendarLocalId {
        get => this.get_AppointmentCalendarLocalId()
    }

    /**
     * Gets a string that uniquely identifies the appointment on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequest.appointmentlocalid
     * @type {HSTRING} 
     */
    AppointmentLocalId {
        get => this.get_AppointmentLocalId()
    }

    /**
     * Gets the original starting time for a recurring appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequest.appointmentoriginalstarttime
     * @type {IReference<DateTime>} 
     */
    AppointmentOriginalStartTime {
        get => this.get_AppointmentOriginalStartTime()
    }

    /**
     * Gets the subject of the response.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequest.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * Gets a text comment the user may write regarding the cancellation of the meeting.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequest.comment
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
    }

    /**
     * Gets a Boolean value indicating if invitees should be notified.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequest.notifyinvitees
     * @type {Boolean} 
     */
    NotifyInvitees {
        get => this.get_NotifyInvitees()
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
        if (!this.HasProp("__IAppointmentCalendarCancelMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCancelMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCancelMeetingRequest := IAppointmentCalendarCancelMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarCancelMeetingRequest.get_AppointmentCalendarLocalId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppointmentLocalId() {
        if (!this.HasProp("__IAppointmentCalendarCancelMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCancelMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCancelMeetingRequest := IAppointmentCalendarCancelMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarCancelMeetingRequest.get_AppointmentLocalId()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_AppointmentOriginalStartTime() {
        if (!this.HasProp("__IAppointmentCalendarCancelMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCancelMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCancelMeetingRequest := IAppointmentCalendarCancelMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarCancelMeetingRequest.get_AppointmentOriginalStartTime()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IAppointmentCalendarCancelMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCancelMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCancelMeetingRequest := IAppointmentCalendarCancelMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarCancelMeetingRequest.get_Subject()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        if (!this.HasProp("__IAppointmentCalendarCancelMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCancelMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCancelMeetingRequest := IAppointmentCalendarCancelMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarCancelMeetingRequest.get_Comment()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NotifyInvitees() {
        if (!this.HasProp("__IAppointmentCalendarCancelMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCancelMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCancelMeetingRequest := IAppointmentCalendarCancelMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarCancelMeetingRequest.get_NotifyInvitees()
    }

    /**
     * Notifies the system that the task of cancelling a meeting has completed.
     * @remarks
     * This method should be called only if the app has successfully pushed a meeting cancellation.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IAppointmentCalendarCancelMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCancelMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCancelMeetingRequest := IAppointmentCalendarCancelMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarCancelMeetingRequest.ReportCompletedAsync()
    }

    /**
     * Notifies the system that the task of cancelling a meeting has failed.
     * @remarks
     * This method should be called only if the app has failed to push a meeting cancellation.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IAppointmentCalendarCancelMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCancelMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCancelMeetingRequest := IAppointmentCalendarCancelMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarCancelMeetingRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
