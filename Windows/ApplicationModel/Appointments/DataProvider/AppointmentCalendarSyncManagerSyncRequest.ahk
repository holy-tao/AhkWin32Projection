#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarSyncManagerSyncRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the user's request to sync the calendar.
 * @remarks
 * The system generates an instance of this class and sets it as a property in the [AppointmentCalendarSyncManagerSyncRequestEventArgs](appointmentcalendarsyncmanagersyncrequesteventargs.md) argument of the [SyncRequested](appointmentdataproviderconnection_syncrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarsyncmanagersyncrequest
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarSyncManagerSyncRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarSyncManagerSyncRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarSyncManagerSyncRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a string that uniquely identifies the calendar associated with the appointment on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarsyncmanagersyncrequest.appointmentcalendarlocalid
     * @type {HSTRING} 
     */
    AppointmentCalendarLocalId {
        get => this.get_AppointmentCalendarLocalId()
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
        if (!this.HasProp("__IAppointmentCalendarSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManagerSyncRequest := IAppointmentCalendarSyncManagerSyncRequest(outPtr)
        }

        return this.__IAppointmentCalendarSyncManagerSyncRequest.get_AppointmentCalendarLocalId()
    }

    /**
     * Notifies the system that the task of syncing the calendar has completed.
     * @remarks
     * This method should be called only if the app has successfully synced the calendar.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarsyncmanagersyncrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IAppointmentCalendarSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManagerSyncRequest := IAppointmentCalendarSyncManagerSyncRequest(outPtr)
        }

        return this.__IAppointmentCalendarSyncManagerSyncRequest.ReportCompletedAsync()
    }

    /**
     * Notifies the system that the task of syncing the calendar has failed.
     * @remarks
     * This method should be called only if the app has failed to sync the calendar.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarsyncmanagersyncrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IAppointmentCalendarSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManagerSyncRequest := IAppointmentCalendarSyncManagerSyncRequest(outPtr)
        }

        return this.__IAppointmentCalendarSyncManagerSyncRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
