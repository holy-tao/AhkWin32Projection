#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarSyncManager.ahk
#Include .\IAppointmentCalendarSyncManager2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppointmentCalendarSyncManager.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to sync functionality for an [AppointmentCalendar](appointmentcalendar.md) object.
 * @remarks
 * [AppointmentCalendar.SyncManager](appointmentcalendar_syncmanager.md) provides access to an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendarsyncmanager
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarSyncManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarSyncManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarSyncManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the current status of the [AppointmentCalendarSyncManager](appointmentcalendarsyncmanager.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendarsyncmanager.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * Gets or sets the last date and time that a sync with the [AppointmentCalendar](appointmentcalendar.md) server was successful.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendarsyncmanager.lastsuccessfulsynctime
     * @type {DateTime} 
     */
    LastSuccessfulSyncTime {
        get => this.get_LastSuccessfulSyncTime()
        set => this.put_LastSuccessfulSyncTime(value)
    }

    /**
     * Gets or sets the last date and time that a sync with the [AppointmentCalendar](appointmentcalendar.md) server was attempted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendarsyncmanager.lastattemptedsynctime
     * @type {DateTime} 
     */
    LastAttemptedSyncTime {
        get => this.get_LastAttemptedSyncTime()
        set => this.put_LastAttemptedSyncTime(value)
    }

    /**
     * Occurs when the status of an [AppointmentCalendar](appointmentcalendar.md) sync operation changes.
     * @type {TypedEventHandler<AppointmentCalendarSyncManager, IInspectable>}
    */
    OnSyncStatusChanged {
        get {
            if(!this.HasProp("__OnSyncStatusChanged")){
                this.__OnSyncStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bd1308de-6d2e-5541-b254-bdb61839bac1}"),
                    AppointmentCalendarSyncManager,
                    IInspectable
                )
                this.__OnSyncStatusChangedToken := this.add_SyncStatusChanged(this.__OnSyncStatusChanged.iface)
            }
            return this.__OnSyncStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSyncStatusChangedToken")) {
            this.remove_SyncStatusChanged(this.__OnSyncStatusChangedToken)
            this.__OnSyncStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAppointmentCalendarSyncManager")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManager := IAppointmentCalendarSyncManager(outPtr)
        }

        return this.__IAppointmentCalendarSyncManager.get_Status()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastSuccessfulSyncTime() {
        if (!this.HasProp("__IAppointmentCalendarSyncManager")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManager := IAppointmentCalendarSyncManager(outPtr)
        }

        return this.__IAppointmentCalendarSyncManager.get_LastSuccessfulSyncTime()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastAttemptedSyncTime() {
        if (!this.HasProp("__IAppointmentCalendarSyncManager")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManager := IAppointmentCalendarSyncManager(outPtr)
        }

        return this.__IAppointmentCalendarSyncManager.get_LastAttemptedSyncTime()
    }

    /**
     * Initiates a sync operation on the [AppointmentCalendar](appointmentcalendar.md).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendarsyncmanager.syncasync
     */
    SyncAsync() {
        if (!this.HasProp("__IAppointmentCalendarSyncManager")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManager := IAppointmentCalendarSyncManager(outPtr)
        }

        return this.__IAppointmentCalendarSyncManager.SyncAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentCalendarSyncManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SyncStatusChanged(handler) {
        if (!this.HasProp("__IAppointmentCalendarSyncManager")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManager := IAppointmentCalendarSyncManager(outPtr)
        }

        return this.__IAppointmentCalendarSyncManager.add_SyncStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SyncStatusChanged(token) {
        if (!this.HasProp("__IAppointmentCalendarSyncManager")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManager := IAppointmentCalendarSyncManager(outPtr)
        }

        return this.__IAppointmentCalendarSyncManager.remove_SyncStatusChanged(token)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IAppointmentCalendarSyncManager2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManager2 := IAppointmentCalendarSyncManager2(outPtr)
        }

        return this.__IAppointmentCalendarSyncManager2.put_Status(value)
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastSuccessfulSyncTime(value) {
        if (!this.HasProp("__IAppointmentCalendarSyncManager2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManager2 := IAppointmentCalendarSyncManager2(outPtr)
        }

        return this.__IAppointmentCalendarSyncManager2.put_LastSuccessfulSyncTime(value)
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastAttemptedSyncTime(value) {
        if (!this.HasProp("__IAppointmentCalendarSyncManager2")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarSyncManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarSyncManager2 := IAppointmentCalendarSyncManager2(outPtr)
        }

        return this.__IAppointmentCalendarSyncManager2.put_LastAttemptedSyncTime(value)
    }

;@endregion Instance Methods
}
