#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentDataProviderConnection.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\AppointmentDataProviderConnection.ahk
#Include .\AppointmentCalendarSyncManagerSyncRequestEventArgs.ahk
#Include .\AppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs.ahk
#Include .\AppointmentCalendarCancelMeetingRequestEventArgs.ahk
#Include .\AppointmentCalendarForwardMeetingRequestEventArgs.ahk
#Include .\AppointmentCalendarProposeNewTimeForMeetingRequestEventArgs.ahk
#Include .\AppointmentCalendarUpdateMeetingResponseRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Describes a connection between app and system for relaying calendar appointment information.
 * @remarks
 * This class is instantiated by getting the [Connection](appointmentdataprovidertriggerdetails_connection.md) property of the [AppointmentDataProviderTriggerDetails](appointmentdataprovidertriggerdetails.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentdataproviderconnection
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentDataProviderConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentDataProviderConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentDataProviderConnection.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSyncRequestedToken")) {
            this.remove_SyncRequested(this.__OnSyncRequestedToken)
            this.__OnSyncRequested.iface.Dispose()
        }

        if(this.HasProp("__OnCreateOrUpdateAppointmentRequestedToken")) {
            this.remove_CreateOrUpdateAppointmentRequested(this.__OnCreateOrUpdateAppointmentRequestedToken)
            this.__OnCreateOrUpdateAppointmentRequested.iface.Dispose()
        }

        if(this.HasProp("__OnCancelMeetingRequestedToken")) {
            this.remove_CancelMeetingRequested(this.__OnCancelMeetingRequestedToken)
            this.__OnCancelMeetingRequested.iface.Dispose()
        }

        if(this.HasProp("__OnForwardMeetingRequestedToken")) {
            this.remove_ForwardMeetingRequested(this.__OnForwardMeetingRequestedToken)
            this.__OnForwardMeetingRequested.iface.Dispose()
        }

        if(this.HasProp("__OnProposeNewTimeForMeetingRequestedToken")) {
            this.remove_ProposeNewTimeForMeetingRequested(this.__OnProposeNewTimeForMeetingRequestedToken)
            this.__OnProposeNewTimeForMeetingRequested.iface.Dispose()
        }

        if(this.HasProp("__OnUpdateMeetingResponseRequestedToken")) {
            this.remove_UpdateMeetingResponseRequested(this.__OnUpdateMeetingResponseRequestedToken)
            this.__OnUpdateMeetingResponseRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarSyncManagerSyncRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SyncRequested(handler) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.add_SyncRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SyncRequested(token) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.remove_SyncRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CreateOrUpdateAppointmentRequested(handler) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.add_CreateOrUpdateAppointmentRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CreateOrUpdateAppointmentRequested(token) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.remove_CreateOrUpdateAppointmentRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarCancelMeetingRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CancelMeetingRequested(handler) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.add_CancelMeetingRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CancelMeetingRequested(token) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.remove_CancelMeetingRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarForwardMeetingRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ForwardMeetingRequested(handler) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.add_ForwardMeetingRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ForwardMeetingRequested(token) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.remove_ForwardMeetingRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarProposeNewTimeForMeetingRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProposeNewTimeForMeetingRequested(handler) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.add_ProposeNewTimeForMeetingRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ProposeNewTimeForMeetingRequested(token) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.remove_ProposeNewTimeForMeetingRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarUpdateMeetingResponseRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UpdateMeetingResponseRequested(handler) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.add_UpdateMeetingResponseRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UpdateMeetingResponseRequested(token) {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.remove_UpdateMeetingResponseRequested(token)
    }

    /**
     * Starts the connection for transfer of data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentdataproviderconnection.start
     */
    Start() {
        if (!this.HasProp("__IAppointmentDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderConnection := IAppointmentDataProviderConnection(outPtr)
        }

        return this.__IAppointmentDataProviderConnection.Start()
    }

;@endregion Instance Methods
}
