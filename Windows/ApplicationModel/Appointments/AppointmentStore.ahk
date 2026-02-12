#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentStore.ahk
#Include .\IAppointmentStore2.ahk
#Include .\IAppointmentStore3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppointmentStore.ahk
#Include .\AppointmentStoreChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a store that contains appointments.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentStore.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the [AppointmentStoreChangeTracker](appointmentstorechangetracker.md) associated with the appointment store.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.changetracker
     * @type {AppointmentStoreChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * Occurs when the [AppointmentStore](appointmentstore.md) changes.
     * @type {TypedEventHandler<AppointmentStore, AppointmentStoreChangedEventArgs>}
    */
    OnStoreChanged {
        get {
            if(!this.HasProp("__OnStoreChanged")){
                this.__OnStoreChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9e628351-c639-5cef-ab1d-8beae9d75d52}"),
                    AppointmentStore,
                    AppointmentStoreChangedEventArgs
                )
                this.__OnStoreChangedToken := this.add_StoreChanged(this.__OnStoreChanged.iface)
            }
            return this.__OnStoreChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStoreChangedToken")) {
            this.remove_StoreChanged(this.__OnStoreChangedToken)
            this.__OnStoreChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {AppointmentStoreChangeTracker} 
     */
    get_ChangeTracker() {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.get_ChangeTracker()
    }

    /**
     * Asynchronously creates a new [AppointmentCalendar](appointmentcalendar.md) within the appointment store with the specified name and user data account ID.
     * @param {HSTRING} name The name for the new [AppointmentCalendar](appointmentcalendar.md).
     * @returns {IAsyncOperation<AppointmentCalendar>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.createappointmentcalendarasync
     */
    CreateAppointmentCalendarAsync(name) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.CreateAppointmentCalendarAsync(name)
    }

    /**
     * Retrieves the [AppointmentCalendar](appointmentcalendar.md) with the specified [LocalId](appointmentcalendar_localid.md).
     * @param {HSTRING} calendarId The [LocalId](appointmentcalendar_localid.md) of the [AppointmentCalendar](appointmentcalendar.md) to be retrieved.
     * @returns {IAsyncOperation<AppointmentCalendar>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.getappointmentcalendarasync
     */
    GetAppointmentCalendarAsync(calendarId) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.GetAppointmentCalendarAsync(calendarId)
    }

    /**
     * Retrieves the [Appointment](appointment.md) with the specified [LocalId](appointment_localid.md).
     * @param {HSTRING} localId The [LocalId](appointment_localid.md) of the appointment to be retrieved.
     * @returns {IAsyncOperation<Appointment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.getappointmentasync
     */
    GetAppointmentAsync(localId) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.GetAppointmentAsync(localId)
    }

    /**
     * Retrieves the instance of the [Appointment](appointment.md) with the specified [LocalId](appointment_localid.md) and the specified start time.
     * @param {HSTRING} localId The [LocalId](appointment_localid.md) of the appointment instance to be retrieved.
     * @param {DateTime} instanceStartTime The start time of the appointment instance to be retrieved. The value of this parameter must be the original start date of the instance.
     * @returns {IAsyncOperation<Appointment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.getappointmentinstanceasync
     */
    GetAppointmentInstanceAsync(localId, instanceStartTime) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.GetAppointmentInstanceAsync(localId, instanceStartTime)
    }

    /**
     * Retrieves a list of appointment calendars in the appointment store that meet the criteria specified by the supplied [FindAppointmentCalendarsOptions](findappointmentcalendarsoptions.md) object..
     * @returns {IAsyncOperation<IVectorView<AppointmentCalendar>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.findappointmentcalendarsasync
     */
    FindAppointmentCalendarsAsync() {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.FindAppointmentCalendarsAsync()
    }

    /**
     * Retrieves a list of all of the appointment calendars in the appointment store.
     * @param {Integer} options 
     * @returns {IAsyncOperation<IVectorView<AppointmentCalendar>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.findappointmentcalendarsasync
     */
    FindAppointmentCalendarsAsyncWithOptions(options) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.FindAppointmentCalendarsAsyncWithOptions(options)
    }

    /**
     * Retrieves a list of appointments in the appointment calendar that fall within the specified date range and meet the criteria specified by the supplied [FindAppointmentsOptions](findappointmentsoptions.md) object..
     * @remarks
     * > [!IMPORTANT]
     * > For performance reasons, [FindAppointmentsAsync](appointmentstore_findappointmentsasync_1659613836.md) will not load most properties. To load specific properties, add values to the [FindAppointmentsOptions.FetchProperties](findappointmentsoptions_fetchproperties.md) member in the *options* parameter. See the example below for more info.
     * @param {DateTime} rangeStart The start of the date range for which appointments are retrieved.
     * @param {TimeSpan} rangeLength The length of the date range for which appointments are retrieved. If the *rangeLength* parameter is set to 0, no appointments will be returned. Even if appointments exist on the device that have a [StartTime](appointment_starttime.md) that is exactly the same as the *rangeStart* value, the returned list will be empty.
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.findappointmentsasync
     */
    FindAppointmentsAsync(rangeStart, rangeLength) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.FindAppointmentsAsync(rangeStart, rangeLength)
    }

    /**
     * Retrieves a list of appointments in the appointment calendar that fall within the specified date range.
     * @param {DateTime} rangeStart The start of the date range for which appointments are retrieved.
     * @param {TimeSpan} rangeLength The length of the date range for which appointments are retrieved. If the *rangeLength* parameter is set to 0, no appointments will be returned. Even if appointments exist on the device that have a [StartTime](appointment_starttime.md) that is exactly the same as the *rangeStart* value, the returned list will be empty.
     * @param {FindAppointmentsOptions} options 
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.findappointmentsasync
     */
    FindAppointmentsAsyncWithOptions(rangeStart, rangeLength, options) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.FindAppointmentsAsyncWithOptions(rangeStart, rangeLength, options)
    }

    /**
     * Returns an [AppointmentConflictResult](appointmentconflictresult.md) representing a conflict between the specified appointment and an existing appointment instance in the appointment store.
     * @param {Appointment} appointment_ The appointment for which a conflict is sought.
     * @returns {IAsyncOperation<AppointmentConflictResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.findconflictasync
     */
    FindConflictAsync(appointment_) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.FindConflictAsync(appointment_)
    }

    /**
     * Returns an [AppointmentConflictResult](appointmentconflictresult.md) representing a conflict between the specified appointment and an existing appointment in the appointment store.
     * @param {Appointment} appointment_ The appointment for which a conflict is sought.
     * @param {DateTime} instanceStartTime 
     * @returns {IAsyncOperation<AppointmentConflictResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.findconflictasync
     */
    FindConflictAsyncWithInstanceStart(appointment_, instanceStartTime) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.FindConflictAsyncWithInstanceStart(appointment_, instanceStartTime)
    }

    /**
     * Moves the specified [Appointment](appointment.md) object to the specified [AppointmentCalendar](appointmentcalendar.md).
     * @param {Appointment} appointment_ The appointment to be moved.
     * @param {AppointmentCalendar} destinationCalendar The appointment calendar to which the appointment is moved.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.moveappointmentasync
     */
    MoveAppointmentAsync(appointment_, destinationCalendar) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.MoveAppointmentAsync(appointment_, destinationCalendar)
    }

    /**
     * Shows the Appointments provider Add Appointment UI, to enable the user to add an appointment.
     * @remarks
     * > For Windows Phone 8.x apps, this method behaves the same as [ShowEditNewAppointmentAsync](appointmentmanager_showeditnewappointmentasync_372535555.md), in that the fields in the Add Appointment UI are editable by the user.
     * @param {Appointment} appointment_ The object representing the information for the appointment to add.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Add Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Add Appointment UI displays around the button, not overlapping it.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.showaddappointmentasync
     */
    ShowAddAppointmentAsync(appointment_, selection) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.ShowAddAppointmentAsync(appointment_, selection)
    }

    /**
     * Shows the Appointments provider Replace Appointment UI, to enable the user to replace an appointment.
     * @param {HSTRING} localId The [LocalId](appointment_localid.md) of the appointment to be replaced.
     * @param {Appointment} appointment_ The object representing the appointment to replace the existing appointment.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Replace Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Replace Appointment UI displays around the button, not overlapping it.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.showreplaceappointmentasync
     */
    ShowReplaceAppointmentAsync(localId, appointment_, selection) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.ShowReplaceAppointmentAsync(localId, appointment_, selection)
    }

    /**
     * Shows the Appointments provider Replace Appointment UI, to enable the user to replace an appointment.
     * @param {HSTRING} localId The [LocalId](appointment_localid.md) of the appointment to be replaced.
     * @param {Appointment} appointment_ The object representing the appointment to replace the existing appointment.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Replace Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Replace Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.showreplaceappointmentasync
     */
    ShowReplaceAppointmentWithPlacementAndDateAsync(localId, appointment_, selection, preferredPlacement, instanceStartDate) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.ShowReplaceAppointmentWithPlacementAndDateAsync(localId, appointment_, selection, preferredPlacement, instanceStartDate)
    }

    /**
     * Shows the Appointments provider Remove Appointment UI, to enable the user to remove an appointment.
     * @param {HSTRING} localId The [LocalId](appointment_localid.md) of the appointment to be removed.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Remove Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Remove Appointment UI displays around the button, not overlapping it.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.showremoveappointmentasync
     */
    ShowRemoveAppointmentAsync(localId, selection) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.ShowRemoveAppointmentAsync(localId, selection)
    }

    /**
     * Shows the Appointments provider Remove Appointment UI, to enable the user to remove an appointment.
     * @param {HSTRING} localId The [LocalId](appointment_localid.md) of the appointment to be removed.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Remove Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Remove Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.showremoveappointmentasync
     */
    ShowRemoveAppointmentWithPlacementAndDateAsync(localId, selection, preferredPlacement, instanceStartDate) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.ShowRemoveAppointmentWithPlacementAndDateAsync(localId, selection, preferredPlacement, instanceStartDate)
    }

    /**
     * Shows the Appointments provider Appointment Details UI, to enable the user to view the specified appointment.
     * @param {HSTRING} localId The [LocalId](appointment_localid.md) of the appointment to be displayed.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.showappointmentdetailsasync
     */
    ShowAppointmentDetailsAsync(localId) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.ShowAppointmentDetailsAsync(localId)
    }

    /**
     * Shows the Appointments provider Appointment Details UI, to enable the user to view the specified appointment.
     * @param {HSTRING} localId The [LocalId](appointment_localid.md) of the appointment to be displayed.
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.showappointmentdetailsasync
     */
    ShowAppointmentDetailsWithDateAsync(localId, instanceStartDate) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.ShowAppointmentDetailsWithDateAsync(localId, instanceStartDate)
    }

    /**
     * Shows the Appointments provider Add Appointment UI including the full edit experience, to enable the user to add an appointment.
     * @param {Appointment} appointment_ The appointment to be added.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.showeditnewappointmentasync
     */
    ShowEditNewAppointmentAsync(appointment_) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.ShowEditNewAppointmentAsync(appointment_)
    }

    /**
     * Returns a list of [LocalId](appointment_localid.md) values for appointment instances with the specified [RoamingId](appointment_roamingid.md) value.
     * @param {HSTRING} roamingId The [RoamingId](appointment_roamingid.md) value for which local ID values are sought.
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.findlocalidsfromroamingidasync
     */
    FindLocalIdsFromRoamingIdAsync(roamingId) {
        if (!this.HasProp("__IAppointmentStore")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore := IAppointmentStore(outPtr)
        }

        return this.__IAppointmentStore.FindLocalIdsFromRoamingIdAsync(roamingId)
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentStore, AppointmentStoreChangedEventArgs>} pHandler 
     * @returns {EventRegistrationToken} 
     */
    add_StoreChanged(pHandler) {
        if (!this.HasProp("__IAppointmentStore2")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore2 := IAppointmentStore2(outPtr)
        }

        return this.__IAppointmentStore2.add_StoreChanged(pHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StoreChanged(token) {
        if (!this.HasProp("__IAppointmentStore2")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore2 := IAppointmentStore2(outPtr)
        }

        return this.__IAppointmentStore2.remove_StoreChanged(token)
    }

    /**
     * Asynchronously creates a new [AppointmentCalendar](appointmentcalendar.md) within the appointment store using the specified parameters.
     * @param {HSTRING} name The name for the new [AppointmentCalendar](appointmentcalendar.md).
     * @param {HSTRING} userDataAccountId 
     * @returns {IAsyncOperation<AppointmentCalendar>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.createappointmentcalendarasync
     */
    CreateAppointmentCalendarInAccountAsync(name, userDataAccountId) {
        if (!this.HasProp("__IAppointmentStore2")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore2 := IAppointmentStore2(outPtr)
        }

        return this.__IAppointmentStore2.CreateAppointmentCalendarInAccountAsync(name, userDataAccountId)
    }

    /**
     * Gets a [AppointmentStoreChangeTracker](appointmentstorechangetracker.md) that provides functionality for monitoring changes to [Appointment](appointment.md) objects in the [AppointmentStore](appointmentstore.md).
     * @remarks
     * You can create multiple [AppointmentStoreChangeTracker](appointmentstorechangetracker.md) instances by using this method. If you pass in a string that identifies a [AppointmentStoreChangeTracker](appointmentstorechangetracker.md) that already exists in the store, this method returns that instance. If the string that you pass into this method does not identify an existing an existing [AppointmentStoreChangeTracker](appointmentstorechangetracker.md), this method returns a new [AppointmentStoreChangeTracker](appointmentstorechangetracker.md).
     * 
     * You can use the [IsTracking](appointmentstorechangetracker_istracking.md) property of the [AppointmentStoreChangeTracker](appointmentstorechangetracker.md) to determine whether change tracking is enabled for the [AppointmentStoreChangeTracker](appointmentstorechangetracker.md).
     * @param {HSTRING} identity A string that identifies the [AppointmentStoreChangeTracker](appointmentstorechangetracker.md) instance in the store.
     * @returns {AppointmentStoreChangeTracker} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstore.getchangetracker
     */
    GetChangeTracker(identity) {
        if (!this.HasProp("__IAppointmentStore3")) {
            if ((queryResult := this.QueryInterface(IAppointmentStore3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStore3 := IAppointmentStore3(outPtr)
        }

        return this.__IAppointmentStore3.GetChangeTracker(identity)
    }

;@endregion Instance Methods
}
