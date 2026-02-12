#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentPropertiesStatics2.ahk
#Include .\IAppointmentPropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides strings that identify the properties of an appointment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets the current change number of the local version of the [Appointment](appointment.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.changenumber
     * @type {HSTRING} 
     */
    static ChangeNumber {
        get => AppointmentProperties.get_ChangeNumber()
    }

    /**
     * Gets or sets the current change number of the server version of the [Appointment](appointment.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.remotechangenumber
     * @type {HSTRING} 
     */
    static RemoteChangeNumber {
        get => AppointmentProperties.get_RemoteChangeNumber()
    }

    /**
     * Gets the format of the appointment details, plain text or HTML.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.detailskind
     * @type {HSTRING} 
     */
    static DetailsKind {
        get => AppointmentProperties.get_DetailsKind()
    }

    /**
     * Gets the name of the [Subject](appointment_subject.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.subject
     * @type {HSTRING} 
     */
    static Subject {
        get => AppointmentProperties.get_Subject()
    }

    /**
     * Gets the name of the [Location](appointment_location.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.location
     * @type {HSTRING} 
     */
    static Location {
        get => AppointmentProperties.get_Location()
    }

    /**
     * Gets the name of the [StartTime](appointment_starttime.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.starttime
     * @type {HSTRING} 
     */
    static StartTime {
        get => AppointmentProperties.get_StartTime()
    }

    /**
     * Gets the name of the [Duration](appointment_duration.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.duration
     * @type {HSTRING} 
     */
    static Duration {
        get => AppointmentProperties.get_Duration()
    }

    /**
     * Gets the name of the [Reminder](appointment_reminder.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.reminder
     * @type {HSTRING} 
     */
    static Reminder {
        get => AppointmentProperties.get_Reminder()
    }

    /**
     * Gets the name of the [BusyStatus](appointment_busystatus.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.busystatus
     * @type {HSTRING} 
     */
    static BusyStatus {
        get => AppointmentProperties.get_BusyStatus()
    }

    /**
     * Gets the name of the [Sensitivity](appointment_sensitivity.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.sensitivity
     * @type {HSTRING} 
     */
    static Sensitivity {
        get => AppointmentProperties.get_Sensitivity()
    }

    /**
     * Gets the name of the [OriginalStartTime](appointment_originalstarttime.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.originalstarttime
     * @type {HSTRING} 
     */
    static OriginalStartTime {
        get => AppointmentProperties.get_OriginalStartTime()
    }

    /**
     * Gets the name of the [IsResponseRequested](appointment_isresponserequested.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.isresponserequested
     * @type {HSTRING} 
     */
    static IsResponseRequested {
        get => AppointmentProperties.get_IsResponseRequested()
    }

    /**
     * Gets the name of [AllowNewTimeProposal](appointment_allownewtimeproposal.md) the property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.allownewtimeproposal
     * @type {HSTRING} 
     */
    static AllowNewTimeProposal {
        get => AppointmentProperties.get_AllowNewTimeProposal()
    }

    /**
     * Gets the name of the [AllDay](appointment_allday.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.allday
     * @type {HSTRING} 
     */
    static AllDay {
        get => AppointmentProperties.get_AllDay()
    }

    /**
     * Gets the name of the [Details](appointment_details.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.details
     * @type {HSTRING} 
     */
    static Details {
        get => AppointmentProperties.get_Details()
    }

    /**
     * Gets the name of the [OnlineMeetingLink](appointment_onlinemeetinglink.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.onlinemeetinglink
     * @type {HSTRING} 
     */
    static OnlineMeetingLink {
        get => AppointmentProperties.get_OnlineMeetingLink()
    }

    /**
     * Gets the name of the [ReplyTime](appointment_replytime.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.replytime
     * @type {HSTRING} 
     */
    static ReplyTime {
        get => AppointmentProperties.get_ReplyTime()
    }

    /**
     * Gets the name of the [Organizer](appointment_organizer.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.organizer
     * @type {HSTRING} 
     */
    static Organizer {
        get => AppointmentProperties.get_Organizer()
    }

    /**
     * Gets the name of the [UserResponse](appointment_userresponse.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.userresponse
     * @type {HSTRING} 
     */
    static UserResponse {
        get => AppointmentProperties.get_UserResponse()
    }

    /**
     * Gets the name of the [HasInvitees](appointment_hasinvitees.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.hasinvitees
     * @type {HSTRING} 
     */
    static HasInvitees {
        get => AppointmentProperties.get_HasInvitees()
    }

    /**
     * Gets the name of the [IsCanceledMeeting](appointment_iscanceledmeeting.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.iscanceledmeeting
     * @type {HSTRING} 
     */
    static IsCanceledMeeting {
        get => AppointmentProperties.get_IsCanceledMeeting()
    }

    /**
     * Gets the name of the [IsOrganizedByUser](appointment_isorganizedbyuser.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.isorganizedbyuser
     * @type {HSTRING} 
     */
    static IsOrganizedByUser {
        get => AppointmentProperties.get_IsOrganizedByUser()
    }

    /**
     * Gets the name of the [Recurrence](appointment_recurrence.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.recurrence
     * @type {HSTRING} 
     */
    static Recurrence {
        get => AppointmentProperties.get_Recurrence()
    }

    /**
     * Gets the name of the [Uri](appointment_uri.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.uri
     * @type {HSTRING} 
     */
    static Uri {
        get => AppointmentProperties.get_Uri()
    }

    /**
     * Gets the name of the [Invitees](appointment_invitees.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.invitees
     * @type {HSTRING} 
     */
    static Invitees {
        get => AppointmentProperties.get_Invitees()
    }

    /**
     * Gets a list of names for the default appointment properties.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentproperties.defaultproperties
     * @type {IVector<HSTRING>} 
     */
    static DefaultProperties {
        get => AppointmentProperties.get_DefaultProperties()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ChangeNumber() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics2.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics2 := IAppointmentPropertiesStatics2(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics2.get_ChangeNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RemoteChangeNumber() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics2.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics2 := IAppointmentPropertiesStatics2(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics2.get_RemoteChangeNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DetailsKind() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics2.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics2 := IAppointmentPropertiesStatics2(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics2.get_DetailsKind()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Subject() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_Subject()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Location() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_Location()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_StartTime() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_StartTime()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Duration() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_Duration()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Reminder() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_Reminder()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BusyStatus() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_BusyStatus()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sensitivity() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_Sensitivity()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_OriginalStartTime() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_OriginalStartTime()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_IsResponseRequested() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_IsResponseRequested()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AllowNewTimeProposal() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_AllowNewTimeProposal()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AllDay() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_AllDay()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Details() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_Details()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_OnlineMeetingLink() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_OnlineMeetingLink()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ReplyTime() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_ReplyTime()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Organizer() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_Organizer()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_UserResponse() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_UserResponse()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HasInvitees() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_HasInvitees()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_IsCanceledMeeting() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_IsCanceledMeeting()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_IsOrganizedByUser() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_IsOrganizedByUser()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Recurrence() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_Recurrence()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Uri() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_Uri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Invitees() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_Invitees()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    static get_DefaultProperties() {
        if (!AppointmentProperties.HasProp("__IAppointmentPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentPropertiesStatics.IID)
            AppointmentProperties.__IAppointmentPropertiesStatics := IAppointmentPropertiesStatics(factoryPtr)
        }

        return AppointmentProperties.__IAppointmentPropertiesStatics.get_DefaultProperties()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
