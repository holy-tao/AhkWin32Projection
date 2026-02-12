#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarProposeNewTimeForMeetingRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the user's request to change the time of a calendar meeting.
 * @remarks
 * The system generates an instance of this class and sets it as a property in the [AppointmentCalendarProposeNewTimeForMeetingRequestEventArgs](appointmentcalendarproposenewtimeformeetingrequesteventargs.md) argument of the [ProposeNewTimeForMeetingRequested](appointmentdataproviderconnection_proposenewtimeformeetingrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequest
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarProposeNewTimeForMeetingRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarProposeNewTimeForMeetingRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarProposeNewTimeForMeetingRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a string that uniquely identifies the calendar associated with the appointment on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequest.appointmentcalendarlocalid
     * @type {HSTRING} 
     */
    AppointmentCalendarLocalId {
        get => this.get_AppointmentCalendarLocalId()
    }

    /**
     * Gets a string that uniquely identifies the appointment on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequest.appointmentlocalid
     * @type {HSTRING} 
     */
    AppointmentLocalId {
        get => this.get_AppointmentLocalId()
    }

    /**
     * Gets the original starting time for a recurring appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequest.appointmentoriginalstarttime
     * @type {IReference<DateTime>} 
     */
    AppointmentOriginalStartTime {
        get => this.get_AppointmentOriginalStartTime()
    }

    /**
     * Gets the proposed new start time of the meeting.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequest.newstarttime
     * @type {DateTime} 
     */
    NewStartTime {
        get => this.get_NewStartTime()
    }

    /**
     * Gets the proposed new duration of the meeting.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequest.newduration
     * @type {TimeSpan} 
     */
    NewDuration {
        get => this.get_NewDuration()
    }

    /**
     * Gets the subject of the new meeting invitation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequest.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * Gets a text comment the user may write regarding the change in meeting time.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequest.comment
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
        if (!this.HasProp("__IAppointmentCalendarProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarProposeNewTimeForMeetingRequest := IAppointmentCalendarProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarProposeNewTimeForMeetingRequest.get_AppointmentCalendarLocalId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppointmentLocalId() {
        if (!this.HasProp("__IAppointmentCalendarProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarProposeNewTimeForMeetingRequest := IAppointmentCalendarProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarProposeNewTimeForMeetingRequest.get_AppointmentLocalId()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_AppointmentOriginalStartTime() {
        if (!this.HasProp("__IAppointmentCalendarProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarProposeNewTimeForMeetingRequest := IAppointmentCalendarProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarProposeNewTimeForMeetingRequest.get_AppointmentOriginalStartTime()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_NewStartTime() {
        if (!this.HasProp("__IAppointmentCalendarProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarProposeNewTimeForMeetingRequest := IAppointmentCalendarProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarProposeNewTimeForMeetingRequest.get_NewStartTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_NewDuration() {
        if (!this.HasProp("__IAppointmentCalendarProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarProposeNewTimeForMeetingRequest := IAppointmentCalendarProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarProposeNewTimeForMeetingRequest.get_NewDuration()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IAppointmentCalendarProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarProposeNewTimeForMeetingRequest := IAppointmentCalendarProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarProposeNewTimeForMeetingRequest.get_Subject()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        if (!this.HasProp("__IAppointmentCalendarProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarProposeNewTimeForMeetingRequest := IAppointmentCalendarProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarProposeNewTimeForMeetingRequest.get_Comment()
    }

    /**
     * Notifies the system that the task of updating a meeting's time has completed.
     * @remarks
     * This method should be called only if the app has successfully pushed a meeting response update.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IAppointmentCalendarProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarProposeNewTimeForMeetingRequest := IAppointmentCalendarProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarProposeNewTimeForMeetingRequest.ReportCompletedAsync()
    }

    /**
     * Notifies the system that the task of updating a meeting's time has failed.
     * @remarks
     * This method should be called only if the app has failed to push a meeting time change.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IAppointmentCalendarProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarProposeNewTimeForMeetingRequest := IAppointmentCalendarProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IAppointmentCalendarProposeNewTimeForMeetingRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
