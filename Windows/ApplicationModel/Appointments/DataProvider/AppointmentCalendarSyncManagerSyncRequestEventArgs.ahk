#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarSyncManagerSyncRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for a [SyncRequested](appointmentdataproviderconnection_syncrequested.md) event.
 * @remarks
 * The system generates an instance of this class and passes it as an argument to the application's [SyncRequested](appointmentdataproviderconnection_syncrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarsyncmanagersyncrequesteventargs
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarSyncManagerSyncRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarSyncManagerSyncRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarSyncManagerSyncRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [AppointmentCalendarSyncManagerSyncRequest](appointmentcalendarsyncmanagersyncrequest.md) object for the corresponding [SyncRequested](appointmentdataproviderconnection_syncrequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarsyncmanagersyncrequesteventargs.request
     * @type {AppointmentCalendarSyncManagerSyncRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppointmentCalendarSyncManagerSyncRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IAppointmentCalendarSyncManagerSyncRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManagerSyncRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManagerSyncRequestEventArgs := IAppointmentCalendarSyncManagerSyncRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarSyncManagerSyncRequestEventArgs.get_Request()
    }

    /**
     * Gets the deferral object for the [SyncRequested](appointmentdataproviderconnection_syncrequested.md) event.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarsyncmanagersyncrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IAppointmentCalendarSyncManagerSyncRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManagerSyncRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManagerSyncRequestEventArgs := IAppointmentCalendarSyncManagerSyncRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarSyncManagerSyncRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
