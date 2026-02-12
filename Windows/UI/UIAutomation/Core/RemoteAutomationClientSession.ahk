#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteAutomationClientSession.ahk
#Include .\IRemoteAutomationClientSessionFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\RemoteAutomationClientSession.ahk
#Include .\RemoteAutomationConnectionRequestedEventArgs.ahk
#Include .\RemoteAutomationDisconnectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a UI Automation client session for a remote application.
 * @remarks
 * This class is used by a host application (such as the remote desktop app running on the local machine) to plug in and implement named pipe sharing with a remote session (container or network). The host application would implement [ConnectionRequested](remoteautomationclientsession_connectionrequested.md)/[Disconnected](remoteautomationclientsession_disconnected.md) callbacks to share the named pipe, then start/stop the client session to enable/disable those callbacks.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationclientsession
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class RemoteAutomationClientSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteAutomationClientSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteAutomationClientSession.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [RemoteAutomationClientSession](remoteautomationclientsession.md) class using the supplied name.
     * @remarks
     * Used by remote application hosts to specify details of a remote connection and manage connections to the remote application.
     * 
     * The sessionId GUID is generated internally at runtime when this constructor is used.
     * @param {HSTRING} name The name of the remote machine. Currently not used.
     * @returns {RemoteAutomationClientSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationclientsession.#ctor
     */
    static CreateInstance(name) {
        if (!RemoteAutomationClientSession.HasProp("__IRemoteAutomationClientSessionFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.UIAutomation.Core.RemoteAutomationClientSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteAutomationClientSessionFactory.IID)
            RemoteAutomationClientSession.__IRemoteAutomationClientSessionFactory := IRemoteAutomationClientSessionFactory(factoryPtr)
        }

        return RemoteAutomationClientSession.__IRemoteAutomationClientSessionFactory.CreateInstance(name)
    }

    /**
     * Initializes a new instance of the [RemoteAutomationClientSession](remoteautomationclientsession.md) class using the supplied parameters.
     * @remarks
     * Used by remote application hosts to specify details of a remote connection and manage connections to the remote application.
     * @param {HSTRING} name The name of the remote machine. Currently not used.
     * @param {Guid} sessionId The unique identifier of the remote machine.
     * @returns {RemoteAutomationClientSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationclientsession.#ctor
     */
    static CreateInstance2(name, sessionId) {
        if (!RemoteAutomationClientSession.HasProp("__IRemoteAutomationClientSessionFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.UIAutomation.Core.RemoteAutomationClientSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteAutomationClientSessionFactory.IID)
            RemoteAutomationClientSession.__IRemoteAutomationClientSessionFactory := IRemoteAutomationClientSessionFactory(factoryPtr)
        }

        return RemoteAutomationClientSession.__IRemoteAutomationClientSessionFactory.CreateInstance2(name, sessionId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the unique identifier of the [RemoteAutomationClientSession](remoteautomationclientsession.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationclientsession.sessionid
     * @type {Guid} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * Occurs when a connection to a remote system is requested.
     * @remarks
     * Enables a host app to register a callback that is invoked when a connection to a remote provider (sharing a named pipe) is needed.
     * @type {TypedEventHandler<RemoteAutomationClientSession, RemoteAutomationConnectionRequestedEventArgs>}
    */
    OnConnectionRequested {
        get {
            if(!this.HasProp("__OnConnectionRequested")){
                this.__OnConnectionRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1b0eb0d9-b29b-52f6-9d79-fffe5a280299}"),
                    RemoteAutomationClientSession,
                    RemoteAutomationConnectionRequestedEventArgs
                )
                this.__OnConnectionRequestedToken := this.add_ConnectionRequested(this.__OnConnectionRequested.iface)
            }
            return this.__OnConnectionRequested
        }
    }

    /**
     * Occurs when the [RemoteAutomationClientSession](remoteautomationclientsession.md) is disconnected.
     * @remarks
     * Enables a host app to register a callback that is invoked when a connection to a remote provider (sharing a named pipe) is to be closed.
     * @type {TypedEventHandler<RemoteAutomationClientSession, RemoteAutomationDisconnectedEventArgs>}
    */
    OnDisconnected {
        get {
            if(!this.HasProp("__OnDisconnected")){
                this.__OnDisconnected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7007e98a-48ed-52c8-a5b9-e1918b3f2709}"),
                    RemoteAutomationClientSession,
                    RemoteAutomationDisconnectedEventArgs
                )
                this.__OnDisconnectedToken := this.add_Disconnected(this.__OnDisconnected.iface)
            }
            return this.__OnDisconnected
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnConnectionRequestedToken")) {
            this.remove_ConnectionRequested(this.__OnConnectionRequestedToken)
            this.__OnConnectionRequested.iface.Dispose()
        }

        if(this.HasProp("__OnDisconnectedToken")) {
            this.remove_Disconnected(this.__OnDisconnectedToken)
            this.__OnDisconnected.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Begins the [RemoteAutomationClientSession](remoteautomationclientsession.md), enabling a UI Automation client to create connections to the remote session.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationclientsession.start
     */
    Start() {
        if (!this.HasProp("__IRemoteAutomationClientSession")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationClientSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationClientSession := IRemoteAutomationClientSession(outPtr)
        }

        return this.__IRemoteAutomationClientSession.Start()
    }

    /**
     * Terminates the current [RemoteAutomationClientSession](remoteautomationclientsession.md).
     * @remarks
     * New connections to the remote session cannot be made, but existing ones might still persist until disconnected.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationclientsession.stop
     */
    Stop() {
        if (!this.HasProp("__IRemoteAutomationClientSession")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationClientSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationClientSession := IRemoteAutomationClientSession(outPtr)
        }

        return this.__IRemoteAutomationClientSession.Stop()
    }

    /**
     * Creates a parent-child relationship between a parent AutomationElement and a child remote window.
     * @param {Integer} remoteWindowId The unique identifier for the window.
     * @param {Integer} remoteProcessId The unique process identifier for the window.
     * @param {IInspectable} parentAutomationElement The parent element for the window.
     * @returns {IAsyncOperation<RemoteAutomationWindow>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationclientsession.createwindowasync
     */
    CreateWindowAsync(remoteWindowId, remoteProcessId, parentAutomationElement) {
        if (!this.HasProp("__IRemoteAutomationClientSession")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationClientSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationClientSession := IRemoteAutomationClientSession(outPtr)
        }

        return this.__IRemoteAutomationClientSession.CreateWindowAsync(remoteWindowId, remoteProcessId, parentAutomationElement)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SessionId() {
        if (!this.HasProp("__IRemoteAutomationClientSession")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationClientSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationClientSession := IRemoteAutomationClientSession(outPtr)
        }

        return this.__IRemoteAutomationClientSession.get_SessionId()
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteAutomationClientSession, RemoteAutomationConnectionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionRequested(handler) {
        if (!this.HasProp("__IRemoteAutomationClientSession")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationClientSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationClientSession := IRemoteAutomationClientSession(outPtr)
        }

        return this.__IRemoteAutomationClientSession.add_ConnectionRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ConnectionRequested(token) {
        if (!this.HasProp("__IRemoteAutomationClientSession")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationClientSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationClientSession := IRemoteAutomationClientSession(outPtr)
        }

        return this.__IRemoteAutomationClientSession.remove_ConnectionRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteAutomationClientSession, RemoteAutomationDisconnectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Disconnected(handler) {
        if (!this.HasProp("__IRemoteAutomationClientSession")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationClientSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationClientSession := IRemoteAutomationClientSession(outPtr)
        }

        return this.__IRemoteAutomationClientSession.add_Disconnected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Disconnected(token) {
        if (!this.HasProp("__IRemoteAutomationClientSession")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationClientSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationClientSession := IRemoteAutomationClientSession(outPtr)
        }

        return this.__IRemoteAutomationClientSession.remove_Disconnected(token)
    }

;@endregion Instance Methods
}
