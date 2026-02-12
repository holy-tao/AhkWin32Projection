#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMeetingInfo.ahk
#Include .\IEmailMeetingInfo2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the information associated with a meeting.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMeetingInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMeetingInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMeetingInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a Boolean value indicating whether the proposal of a new time is allowed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.allownewtimeproposal
     * @type {Boolean} 
     */
    AllowNewTimeProposal {
        get => this.get_AllowNewTimeProposal()
        set => this.put_AllowNewTimeProposal(value)
    }

    /**
     * Gets or sets the server identifier for the appointment associated with an email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.appointmentroamingid
     * @type {HSTRING} 
     */
    AppointmentRoamingId {
        get => this.get_AppointmentRoamingId()
        set => this.put_AppointmentRoamingId(value)
    }

    /**
     * Gets or sets the start time for a meeting.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.appointmentoriginalstarttime
     * @type {IReference<DateTime>} 
     */
    AppointmentOriginalStartTime {
        get => this.get_AppointmentOriginalStartTime()
        set => this.put_AppointmentOriginalStartTime(value)
    }

    /**
     * Gets or sets the duration of the meeting.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether the meeting is an all day event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.isallday
     * @type {Boolean} 
     */
    IsAllDay {
        get => this.get_IsAllDay()
        set => this.put_IsAllDay(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether a response to the meeting request is required.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.isresponserequested
     * @type {Boolean} 
     */
    IsResponseRequested {
        get => this.get_IsResponseRequested()
        set => this.put_IsResponseRequested(value)
    }

    /**
     * Gets or sets the meeting location.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.location
     * @type {HSTRING} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * Gets or sets the proposed start time for the proposed meeting change.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.proposedstarttime
     * @type {IReference<DateTime>} 
     */
    ProposedStartTime {
        get => this.get_ProposedStartTime()
        set => this.put_ProposedStartTime(value)
    }

    /**
     * Gets or sets the proposed duration for the proposed meeting change.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.proposedduration
     * @type {IReference<TimeSpan>} 
     */
    ProposedDuration {
        get => this.get_ProposedDuration()
        set => this.put_ProposedDuration(value)
    }

    /**
     * Gets or sets the first instance of the recurrence pattern.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.recurrencestarttime
     * @type {IReference<DateTime>} 
     */
    RecurrenceStartTime {
        get => this.get_RecurrenceStartTime()
        set => this.put_RecurrenceStartTime(value)
    }

    /**
     * Gets or sets the recurrence parameters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.recurrence
     * @type {AppointmentRecurrence} 
     */
    Recurrence {
        get => this.get_Recurrence()
        set => this.put_Recurrence(value)
    }

    /**
     * Gets or sets the change number on the server that identifies the meeting email change number.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.remotechangenumber
     * @type {Integer} 
     */
    RemoteChangeNumber {
        get => this.get_RemoteChangeNumber()
        set => this.put_RemoteChangeNumber(value)
    }

    /**
     * Gets or sets the start time for the meeting.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.starttime
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * Gets a Boolean value indicating if the meeting is reported as out of date by the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetinginfo.isreportedoutofdatebyserver
     * @type {Boolean} 
     */
    IsReportedOutOfDateByServer {
        get => this.get_IsReportedOutOfDateByServer()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the  class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailMeetingInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowNewTimeProposal() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_AllowNewTimeProposal()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowNewTimeProposal(value) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_AllowNewTimeProposal(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppointmentRoamingId() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_AppointmentRoamingId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AppointmentRoamingId(value) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_AppointmentRoamingId(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_AppointmentOriginalStartTime() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_AppointmentOriginalStartTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_AppointmentOriginalStartTime(value) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_AppointmentOriginalStartTime(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_Duration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_Duration(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAllDay() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_IsAllDay()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAllDay(value) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_IsAllDay(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsResponseRequested() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_IsResponseRequested()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsResponseRequested(value) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_IsResponseRequested(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Location() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_Location()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Location(value) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_Location(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ProposedStartTime() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_ProposedStartTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} proposedStartTime 
     * @returns {HRESULT} 
     */
    put_ProposedStartTime(proposedStartTime) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_ProposedStartTime(proposedStartTime)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_ProposedDuration() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_ProposedDuration()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} duration_ 
     * @returns {HRESULT} 
     */
    put_ProposedDuration(duration_) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_ProposedDuration(duration_)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_RecurrenceStartTime() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_RecurrenceStartTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_RecurrenceStartTime(value) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_RecurrenceStartTime(value)
    }

    /**
     * 
     * @returns {AppointmentRecurrence} 
     */
    get_Recurrence() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_Recurrence()
    }

    /**
     * 
     * @param {AppointmentRecurrence} value 
     * @returns {HRESULT} 
     */
    put_Recurrence(value) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_Recurrence(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemoteChangeNumber() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_RemoteChangeNumber()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RemoteChangeNumber(value) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_RemoteChangeNumber(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.get_StartTime()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        if (!this.HasProp("__IEmailMeetingInfo")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo := IEmailMeetingInfo(outPtr)
        }

        return this.__IEmailMeetingInfo.put_StartTime(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReportedOutOfDateByServer() {
        if (!this.HasProp("__IEmailMeetingInfo2")) {
            if ((queryResult := this.QueryInterface(IEmailMeetingInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMeetingInfo2 := IEmailMeetingInfo2(outPtr)
        }

        return this.__IEmailMeetingInfo2.get_IsReportedOutOfDateByServer()
    }

;@endregion Instance Methods
}
