#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentManagerStatics2.ahk
#Include .\IAppointmentManagerStatics.ahk
#Include .\IAppointmentManagerStatics3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides API to interact with the user’s Appointments provider app (for example, the Calendar app). Call static methods to display provider-specific UI so that the user can perform tasks.
 * @remarks
 * For info about how to manage appointments, see [Managing appointments](/windows/uwp/contacts-and-calendar/managing-appointments) and [Quickstart: Managing appointments](/previous-versions/windows/apps/dn495338(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentManager extends IInspectable {
;@region Static Methods
    /**
     * Shows the Appointments provider Appointment Details UI, to enable the user to view the specified appointment.
     * @param {HSTRING} appointmentId The [LocalId](appointment_localid.md) of the appointment to be displayed.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showappointmentdetailsasync
     */
    static ShowAppointmentDetailsAsync(appointmentId) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics2.IID)
            AppointmentManager.__IAppointmentManagerStatics2 := IAppointmentManagerStatics2(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics2.ShowAppointmentDetailsAsync(appointmentId)
    }

    /**
     * Shows the Appointments provider Appointment Details UI, to enable the user to view the specified appointment.
     * @param {HSTRING} appointmentId The [LocalId](appointment_localid.md) of the appointment to be displayed.
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showappointmentdetailsasync
     */
    static ShowAppointmentDetailsWithDateAsync(appointmentId, instanceStartDate) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics2.IID)
            AppointmentManager.__IAppointmentManagerStatics2 := IAppointmentManagerStatics2(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics2.ShowAppointmentDetailsWithDateAsync(appointmentId, instanceStartDate)
    }

    /**
     * Shows the Appointments provider Add Appointment UI including the full edit experience, to enable the user to add an appointment.
     * @param {Appointment} appointment_ The appointment to be added.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showeditnewappointmentasync
     */
    static ShowEditNewAppointmentAsync(appointment_) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics2.IID)
            AppointmentManager.__IAppointmentManagerStatics2 := IAppointmentManagerStatics2(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics2.ShowEditNewAppointmentAsync(appointment_)
    }

    /**
     * Requests the [AppointmentStore](appointmentstore.md) object associated with the calling application.
     * @param {Integer} options An [AppointmentStoreAccessType](appointmentstoreaccesstype.md) value indicating the level of access the returned appointment store will have.
     * @returns {IAsyncOperation<AppointmentStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.requeststoreasync
     */
    static RequestStoreAsync(options) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics2.IID)
            AppointmentManager.__IAppointmentManagerStatics2 := IAppointmentManagerStatics2(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics2.RequestStoreAsync(options)
    }

    /**
     * Shows the Appointments provider Add Appointment UI, to enable the user to add an appointment.
     * @remarks
     * See the remarks in the following overload: [ShowAddAppointmentAsync](appointmentmanager_showaddappointmentasync_92599717.md).
     * @param {Appointment} appointment_ The object representing the information for the appointment to add.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Add Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Add Appointment UI displays around the button, not overlapping it.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showaddappointmentasync
     */
    static ShowAddAppointmentAsync(appointment_, selection) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics.IID)
            AppointmentManager.__IAppointmentManagerStatics := IAppointmentManagerStatics(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics.ShowAddAppointmentAsync(appointment_, selection)
    }

    /**
     * Shows the Appointments provider Add Appointment UI, to enable the user to add an appointment.
     * @remarks
     * When you call this method, the Appointment provider app displays in a light-dismiss pane that is hosted by your app.
     * 
     * > On Windows Phone, this method behaves the same as [ShowEditNewAppointmentAsync](appointmentmanager_showeditnewappointmentasync_372535555.md), in that the fields in the Add Appointment UI are editable by the user.
     * 
     * For info about how to manage appointments, see [Manage appointments](/windows/uwp/contacts-and-calendar/managing-appointments).
     * @param {Appointment} appointment_ The object representing the information for the appointment to add.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Add Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Add Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement 
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showaddappointmentasync
     */
    static ShowAddAppointmentWithPlacementAsync(appointment_, selection, preferredPlacement) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics.IID)
            AppointmentManager.__IAppointmentManagerStatics := IAppointmentManagerStatics(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics.ShowAddAppointmentWithPlacementAsync(appointment_, selection, preferredPlacement)
    }

    /**
     * Shows the Appointments provider Replace Appointment UI, to enable the user to replace an appointment.
     * @param {HSTRING} appointmentId The appointment identifier of the current appointment. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanager_showaddappointmentasync_253292089.md) or [ShowReplaceAppointmentAsync](appointmentmanager_showreplaceappointmentasync_1336777815.md) call.
     * @param {Appointment} appointment_ The object representing the information for the appointment to replace the current appointment.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Replace Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Replace Appointment UI displays around the button, not overlapping it.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showreplaceappointmentasync
     */
    static ShowReplaceAppointmentAsync(appointmentId, appointment_, selection) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics.IID)
            AppointmentManager.__IAppointmentManagerStatics := IAppointmentManagerStatics(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics.ShowReplaceAppointmentAsync(appointmentId, appointment_, selection)
    }

    /**
     * Shows the Appointments provider Replace Appointment UI, to enable the user to replace an appointment.
     * @param {HSTRING} appointmentId The appointment identifier of the current appointment. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanager_showaddappointmentasync_253292089.md) or [ShowReplaceAppointmentAsync](appointmentmanager_showreplaceappointmentasync_1336777815.md) call.
     * @param {Appointment} appointment_ The object representing the information for the appointment to replace the current appointment.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Replace Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Replace Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement The [Placement](../windows.ui.popups/placement.md) that describes the preferred placement of the Replace Appointment UI.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showreplaceappointmentasync
     */
    static ShowReplaceAppointmentWithPlacementAsync(appointmentId, appointment_, selection, preferredPlacement) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics.IID)
            AppointmentManager.__IAppointmentManagerStatics := IAppointmentManagerStatics(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics.ShowReplaceAppointmentWithPlacementAsync(appointmentId, appointment_, selection, preferredPlacement)
    }

    /**
     * Shows the Appointments provider Replace Appointment UI, to enable the user to replace an appointment.
     * @param {HSTRING} appointmentId The appointment identifier of the current appointment. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanager_showaddappointmentasync_253292089.md) or ShowReplaceAppointmentAsync call.
     * @param {Appointment} appointment_ The object representing the information for the appointment to replace the current appointment.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Replace Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Replace Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showreplaceappointmentasync
     */
    static ShowReplaceAppointmentWithPlacementAndDateAsync(appointmentId, appointment_, selection, preferredPlacement, instanceStartDate) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics.IID)
            AppointmentManager.__IAppointmentManagerStatics := IAppointmentManagerStatics(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics.ShowReplaceAppointmentWithPlacementAndDateAsync(appointmentId, appointment_, selection, preferredPlacement, instanceStartDate)
    }

    /**
     * Shows the Appointments provider Remove Appointment UI, to enable the user to remove an appointment.
     * @remarks
     * See the remarks section of this overload: [ShowRemoveAppointmentAsync](appointmentmanager_showremoveappointmentasync_1734575458.md).
     * @param {HSTRING} appointmentId The appointment identifier. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanager_showaddappointmentasync_253292089.md) call.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Remove Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Remove Appointment UI displays around the button, not overlapping it.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showremoveappointmentasync
     */
    static ShowRemoveAppointmentAsync(appointmentId, selection) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics.IID)
            AppointmentManager.__IAppointmentManagerStatics := IAppointmentManagerStatics(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics.ShowRemoveAppointmentAsync(appointmentId, selection)
    }

    /**
     * Shows the Appointments provider Remove Appointment UI, to enable the user to remove an appointment.
     * @remarks
     * See the remarks section of this overload: [ShowRemoveAppointmentAsync](appointmentmanager_showremoveappointmentasync_1734575458.md).
     * @param {HSTRING} appointmentId The appointment identifier. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanager_showaddappointmentasync_253292089.md) call.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Remove Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Remove Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement The [Placement](../windows.ui.popups/placement.md) that describes the preferred placement of the Remove Appointment UI.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showremoveappointmentasync
     */
    static ShowRemoveAppointmentWithPlacementAsync(appointmentId, selection, preferredPlacement) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics.IID)
            AppointmentManager.__IAppointmentManagerStatics := IAppointmentManagerStatics(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics.ShowRemoveAppointmentWithPlacementAsync(appointmentId, selection, preferredPlacement)
    }

    /**
     * Shows the Appointments provider Remove Appointment UI, to enable the user to remove an appointment.
     * @remarks
     * When you call this method, the Appointment provider app displays in a light-dismiss pane that is hosted by your app.
     * 
     * This method may return false, even when the appointment was successfully removed.
     * 
     * For info about how to manage appointments, see [Manage appointments](/windows/uwp/contacts-and-calendar/managing-appointments).
     * @param {HSTRING} appointmentId The appointment identifier. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanager_showaddappointmentasync_253292089.md) call.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Remove Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Remove Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showremoveappointmentasync
     */
    static ShowRemoveAppointmentWithPlacementAndDateAsync(appointmentId, selection, preferredPlacement, instanceStartDate) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics.IID)
            AppointmentManager.__IAppointmentManagerStatics := IAppointmentManagerStatics(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics.ShowRemoveAppointmentWithPlacementAndDateAsync(appointmentId, selection, preferredPlacement, instanceStartDate)
    }

    /**
     * Shows the Appointments provider app's primary UI. This typically displays a time frame from an appointments calendar.
     * @remarks
     * This method uses parameter values representing date-time and timespan that are represented differently depending on which language you are programming with.
     * + In JavaScript, set the *timeToShow* value with a **Date** object. Set the *duration* value with a [TimeSpan](../windows.foundation/timespan.md) representing a time span in 100-nanosecond units.
     * + In Visual C++ component extensions (C++/CX), set the *timeToShow* value with a [DateTime](../windows.foundation/datetime.md) structure. Set the *duration* value with a [TimeSpan](../windows.foundation/timespan.md) representing a time span in 100-nanosecond units.
     * + In C#, use a [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) value for *timeToShow*, and a [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) value for *duration*. You can use utility API of these structures to declare the values.
     * 
     * 
     * For info about how to manage appointments, see [Manage appointments](/windows/uwp/contacts-and-calendar/managing-appointments).
     * @param {DateTime} timeToShow A date and time object that specifies the beginning of the time frame that the Appointments provider app should display.
     * @param {TimeSpan} duration_ A timespan that hints to the Appointments provider app how long the time frame shown should be.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showtimeframeasync
     */
    static ShowTimeFrameAsync(timeToShow, duration_) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics.IID)
            AppointmentManager.__IAppointmentManagerStatics := IAppointmentManagerStatics(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics.ShowTimeFrameAsync(timeToShow, duration_)
    }

    /**
     * Gets the [AppointmentManagerForUser](appointmentmanagerforuser.md) object for the specified user.
     * @param {User} user_ The user account to use to get the [AppointmentManagerForUser](appointmentmanagerforuser.md) object.
     * @returns {AppointmentManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanager.getforuser
     */
    static GetForUser(user_) {
        if (!AppointmentManager.HasProp("__IAppointmentManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentManagerStatics3.IID)
            AppointmentManager.__IAppointmentManagerStatics3 := IAppointmentManagerStatics3(factoryPtr)
        }

        return AppointmentManager.__IAppointmentManagerStatics3.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
