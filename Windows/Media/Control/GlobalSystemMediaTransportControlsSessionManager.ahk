#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGlobalSystemMediaTransportControlsSessionManager.ahk
#Include .\IGlobalSystemMediaTransportControlsSessionManagerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\GlobalSystemMediaTransportControlsSessionManager.ahk
#Include .\CurrentSessionChangedEventArgs.ahk
#Include .\SessionsChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to playback sessions throughout the system that have integrated with SystemMediaTransportControls to provide playback info and allow remote control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmanager
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class GlobalSystemMediaTransportControlsSessionManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGlobalSystemMediaTransportControlsSessionManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGlobalSystemMediaTransportControlsSessionManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Requests an instance of the GlobalSystemMediaTransportControlsSessionManager.
     * @returns {IAsyncOperation<GlobalSystemMediaTransportControlsSessionManager>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmanager.requestasync
     */
    static RequestAsync() {
        if (!GlobalSystemMediaTransportControlsSessionManager.HasProp("__IGlobalSystemMediaTransportControlsSessionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Control.GlobalSystemMediaTransportControlsSessionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlobalSystemMediaTransportControlsSessionManagerStatics.IID)
            GlobalSystemMediaTransportControlsSessionManager.__IGlobalSystemMediaTransportControlsSessionManagerStatics := IGlobalSystemMediaTransportControlsSessionManagerStatics(factoryPtr)
        }

        return GlobalSystemMediaTransportControlsSessionManager.__IGlobalSystemMediaTransportControlsSessionManagerStatics.RequestAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCurrentSessionChangedToken")) {
            this.remove_CurrentSessionChanged(this.__OnCurrentSessionChangedToken)
            this.__OnCurrentSessionChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSessionsChangedToken")) {
            this.remove_SessionsChanged(this.__OnSessionsChangedToken)
            this.__OnSessionsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Gets the current session. This is the session the system believes the user would most likely want to control.
     * @returns {GlobalSystemMediaTransportControlsSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmanager.getcurrentsession
     */
    GetCurrentSession() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionManager")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionManager := IGlobalSystemMediaTransportControlsSessionManager(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionManager.GetCurrentSession()
    }

    /**
     * Gets all of the available sessions.
     * @returns {IVectorView<GlobalSystemMediaTransportControlsSession>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmanager.getsessions
     */
    GetSessions() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionManager")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionManager := IGlobalSystemMediaTransportControlsSessionManager(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionManager.GetSessions()
    }

    /**
     * 
     * @param {TypedEventHandler<GlobalSystemMediaTransportControlsSessionManager, CurrentSessionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentSessionChanged(handler) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionManager")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionManager := IGlobalSystemMediaTransportControlsSessionManager(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionManager.add_CurrentSessionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentSessionChanged(token) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionManager")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionManager := IGlobalSystemMediaTransportControlsSessionManager(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionManager.remove_CurrentSessionChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GlobalSystemMediaTransportControlsSessionManager, SessionsChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionsChanged(handler) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionManager")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionManager := IGlobalSystemMediaTransportControlsSessionManager(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionManager.add_SessionsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SessionsChanged(token) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionManager")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionManager := IGlobalSystemMediaTransportControlsSessionManager(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionManager.remove_SessionsChanged(token)
    }

;@endregion Instance Methods
}
