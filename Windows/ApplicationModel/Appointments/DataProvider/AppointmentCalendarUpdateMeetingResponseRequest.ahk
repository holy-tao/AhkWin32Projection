#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarUpdateMeetingResponseRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the user's request to change the response to a calendar meeting.
 * @remarks
 * The system generates an instance of this class and sets it as a property in the [AppointmentCalendarUpdateMeetingResponseRequestEventArgs](appointmentcalendarupdatemeetingresponserequesteventargs.md) argument of the [UpdateMeetingResponseRequested](appointmentdataproviderconnection_updatemeetingresponserequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequest
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarUpdateMeetingResponseRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarUpdateMeetingResponseRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarUpdateMeetingResponseRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a string that uniquely identifies the calendar associated with the appointment on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequest.appointmentcalendarlocalid
     * @type {HSTRING} 
     */
    AppointmentCalendarLocalId {
        get => this.get_AppointmentCalendarLocalId()
    }

    /**
     * Gets a string that uniquely identifies the appointment on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequest.appointmentlocalid
     * @type {HSTRING} 
     */
    AppointmentLocalId {
        get => this.get_AppointmentLocalId()
    }

    /**
     * Gets the original starting time for a recurring appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequest.appointmentoriginalstarttime
     * @type {IReference<DateTime>} 
     */
    AppointmentOriginalStartTime {
        get => this.get_AppointmentOriginalStartTime()
    }

    /**
     * Gets the new response the user wishes to give concerning an appointment invitation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequest.response
     * @type {Integer} 
     */
    Response {
        get => this.get_Response()
    }

    /**
     * Gets the subject of the response.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequest.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * Gets a text comment the user may write regarding the change in meeting response.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequest.comment
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
    }

    /**
     * Indicates whether the user wishes to send an update to the meeting's organizer.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequest.sendupdate
     * @type {Boolean} 
     */
    SendUpdate {
        get => this.get_SendUpdate()
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
        if (!this.HasProp("__IAppointmentCalendarUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarUpdateMeetingResponseRequest := IAppointmentCalendarUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IAppointmentCalendarUpdateMeetingResponseRequest.get_AppointmentCalendarLocalId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppointmentLocalId() {
        if (!this.HasProp("__IAppointmentCalendarUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarUpdateMeetingResponseRequest := IAppointmentCalendarUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IAppointmentCalendarUpdateMeetingResponseRequest.get_AppointmentLocalId()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_AppointmentOriginalStartTime() {
        if (!this.HasProp("__IAppointmentCalendarUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarUpdateMeetingResponseRequest := IAppointmentCalendarUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IAppointmentCalendarUpdateMeetingResponseRequest.get_AppointmentOriginalStartTime()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Response() {
        if (!this.HasProp("__IAppointmentCalendarUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarUpdateMeetingResponseRequest := IAppointmentCalendarUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IAppointmentCalendarUpdateMeetingResponseRequest.get_Response()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IAppointmentCalendarUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarUpdateMeetingResponseRequest := IAppointmentCalendarUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IAppointmentCalendarUpdateMeetingResponseRequest.get_Subject()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        if (!this.HasProp("__IAppointmentCalendarUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarUpdateMeetingResponseRequest := IAppointmentCalendarUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IAppointmentCalendarUpdateMeetingResponseRequest.get_Comment()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SendUpdate() {
        if (!this.HasProp("__IAppointmentCalendarUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarUpdateMeetingResponseRequest := IAppointmentCalendarUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IAppointmentCalendarUpdateMeetingResponseRequest.get_SendUpdate()
    }

    /**
     * Notifies the system that the task of updating a meeting response has completed.
     * @remarks
     * This method should be called only if the app has successfully pushed a meeting response update.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IAppointmentCalendarUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarUpdateMeetingResponseRequest := IAppointmentCalendarUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IAppointmentCalendarUpdateMeetingResponseRequest.ReportCompletedAsync()
    }

    /**
     * Notifies the system that the task of updating a meeting response has failed.
     * @remarks
     * This method should be called only if the app has failed to push a meeting response update.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IAppointmentCalendarUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarUpdateMeetingResponseRequest := IAppointmentCalendarUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IAppointmentCalendarUpdateMeetingResponseRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
