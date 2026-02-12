#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarForwardMeetingRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the user's request to forward a calendar meeting.
 * @remarks
 * The system generates an instance of this class and sets it as a property in the [AppointmentCalendarForwardMeetingRequestEventArgs](appointmentcalendarforwardmeetingrequesteventargs.md) argument of the [ForwardMeetingRequested](appointmentdataproviderconnection_forwardmeetingrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequest
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarForwardMeetingRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarForwardMeetingRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarForwardMeetingRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a string that uniquely identifies the calendar associated with the appointment on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequest.appointmentcalendarlocalid
     * @type {HSTRING} 
     */
    AppointmentCalendarLocalId {
        get => this.get_AppointmentCalendarLocalId()
    }

    /**
     * Gets a string that uniquely identifies the appointment on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequest.appointmentlocalid
     * @type {HSTRING} 
     */
    AppointmentLocalId {
        get => this.get_AppointmentLocalId()
    }

    /**
     * Gets the original starting time for a recurring appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequest.appointmentoriginalstarttime
     * @type {IReference<DateTime>} 
     */
    AppointmentOriginalStartTime {
        get => this.get_AppointmentOriginalStartTime()
    }

    /**
     * Gets a list of the new invitees to receive the forwarded meeting.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequest.invitees
     * @type {IVectorView<AppointmentInvitee>} 
     */
    Invitees {
        get => this.get_Invitees()
    }

    /**
     * Gets the subject of the forwarded meeting invitation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequest.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * Gets the new meeting header that includes the new invitees.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequest.forwardheader
     * @type {HSTRING} 
     */
    ForwardHeader {
        get => this.get_ForwardHeader()
    }

    /**
     * Gets a text comment the user may write regarding the forwarding of the meeting.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequest.comment
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
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
        if (!this.HasProp("__IAppointmentCalendarForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarForwardMeetingRequest := IAppointmentCalendarForwardMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarForwardMeetingRequest.get_AppointmentCalendarLocalId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppointmentLocalId() {
        if (!this.HasProp("__IAppointmentCalendarForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarForwardMeetingRequest := IAppointmentCalendarForwardMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarForwardMeetingRequest.get_AppointmentLocalId()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_AppointmentOriginalStartTime() {
        if (!this.HasProp("__IAppointmentCalendarForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarForwardMeetingRequest := IAppointmentCalendarForwardMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarForwardMeetingRequest.get_AppointmentOriginalStartTime()
    }

    /**
     * 
     * @returns {IVectorView<AppointmentInvitee>} 
     */
    get_Invitees() {
        if (!this.HasProp("__IAppointmentCalendarForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarForwardMeetingRequest := IAppointmentCalendarForwardMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarForwardMeetingRequest.get_Invitees()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IAppointmentCalendarForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarForwardMeetingRequest := IAppointmentCalendarForwardMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarForwardMeetingRequest.get_Subject()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ForwardHeader() {
        if (!this.HasProp("__IAppointmentCalendarForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarForwardMeetingRequest := IAppointmentCalendarForwardMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarForwardMeetingRequest.get_ForwardHeader()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        if (!this.HasProp("__IAppointmentCalendarForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarForwardMeetingRequest := IAppointmentCalendarForwardMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarForwardMeetingRequest.get_Comment()
    }

    /**
     * Notifies the system that the task of forwarding a meeting has completed.
     * @remarks
     * This method should be called only if the app has successfully forwarded a meeting.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IAppointmentCalendarForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarForwardMeetingRequest := IAppointmentCalendarForwardMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarForwardMeetingRequest.ReportCompletedAsync()
    }

    /**
     * Notifies the system that the task of forwarding a meeting has failed.
     * @remarks
     * This method should be called only if the app has failed to forward a meeting.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IAppointmentCalendarForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarForwardMeetingRequest := IAppointmentCalendarForwardMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarForwardMeetingRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
