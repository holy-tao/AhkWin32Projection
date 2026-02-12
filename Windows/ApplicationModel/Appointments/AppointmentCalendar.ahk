#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendar.ahk
#Include .\IAppointmentCalendar2.ahk
#Include .\IAppointmentCalendar3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a calendar with appointments.
 * @remarks
 * Call the [AppointmentStore.CreateAppointmentCalendarAsync](appointmentstore_createappointmentcalendarasync_2027049901.md), the [AppointmentStore.FindAppointmentCalendarsAsync](appointmentstore_findappointmentcalendarsasync_2097897582.md), or the [AppointmentStore.GetAppointmentCalendarAsync](appointmentstore_getappointmentcalendarasync_1959042536.md) method to obtain an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendar extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendar.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the color that the built-in calendar app uses for appointments associated with the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.displaycolor
     * @type {Color} 
     */
    DisplayColor {
        get => this.get_DisplayColor()
        set => this.put_DisplayColor(value)
    }

    /**
     * Gets a string representing the display name for the [AppointmentCalendar](appointmentcalendar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets a string that uniquely identifies the appointment calendar on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.localid
     * @type {HSTRING} 
     */
    LocalId {
        get => this.get_LocalId()
    }

    /**
     * Gets whether the [AppointmentCalendar](appointmentcalendar.md) is hidden in the device's built-in calendar UI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.ishidden
     * @type {Boolean} 
     */
    IsHidden {
        get => this.get_IsHidden()
        set => this.put_IsHidden(value)
    }

    /**
     * Gets or sets a boolean value indicating whether other apps on the device have read access to the appointment calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.otherappreadaccess
     * @type {Integer} 
     */
    OtherAppReadAccess {
        get => this.get_OtherAppReadAccess()
        set => this.put_OtherAppReadAccess(value)
    }

    /**
     * Gets or sets a boolean value indicating whether other apps on the device have write access to the appointment calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.otherappwriteaccess
     * @type {Integer} 
     */
    OtherAppWriteAccess {
        get => this.get_OtherAppWriteAccess()
        set => this.put_OtherAppWriteAccess(value)
    }

    /**
     * Gets a string that describes the provider for the appointment calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.sourcedisplayname
     * @type {HSTRING} 
     */
    SourceDisplayName {
        get => this.get_SourceDisplayName()
    }

    /**
     * Gets or sets how the summary card for the calendar's appointments are displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.summarycardview
     * @type {Integer} 
     */
    SummaryCardView {
        get => this.get_SummaryCardView()
        set => this.put_SummaryCardView(value)
    }

    /**
     * Gets the [AppointmentCalendarSyncManager](appointmentcalendarsyncmanager.md) which can be used to sync with the remote server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.syncmanager
     * @type {AppointmentCalendarSyncManager} 
     */
    SyncManager {
        get => this.get_SyncManager()
    }

    /**
     * Gets the remote ID for the [AppointmentCalendar](appointmentcalendar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Get the identifier of the user account data for the [AppointmentCalendar](appointmentcalendar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.userdataaccountid
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * Gets or sets a Boolean value that indicates if the calendar supports creating or updating appointments.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.cancreateorupdateappointments
     * @type {Boolean} 
     */
    CanCreateOrUpdateAppointments {
        get => this.get_CanCreateOrUpdateAppointments()
        set => this.put_CanCreateOrUpdateAppointments(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the calendar supports cancelling meetings.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.cancancelmeetings
     * @type {Boolean} 
     */
    CanCancelMeetings {
        get => this.get_CanCancelMeetings()
        set => this.put_CanCancelMeetings(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the calendar supports forwarding meetings.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.canforwardmeetings
     * @type {Boolean} 
     */
    CanForwardMeetings {
        get => this.get_CanForwardMeetings()
        set => this.put_CanForwardMeetings(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the calendar supports proposing new meeting times.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.canproposenewtimeformeetings
     * @type {Boolean} 
     */
    CanProposeNewTimeForMeetings {
        get => this.get_CanProposeNewTimeForMeetings()
        set => this.put_CanProposeNewTimeForMeetings(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the calendar supports updating meeting responses.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.canupdatemeetingresponses
     * @type {Boolean} 
     */
    CanUpdateMeetingResponses {
        get => this.get_CanUpdateMeetingResponses()
        set => this.put_CanUpdateMeetingResponses(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the calendar supports notifying attendees.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.cannotifyinvitees
     * @type {Boolean} 
     */
    CanNotifyInvitees {
        get => this.get_CanNotifyInvitees()
        set => this.put_CanNotifyInvitees(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if invitees must be sent notifications.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.mustnofityinvitees
     * @type {Boolean} 
     */
    MustNofityInvitees {
        get => this.get_MustNofityInvitees()
        set => this.put_MustNofityInvitees(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DisplayColor() {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.get_DisplayColor()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalId() {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.get_LocalId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHidden() {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.get_IsHidden()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppReadAccess() {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.get_OtherAppReadAccess()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppReadAccess(value) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.put_OtherAppReadAccess(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppWriteAccess() {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.get_OtherAppWriteAccess()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppWriteAccess(value) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.put_OtherAppWriteAccess(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceDisplayName() {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.get_SourceDisplayName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SummaryCardView() {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.get_SummaryCardView()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SummaryCardView(value) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.put_SummaryCardView(value)
    }

    /**
     * Asynchronously retrieves a list of appointments belonging to the current [AppointmentCalendar](appointmentcalendar.md) that meet the specified criteria.
     * @remarks
     * > [!IMPORTANT]
     * > For performance reasons, [FindAppointmentsAsync](appointmentcalendar_findappointmentsasync_1659613836.md) will not load most properties. To load specific properties, add values to the [FindAppointmentsOptions.FetchProperties](findappointmentsoptions_fetchproperties.md) member in the *options* parameter.
     * @param {DateTime} rangeStart The start time of the time window for which appointments are retrieved.
     * @param {TimeSpan} rangeLength The length of the time window for which appointments are retrieved. If the *rangeLength* parameter is set to 0, no appointments will be returned. Even if appointments exist on the device that have a [StartTime](appointment_starttime.md) that is exactly the same as the *rangeStart* value, the returned list will be empty.
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.findappointmentsasync
     */
    FindAppointmentsAsync(rangeStart, rangeLength) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.FindAppointmentsAsync(rangeStart, rangeLength)
    }

    /**
     * Asynchronously retrieves a list of appointments belonging to the current [AppointmentCalendar](appointmentcalendar.md) that meet the specified criteria.
     * @param {DateTime} rangeStart The start time of the time window for which appointments are retrieved.
     * @param {TimeSpan} rangeLength The length of the time window for which appointments are retrieved. If the *rangeLength* parameter is set to 0, no appointments will be returned. Even if appointments exist on the device that have a [StartTime](appointment_starttime.md) that is exactly the same as the *rangeStart* value, the returned list will be empty.
     * @param {FindAppointmentsOptions} options 
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.findappointmentsasync
     */
    FindAppointmentsAsyncWithOptions(rangeStart, rangeLength, options) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.FindAppointmentsAsyncWithOptions(rangeStart, rangeLength, options)
    }

    /**
     * Asynchronously retrieves a list of appointment instances that are exceptions from the specified master appointment.
     * @param {HSTRING} masterLocalId The [LocalId](appointment_localid.md) of the master appointment for which exceptional appointment instances are retrieved.
     * @returns {IAsyncOperation<IVectorView<AppointmentException>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.findexceptionsfrommasterasync
     */
    FindExceptionsFromMasterAsync(masterLocalId) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.FindExceptionsFromMasterAsync(masterLocalId)
    }

    /**
     * Asynchronously retrieves a list of appointment instances of the specified master appointment that meet the specified criteria.
     * @param {HSTRING} masterLocalId The [LocalId](appointment_localid.md) of the master appointment for which appointment instances are retrieved.
     * @param {DateTime} rangeStart The start time of the time window for which appointment instances are retrieved.
     * @param {TimeSpan} rangeLength The length of the time window for which appointment instances are retrieved.
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.findallinstancesasync
     */
    FindAllInstancesAsync(masterLocalId, rangeStart, rangeLength) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.FindAllInstancesAsync(masterLocalId, rangeStart, rangeLength)
    }

    /**
     * Asynchronously retrieves a list of appointment instances of the specified master appointment that meet the specified criteria.
     * @param {HSTRING} masterLocalId The [LocalId](appointment_localid.md) of the master appointment for which appointment instances are retrieved.
     * @param {DateTime} rangeStart The start time of the time window for which appointment instances are retrieved.
     * @param {TimeSpan} rangeLength The length of the time window for which appointment instances are retrieved.
     * @param {FindAppointmentsOptions} pOptions 
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.findallinstancesasync
     */
    FindAllInstancesAsyncWithOptions(masterLocalId, rangeStart, rangeLength, pOptions) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.FindAllInstancesAsyncWithOptions(masterLocalId, rangeStart, rangeLength, pOptions)
    }

    /**
     * Asynchronously retrieves the [Appointment](appointment.md) with the specified ID.
     * @param {HSTRING} localId The [LocalId](appointment_localid.md) of the appointment to be retrieved.
     * @returns {IAsyncOperation<Appointment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.getappointmentasync
     */
    GetAppointmentAsync(localId) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.GetAppointmentAsync(localId)
    }

    /**
     * Asynchronously retrieves the appointment instance of the specified master appointment that has the specified start time.
     * @remarks
     * The *instanceStartTime* parameter must be the original start date of the instance.
     * @param {HSTRING} localId The ID of the master appointment to which the retrieved appointment instance belongs.
     * @param {DateTime} instanceStartTime The start time of the appointment instance to be retrieved.
     * @returns {IAsyncOperation<Appointment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.getappointmentinstanceasync
     */
    GetAppointmentInstanceAsync(localId, instanceStartTime) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.GetAppointmentInstanceAsync(localId, instanceStartTime)
    }

    /**
     * Asynchronously retrieves a list of appointments that meet the specified criteria.
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.findunexpandedappointmentsasync
     */
    FindUnexpandedAppointmentsAsync() {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.FindUnexpandedAppointmentsAsync()
    }

    /**
     * Asynchronously retrieves a list of appointments that meet the specified criteria.
     * @param {FindAppointmentsOptions} options 
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.findunexpandedappointmentsasync
     */
    FindUnexpandedAppointmentsAsyncWithOptions(options) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.FindUnexpandedAppointmentsAsyncWithOptions(options)
    }

    /**
     * Asynchronously deletes the appointment calendar.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.deleteasync
     */
    DeleteAsync() {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.DeleteAsync()
    }

    /**
     * Asynchronously saves changes to the appointment calendar.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.SaveAsync()
    }

    /**
     * Asynchronously deletes the appointment with the specified ID.
     * @param {HSTRING} localId The [LocalId](appointment_localid.md) of the appointment to be deleted.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.deleteappointmentasync
     */
    DeleteAppointmentAsync(localId) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.DeleteAppointmentAsync(localId)
    }

    /**
     * Asynchronously deletes the appointment instance with the specified start time of a master appointment with the specified ID.
     * @param {HSTRING} localId The [LocalId](appointment_localid.md) of the master appointment associated with the appointment instance to be deleted.
     * @param {DateTime} instanceStartTime The start time of the appointment instance to be deleted. This must be the original start date of the instance.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.deleteappointmentinstanceasync
     */
    DeleteAppointmentInstanceAsync(localId, instanceStartTime) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.DeleteAppointmentInstanceAsync(localId, instanceStartTime)
    }

    /**
     * Asynchronously saves the provided appointment to the calendar.
     * @param {Appointment} pAppointment The appointment to be saved.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.saveappointmentasync
     */
    SaveAppointmentAsync(pAppointment) {
        if (!this.HasProp("__IAppointmentCalendar")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar := IAppointmentCalendar(outPtr)
        }

        return this.__IAppointmentCalendar.SaveAppointmentAsync(pAppointment)
    }

    /**
     * 
     * @returns {AppointmentCalendarSyncManager} 
     */
    get_SyncManager() {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.get_SyncManager()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.get_RemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.put_RemoteId(value)
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_DisplayColor(value) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.put_DisplayColor(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHidden(value) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.put_IsHidden(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDataAccountId() {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.get_UserDataAccountId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCreateOrUpdateAppointments() {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.get_CanCreateOrUpdateAppointments()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanCreateOrUpdateAppointments(value) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.put_CanCreateOrUpdateAppointments(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCancelMeetings() {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.get_CanCancelMeetings()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanCancelMeetings(value) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.put_CanCancelMeetings(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanForwardMeetings() {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.get_CanForwardMeetings()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanForwardMeetings(value) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.put_CanForwardMeetings(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanProposeNewTimeForMeetings() {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.get_CanProposeNewTimeForMeetings()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanProposeNewTimeForMeetings(value) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.put_CanProposeNewTimeForMeetings(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanUpdateMeetingResponses() {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.get_CanUpdateMeetingResponses()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanUpdateMeetingResponses(value) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.put_CanUpdateMeetingResponses(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanNotifyInvitees() {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.get_CanNotifyInvitees()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanNotifyInvitees(value) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.put_CanNotifyInvitees(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MustNofityInvitees() {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.get_MustNofityInvitees()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MustNofityInvitees(value) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.put_MustNofityInvitees(value)
    }

    /**
     * Asynchronously attempts to create or update a meeting.
     * @param {Appointment} appointment_ The meeting to create or update.
     * @param {Boolean} notifyInvitees A Boolean value indicating if invitees should be notified.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.trycreateorupdateappointmentasync
     */
    TryCreateOrUpdateAppointmentAsync(appointment_, notifyInvitees) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.TryCreateOrUpdateAppointmentAsync(appointment_, notifyInvitees)
    }

    /**
     * Asynchronously attempts to cancel a meeting.
     * @param {Appointment} meeting The meeting to cancel.
     * @param {HSTRING} subject The subject for the cancellation notification.
     * @param {HSTRING} comment The body of the cancellation notification.
     * @param {Boolean} notifyInvitees A Boolean value indicating if invitees should be notified.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.trycancelmeetingasync
     */
    TryCancelMeetingAsync(meeting, subject, comment, notifyInvitees) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.TryCancelMeetingAsync(meeting, subject, comment, notifyInvitees)
    }

    /**
     * Asynchronously attempts to forward a meeting.
     * @param {Appointment} meeting The meeting to forward.
     * @param {IIterable<AppointmentInvitee>} invitees A list of new invitees to receive the forwarded meeting.
     * @param {HSTRING} subject The subject of the meeting invitation.
     * @param {HSTRING} forwardHeader A new meeting header that includes the new invitees.
     * @param {HSTRING} comment The body of the forwarded meeting invitation.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.tryforwardmeetingasync
     */
    TryForwardMeetingAsync(meeting, invitees, subject, forwardHeader, comment) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.TryForwardMeetingAsync(meeting, invitees, subject, forwardHeader, comment)
    }

    /**
     * Asynchronously attempts to propose a new meeting time.
     * @param {Appointment} meeting The meeting to update.
     * @param {DateTime} newStartTime The proposed new start time.
     * @param {TimeSpan} newDuration A new duration for the meeting.
     * @param {HSTRING} subject The subject of the meeting invitation.
     * @param {HSTRING} comment The body of the meeting invitation.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.tryproposenewtimeformeetingasync
     */
    TryProposeNewTimeForMeetingAsync(meeting, newStartTime, newDuration, subject, comment) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.TryProposeNewTimeForMeetingAsync(meeting, newStartTime, newDuration, subject, comment)
    }

    /**
     * Asynchronously attempts to update the response to a meeting invitation.
     * @param {Appointment} meeting The meeting to update.
     * @param {Integer} response The response to the meeting invitation, such as accept, tentative or decline.
     * @param {HSTRING} subject The subject of the response.
     * @param {HSTRING} comment The body of the response.
     * @param {Boolean} sendUpdate A Boolean value indicating whether or not to send the response to the meeting organizer.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.tryupdatemeetingresponseasync
     */
    TryUpdateMeetingResponseAsync(meeting, response, subject, comment, sendUpdate) {
        if (!this.HasProp("__IAppointmentCalendar2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar2 := IAppointmentCalendar2(outPtr)
        }

        return this.__IAppointmentCalendar2.TryUpdateMeetingResponseAsync(meeting, response, subject, comment, sendUpdate)
    }

    /**
     * Registers the [AppointmentCalendar](appointmentcalendar.md) as a sync provider.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendar.registersyncmanagerasync
     */
    RegisterSyncManagerAsync() {
        if (!this.HasProp("__IAppointmentCalendar3")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendar3 := IAppointmentCalendar3(outPtr)
        }

        return this.__IAppointmentCalendar3.RegisterSyncManagerAsync()
    }

;@endregion Instance Methods
}
