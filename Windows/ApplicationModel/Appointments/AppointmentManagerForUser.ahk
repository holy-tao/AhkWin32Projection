#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentManagerForUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an appointment manager for a specific user.
 * @remarks
 * Call the [AppointmentManager.GetForUser](appointmentmanager_getforuser_2058550280.md) method to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentManagerForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentManagerForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentManagerForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [User](../windows.system/user.md) represented by this appointment manager.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Shows the Appointments provider Add Appointment UI, to enable the user to add an appointment.
     * @remarks
     * When you call this method, the Appointment provider app displays in a light-dismiss pane that is hosted by your app.
     * 
     * > On Windows Phone, this method behaves the same as [ShowEditNewAppointmentAsync](appointmentmanagerforuser_showeditnewappointmentasync_372535555.md), in that the fields in the Add Appointment UI are editable by the user.
     * @param {Appointment} appointment_ The object representing the information for the appointment to add.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Add Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Add Appointment UI displays around the button, not overlapping it.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showaddappointmentasync
     */
    ShowAddAppointmentAsync(appointment_, selection) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowAddAppointmentAsync(appointment_, selection)
    }

    /**
     * Shows the Appointments provider Add Appointment UI, to enable the user to add an appointment.
     * @remarks
     * When you call this method, the Appointment provider app displays in a light-dismiss pane that is hosted by your app.
     * 
     * > On Windows Phone, this method behaves the same as [ShowEditNewAppointmentAsync](appointmentmanagerforuser_showeditnewappointmentasync_372535555.md), in that the fields in the Add Appointment UI are editable by the user.
     * @param {Appointment} appointment_ The object representing the information for the appointment to add.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Add Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Add Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement 
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showaddappointmentasync
     */
    ShowAddAppointmentWithPlacementAsync(appointment_, selection, preferredPlacement) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowAddAppointmentWithPlacementAsync(appointment_, selection, preferredPlacement)
    }

    /**
     * Shows the Appointments provider Replace Appointment UI, to enable the user to replace an appointment.
     * @param {HSTRING} appointmentId The appointment identifier of the current appointment. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanagerforuser_showaddappointmentasync_253292089.md) or [ShowReplaceAppointmentAsync](appointmentmanagerforuser_showreplaceappointmentasync_1336777815.md) call.
     * @param {Appointment} appointment_ The object representing the information for the appointment to replace the current appointment.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Replace Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Replace Appointment UI displays around the button, not overlapping it.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showreplaceappointmentasync
     */
    ShowReplaceAppointmentAsync(appointmentId, appointment_, selection) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowReplaceAppointmentAsync(appointmentId, appointment_, selection)
    }

    /**
     * Shows the Appointments provider Replace Appointment UI, to enable the user to replace an appointment.
     * @param {HSTRING} appointmentId The appointment identifier of the current appointment. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanagerforuser_showaddappointmentasync_253292089.md) or [ShowReplaceAppointmentAsync](appointmentmanagerforuser_showreplaceappointmentasync_1336777815.md) call.
     * @param {Appointment} appointment_ The object representing the information for the appointment to replace the current appointment.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Replace Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Replace Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement The [Placement](../windows.ui.popups/placement.md) that describes the preferred placement of the Replace Appointment UI.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showreplaceappointmentasync
     */
    ShowReplaceAppointmentWithPlacementAsync(appointmentId, appointment_, selection, preferredPlacement) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowReplaceAppointmentWithPlacementAsync(appointmentId, appointment_, selection, preferredPlacement)
    }

    /**
     * Shows the Appointments provider Replace Appointment UI, to enable the user to replace an appointment.
     * @param {HSTRING} appointmentId The appointment identifier of the current appointment. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanagerforuser_showaddappointmentasync_253292089.md) or ShowReplaceAppointmentAsync call.
     * @param {Appointment} appointment_ The object representing the information for the appointment to replace the current appointment.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Replace Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Replace Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showreplaceappointmentasync
     */
    ShowReplaceAppointmentWithPlacementAndDateAsync(appointmentId, appointment_, selection, preferredPlacement, instanceStartDate) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowReplaceAppointmentWithPlacementAndDateAsync(appointmentId, appointment_, selection, preferredPlacement, instanceStartDate)
    }

    /**
     * Shows the Appointments provider Remove Appointment UI, to enable the user to remove an appointment.
     * @remarks
     * When you call this method, the Appointment provider app displays in a light-dismiss pane that is hosted by your app.
     * 
     * This method may return false, even when the appointment was successfully removed.
     * @param {HSTRING} appointmentId The appointment identifier. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanagerforuser_showaddappointmentasync_253292089.md) call.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Remove Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Remove Appointment UI displays around the button, not overlapping it.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showremoveappointmentasync
     */
    ShowRemoveAppointmentAsync(appointmentId, selection) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowRemoveAppointmentAsync(appointmentId, selection)
    }

    /**
     * Shows the Appointments provider Remove Appointment UI, to enable the user to remove an appointment.
     * @remarks
     * When you call this method, the Appointment provider app displays in a light-dismiss pane that is hosted by your app.
     * 
     * This method may return false, even when the appointment was successfully removed.
     * @param {HSTRING} appointmentId The appointment identifier. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanagerforuser_showaddappointmentasync_253292089.md) call.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Remove Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Remove Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement The [Placement](../windows.ui.popups/placement.md) that describes the preferred placement of the Remove Appointment UI.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showremoveappointmentasync
     */
    ShowRemoveAppointmentWithPlacementAsync(appointmentId, selection, preferredPlacement) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowRemoveAppointmentWithPlacementAsync(appointmentId, selection, preferredPlacement)
    }

    /**
     * Shows the Appointments provider Remove Appointment UI, to enable the user to remove an appointment.
     * @remarks
     * When you call this method, the Appointment provider app displays in a light-dismiss pane that is hosted by your app.
     * 
     * This method may return false, even when the appointment was successfully removed.
     * @param {HSTRING} appointmentId The appointment identifier. This is typically obtained from the async return value of a previous [ShowAddAppointmentAsync](appointmentmanagerforuser_showaddappointmentasync_253292089.md) call.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the Remove Appointment UI, not within that rectangular area. For example, if an app uses a button to show the [Rect](../windows.foundation/rect.md), pass the [Rect](../windows.foundation/rect.md) of the button so the Remove Appointment UI displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showremoveappointmentasync
     */
    ShowRemoveAppointmentWithPlacementAndDateAsync(appointmentId, selection, preferredPlacement, instanceStartDate) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowRemoveAppointmentWithPlacementAndDateAsync(appointmentId, selection, preferredPlacement, instanceStartDate)
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showtimeframeasync
     */
    ShowTimeFrameAsync(timeToShow, duration_) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowTimeFrameAsync(timeToShow, duration_)
    }

    /**
     * Shows the Appointments provider Appointment Details UI, to enable the user to view the specified appointment.
     * @param {HSTRING} appointmentId The [LocalId](appointment_localid.md) of the appointment to be displayed.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showappointmentdetailsasync
     */
    ShowAppointmentDetailsAsync(appointmentId) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowAppointmentDetailsAsync(appointmentId)
    }

    /**
     * Shows the Appointments provider Appointment Details UI, to enable the user to view the specified appointment.
     * @param {HSTRING} appointmentId The [LocalId](appointment_localid.md) of the appointment to be displayed.
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showappointmentdetailsasync
     */
    ShowAppointmentDetailsWithDateAsync(appointmentId, instanceStartDate) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowAppointmentDetailsWithDateAsync(appointmentId, instanceStartDate)
    }

    /**
     * Shows the Appointments provider Add Appointment UI including the full edit experience, to enable the user to add an appointment.
     * @param {Appointment} appointment_ The new appointment to be added.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.showeditnewappointmentasync
     */
    ShowEditNewAppointmentAsync(appointment_) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.ShowEditNewAppointmentAsync(appointment_)
    }

    /**
     * Retrieves an [AppointmentStore](appointmentstore.md) object that enables searching or retrieving appointments on the device.
     * @param {Integer} options Specifies the type of read/write access requested.
     * @returns {IAsyncOperation<AppointmentStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentmanagerforuser.requeststoreasync
     */
    RequestStoreAsync(options) {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.RequestStoreAsync(options)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IAppointmentManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAppointmentManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentManagerForUser := IAppointmentManagerForUser(outPtr)
        }

        return this.__IAppointmentManagerForUser.get_User()
    }

;@endregion Instance Methods
}
