#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointment.ahk
#Include .\IAppointment2.ahk
#Include .\IAppointment3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an appointment in a calendar. This class is used when an app is activated using the **AppointmentsProvider** value for [ActivationKind](../windows.applicationmodel.activation/activationkind.md), as a value for [AppointmentInformation](../windows.applicationmodel.appointments.appointmentsprovider/addappointmentoperation_appointmentinformation.md) properties.
 * @remarks
 * For info about how to manage appointments, see [Managing appointments](/windows/uwp/contacts-and-calendar/managing-appointments) and [Quickstart: Managing appointments ](/previous-versions/windows/apps/dn495338(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class Appointment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the starting time for the appointment. StartTime is of type [DateTime](../windows.foundation/datetime.md).
     * @remarks
     * This property uses an object representing date and time, and that object is represented differently depending on which language you are programming with.
     * + In JavaScript, set the StartTime value with a **Date** object. For example, this code sets a StartTime value to a specific date and time. ```javascript
     * appointment.startTime = new Date(2015, 9, 10, 9); // October 10th, 2015 at 9:00am
     * ```
     * 
     * 
     * + In Visual C++ component extensions (C++/CX), use a [DateTime](../windows.foundation/datetime.md) structure value.
     * + In C# or Microsoft Visual Basic, you use a [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) value. You can use utility API of [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) to generate a [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) from different inputs (local time, parsed strings, and so on) and set the value.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.starttime
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * Gets or sets a time span that represents the time duration of the appointment. Duration is of type [TimeSpan](../windows.foundation/timespan.md) and must be non-negative.
     * @remarks
     * This property uses a time span value, which is represented differently depending on which language you are programming with.
     * + In JavaScript, set the Duration value with a **Number** that represents the time interval. Each unit for a [TimeSpan](../windows.foundation/timespan.md) value represents 1 millisecond. For example, this code sets a Duration value to 60 minutes (one hour). ```javascript
     * appointment.duration = (60 * 60 * 1000); // 1 hour in 1-millisecond units
     * ```
     * 
     * 
     * + In Visual C++ component extensions (C++/CX), use a [TimeSpan](../windows.foundation/timespan.md) structure value with a **Duration** value. In Visual C++ component extensions (C++/CX), each unit for a **Duration** value represents 100 nanoseconds.
     * + In C# or Microsoft Visual Basic, you use a [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) value. You can use utility API of [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) such as [FromSeconds](/dotnet/api/system.timespan.fromseconds?view=dotnet-uwp-10.0&preserve-view=true) to generate a [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) and set the value.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > In JavaScript, [TimeSpan](../windows.foundation/timespan.md) is accessed as a value, not as an object. For example, use `var a = 10000`, not `var a = { duration: 10000 }`. Also, in JavaScript, [TimeSpan](../windows.foundation/timespan.md) is treated as the number of millisecond intervals, not the number of 100-nanosecond intervals so you can lose precision when you port [TimeSpan](../windows.foundation/timespan.md) values between languages.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets a string that communicates the physical location of the appointment. Location is of type [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) and a maximum of 32,768 characters in length.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.location
     * @type {HSTRING} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * Gets or sets a string that communicates the subject of the appointment. Subject is of type [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) and a maximum of 255 characters in length.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * Gets or sets a string value. The string contains extended details that describe the appointment. Details is of type [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) and a maximum of 1,073,741,823 characters in length, which is the maximum length of a JET database string.
     * @remarks
     * <!--TBW more guidance on string form-->
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.details
     * @type {HSTRING} 
     */
    Details {
        get => this.get_Details()
        set => this.put_Details(value)
    }

    /**
     * Gets or sets a time span value. The value declares the amount of time to subtract from the [StartTime](appointment_starttime.md), and that time used as the issue time for a reminder for an appointment. A **null** value indicates that the appointment will not issue a reminder. Reminder is of type [IReference(TimeSpan)](../windows.foundation/ireference_1.md).
     * @remarks
     * This property uses a time span value, which is represented differently depending on which language you are programming with. For more information about how to use a time span value, see the [Duration](appointment_duration.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.reminder
     * @type {IReference<TimeSpan>} 
     */
    Reminder {
        get => this.get_Reminder()
        set => this.put_Reminder(value)
    }

    /**
     * Gets or sets the organizer of the appointment. Organizer is of type [AppointmentOrganizer](appointmentorganizer.md). If an organizer is set and invitee length is greater than 0, a call to an [AppointmentManager](appointmentmanager.md)API fails with **E_INVALIDARG**. The number of invitees is unlimited.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.organizer
     * @type {AppointmentOrganizer} 
     */
    Organizer {
        get => this.get_Organizer()
        set => this.put_Organizer(value)
    }

    /**
     * Gets the list of participants for the appointment. Invitees is of type [IVector(AppointmentInvitee)](../windows.foundation.collections/ivector_1.md). If an organizer is set and invitee length is greater than 0, a call to an [AppointmentManager](appointmentmanager.md)API fails with **E_INVALIDARG**. The number of invitees is unlimited.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.invitees
     * @type {IVector<AppointmentInvitee>} 
     */
    Invitees {
        get => this.get_Invitees()
    }

    /**
     * Gets or sets the object that describes when and how often the appointment occurs. Recurrence is of type [AppointmentRecurrence](appointmentrecurrence.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.recurrence
     * @type {AppointmentRecurrence} 
     */
    Recurrence {
        get => this.get_Recurrence()
        set => this.put_Recurrence(value)
    }

    /**
     * Gets or sets a [AppointmentBusyStatus](appointmentbusystatus.md)-typed value that indicates the busy status for a participant of an appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.busystatus
     * @type {Integer} 
     */
    BusyStatus {
        get => this.get_BusyStatus()
        set => this.put_BusyStatus(value)
    }

    /**
     * Gets or sets a [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) value that indicates whether the appointment will last all day. The default is **FALSE** for won't last all day.
     * @remarks
     * When creating an appointment with **AllDay** set to true, you should set the [StartTime](appointment_starttime.md) of the appointment to midnight (00:00:00).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.allday
     * @type {Boolean} 
     */
    AllDay {
        get => this.get_AllDay()
        set => this.put_AllDay(value)
    }

    /**
     * Gets or sets a [AppointmentSensitivity](appointmentsensitivity.md)-typed value that indicates the sensitivity of the appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.sensitivity
     * @type {Integer} 
     */
    Sensitivity {
        get => this.get_Sensitivity()
        set => this.put_Sensitivity(value)
    }

    /**
     * Gets the Uniform Resource Identifier ([Uri](../windows.foundation/uri.md)) for the appointment. Allows the Calendar app to perform an association launch to go back to the source app or other URI that represents this appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * Gets a string that uniquely identifies the appointment on the local device.
     * @remarks
     * The ID retrieved with this property is guaranteed to be unique on the local device. To associate appointments across devices, use [RoamingId](appointment_roamingid.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.localid
     * @type {HSTRING} 
     */
    LocalId {
        get => this.get_LocalId()
    }

    /**
     * Gets the unique identifier for the calendar associated with the appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.calendarid
     * @type {HSTRING} 
     */
    CalendarId {
        get => this.get_CalendarId()
    }

    /**
     * Gets or sets a string that uniquely identifies an appointment across devices.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.roamingid
     * @type {HSTRING} 
     */
    RoamingId {
        get => this.get_RoamingId()
        set => this.put_RoamingId(value)
    }

    /**
     * Gets the original starting time for a recurring appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.originalstarttime
     * @type {IReference<DateTime>} 
     */
    OriginalStartTime {
        get => this.get_OriginalStartTime()
    }

    /**
     * Gets or sets a value that indicates whether a response to the appointment invitation is requested.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.isresponserequested
     * @type {Boolean} 
     */
    IsResponseRequested {
        get => this.get_IsResponseRequested()
        set => this.put_IsResponseRequested(value)
    }

    /**
     * Gets or sets a value that indicates whether the appointment will allow users to propose a new time.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.allownewtimeproposal
     * @type {Boolean} 
     */
    AllowNewTimeProposal {
        get => this.get_AllowNewTimeProposal()
        set => this.put_AllowNewTimeProposal(value)
    }

    /**
     * Gets or sets a string value that is a URL used to join the online meeting for the appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.onlinemeetinglink
     * @type {HSTRING} 
     */
    OnlineMeetingLink {
        get => this.get_OnlineMeetingLink()
        set => this.put_OnlineMeetingLink(value)
    }

    /**
     * Gets or sets the date and time that the user responded to the appointment request.
     * @remarks
     * The **ReplyTime** date you provide should be in the local time of the device since 12:01 AM, January 1, 1601 A.D. (C.E.) .
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.replytime
     * @type {IReference<DateTime>} 
     */
    ReplyTime {
        get => this.get_ReplyTime()
        set => this.put_ReplyTime(value)
    }

    /**
     * Gets or sets the user's response to the appointment request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.userresponse
     * @type {Integer} 
     */
    UserResponse {
        get => this.get_UserResponse()
        set => this.put_UserResponse(value)
    }

    /**
     * Gets a value that indicates whether the appointment has invitees.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.hasinvitees
     * @type {Boolean} 
     */
    HasInvitees {
        get => this.get_HasInvitees()
    }

    /**
     * Gets or sets a value that indicates whether the appointment has been cancelled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.iscanceledmeeting
     * @type {Boolean} 
     */
    IsCanceledMeeting {
        get => this.get_IsCanceledMeeting()
        set => this.put_IsCanceledMeeting(value)
    }

    /**
     * Gets or sets a value that indicates whether the appointment was organized by the current user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.isorganizedbyuser
     * @type {Boolean} 
     */
    IsOrganizedByUser {
        get => this.get_IsOrganizedByUser()
        set => this.put_IsOrganizedByUser(value)
    }

    /**
     * Gets the current change number of the local version of the [Appointment](appointment.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.changenumber
     * @type {Integer} 
     */
    ChangeNumber {
        get => this.get_ChangeNumber()
    }

    /**
     * Gets or sets the current change number of the server version of the [Appointment](appointment.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.remotechangenumber
     * @type {Integer} 
     */
    RemoteChangeNumber {
        get => this.get_RemoteChangeNumber()
        set => this.put_RemoteChangeNumber(value)
    }

    /**
     * Gets or sets the type of appointment details, plain text or HTML.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointment.detailskind
     * @type {Integer} 
     */
    DetailsKind {
        get => this.get_DetailsKind()
        set => this.put_DetailsKind(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Appointment](appointment.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.Appointment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_StartTime()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_StartTime(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_Duration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_Duration(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Location() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_Location()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Location(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_Location(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_Subject()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subject(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_Subject(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Details() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_Details()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Details(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_Details(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Reminder() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_Reminder()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Reminder(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_Reminder(value)
    }

    /**
     * 
     * @returns {AppointmentOrganizer} 
     */
    get_Organizer() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_Organizer()
    }

    /**
     * 
     * @param {AppointmentOrganizer} value 
     * @returns {HRESULT} 
     */
    put_Organizer(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_Organizer(value)
    }

    /**
     * 
     * @returns {IVector<AppointmentInvitee>} 
     */
    get_Invitees() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_Invitees()
    }

    /**
     * 
     * @returns {AppointmentRecurrence} 
     */
    get_Recurrence() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_Recurrence()
    }

    /**
     * 
     * @param {AppointmentRecurrence} value 
     * @returns {HRESULT} 
     */
    put_Recurrence(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_Recurrence(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BusyStatus() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_BusyStatus()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BusyStatus(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_BusyStatus(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllDay() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_AllDay()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllDay(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_AllDay(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Sensitivity() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_Sensitivity()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Sensitivity(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_Sensitivity(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.get_Uri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        if (!this.HasProp("__IAppointment")) {
            if ((queryResult := this.QueryInterface(IAppointment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment := IAppointment(outPtr)
        }

        return this.__IAppointment.put_Uri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalId() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_LocalId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CalendarId() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_CalendarId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RoamingId() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_RoamingId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RoamingId(value) {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.put_RoamingId(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_OriginalStartTime() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_OriginalStartTime()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsResponseRequested() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_IsResponseRequested()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsResponseRequested(value) {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.put_IsResponseRequested(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowNewTimeProposal() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_AllowNewTimeProposal()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowNewTimeProposal(value) {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.put_AllowNewTimeProposal(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OnlineMeetingLink() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_OnlineMeetingLink()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OnlineMeetingLink(value) {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.put_OnlineMeetingLink(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ReplyTime() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_ReplyTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ReplyTime(value) {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.put_ReplyTime(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserResponse() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_UserResponse()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UserResponse(value) {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.put_UserResponse(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasInvitees() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_HasInvitees()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceledMeeting() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_IsCanceledMeeting()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCanceledMeeting(value) {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.put_IsCanceledMeeting(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOrganizedByUser() {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.get_IsOrganizedByUser()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOrganizedByUser(value) {
        if (!this.HasProp("__IAppointment2")) {
            if ((queryResult := this.QueryInterface(IAppointment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment2 := IAppointment2(outPtr)
        }

        return this.__IAppointment2.put_IsOrganizedByUser(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeNumber() {
        if (!this.HasProp("__IAppointment3")) {
            if ((queryResult := this.QueryInterface(IAppointment3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment3 := IAppointment3(outPtr)
        }

        return this.__IAppointment3.get_ChangeNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemoteChangeNumber() {
        if (!this.HasProp("__IAppointment3")) {
            if ((queryResult := this.QueryInterface(IAppointment3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment3 := IAppointment3(outPtr)
        }

        return this.__IAppointment3.get_RemoteChangeNumber()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RemoteChangeNumber(value) {
        if (!this.HasProp("__IAppointment3")) {
            if ((queryResult := this.QueryInterface(IAppointment3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment3 := IAppointment3(outPtr)
        }

        return this.__IAppointment3.put_RemoteChangeNumber(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DetailsKind() {
        if (!this.HasProp("__IAppointment3")) {
            if ((queryResult := this.QueryInterface(IAppointment3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment3 := IAppointment3(outPtr)
        }

        return this.__IAppointment3.get_DetailsKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DetailsKind(value) {
        if (!this.HasProp("__IAppointment3")) {
            if ((queryResult := this.QueryInterface(IAppointment3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointment3 := IAppointment3(outPtr)
        }

        return this.__IAppointment3.put_DetailsKind(value)
    }

;@endregion Instance Methods
}
