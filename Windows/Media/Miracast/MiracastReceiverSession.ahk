#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverSession.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MiracastReceiverSession.ahk
#Include .\MiracastReceiverConnectionCreatedEventArgs.ahk
#Include .\MiracastReceiverMediaSourceCreatedEventArgs.ahk
#Include .\MiracastReceiverDisconnectedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * An object which encapsulates functionality related to receiving incoming Miracast connections.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversession
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies if the app allows a new connection to take over an in-progress Miracast Connection.
     * @remarks
     * When a connection is taken over, the old connection is automatically disconnected and [MiracastReceiverSession.Disconnected](miracastreceiversession_disconnected.md) event will be raised for the old connection, and [MiracastReceiverSession.ConnectionCreated](miracastreceiversession_connectioncreated.md) will be raised for the new connection.
     * 
     * The app must set this property before invoking the [MiracastReceiverSession.Start](miracastreceiversession_start_1587696324.md) or [MiracastReceiverSession.StartAsync](miracastreceiversession_startasync_1931900819.md) method in order for the setting to take effect.
     * 
     * If the Wi-Fi hardware does not support multiple simultaneous connections, it will not be possible for a new connection to take over an in-progress connection. Use [MiracastReceiverStatus.IsConnectionTakeoverSupported](miracastreceiverstatus_isconnectiontakeoversupported.md) to check if connection take-over is possible.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversession.allowconnectiontakeover
     * @type {Boolean} 
     */
    AllowConnectionTakeover {
        get => this.get_AllowConnectionTakeover()
        set => this.put_AllowConnectionTakeover(value)
    }

    /**
     * Specifies the maximum number of simultaneous connections that the app is willing to handle on the [MiracastReceiverSession](miracastreceiversession.md).
     * @remarks
     * The app must set this property before invoking the [MiracastReceiverSession.Start](miracastreceiversession_start_1587696324.md) or [MiracastReceiverSession.StartAsync](miracastreceiversession_startasync_1931900819.md) method in order for the setting to take effect.
     * 
     * Not all Wi-Fi hardware supports multiple simultaneous connections. Use [MiracastReceiverStatus.MaxSimultaneousConnections](miracastreceiverstatus_maxsimultaneousconnections.md) to determine the maximum number of simultaneous connections supported by Wi-Fi.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversession.maxsimultaneousconnections
     * @type {Integer} 
     */
    MaxSimultaneousConnections {
        get => this.get_MaxSimultaneousConnections()
        set => this.put_MaxSimultaneousConnections(value)
    }

    /**
     * An event which is raised when a new incoming [MiracastReceiverConnection](miracastreceiverconnection.md) is received.
     * @remarks
     * The app must subscribe to this event before invoking the [MiracastReceiverSession.Start](miracastreceiversession_start_1587696324.md) or [MiracastReceiverSession.StartAsync](miracastreceiversession_startasync_1931900819.md) method.
     * @type {TypedEventHandler<MiracastReceiverSession, MiracastReceiverConnectionCreatedEventArgs>}
    */
    OnConnectionCreated {
        get {
            if(!this.HasProp("__OnConnectionCreated")){
                this.__OnConnectionCreated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{69d03828-7a8a-549a-8253-7850e4db605a}"),
                    MiracastReceiverSession,
                    MiracastReceiverConnectionCreatedEventArgs
                )
                this.__OnConnectionCreatedToken := this.add_ConnectionCreated(this.__OnConnectionCreated.iface)
            }
            return this.__OnConnectionCreated
        }
    }

    /**
     * An event which is raised when the [MediaSource](../windows.media.core/mediasource.md) object for a [MiracastReceiverConnection](miracastreceiverconnection.md) has been created.
     * @remarks
     * The app must subscribe to this event before invoking the [MiracastReceiverSession.Start](miracastreceiversession_start_1587696324.md) or [MiracastReceiverSession.StartAsync](miracastreceiversession_startasync_1931900819.md) method.
     * @type {TypedEventHandler<MiracastReceiverSession, MiracastReceiverMediaSourceCreatedEventArgs>}
    */
    OnMediaSourceCreated {
        get {
            if(!this.HasProp("__OnMediaSourceCreated")){
                this.__OnMediaSourceCreated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{929ec57a-92cc-50f8-ae4a-bb6a67152e82}"),
                    MiracastReceiverSession,
                    MiracastReceiverMediaSourceCreatedEventArgs
                )
                this.__OnMediaSourceCreatedToken := this.add_MediaSourceCreated(this.__OnMediaSourceCreated.iface)
            }
            return this.__OnMediaSourceCreated
        }
    }

    /**
     * An event which is raised when a [MiracastReceiverConnection](miracastreceiverconnection.md) has been disconnected by the Miracast Transmitter.
     * @remarks
     * The app must subscribe to this event before invoking the [MiracastReceiverSession.Start](miracastreceiversession_start_1587696324.md) or [MiracastReceiverSession.StartAsync](miracastreceiversession_startasync_1931900819.md) method.
     * 
     * The event is not raised if the app itself requested the connection to be disconnected, for example, by invoking the Disconnect method.
     * 
     * Apps should check the [MiracastReceiverDisconnectedEventArgs.Connection](miracastreceiverdisconnectedeventargs_connection.md) property to determine which connection was disconnected as a MiracastReceiverSession can handle multiple connections.
     * @type {TypedEventHandler<MiracastReceiverSession, MiracastReceiverDisconnectedEventArgs>}
    */
    OnDisconnected {
        get {
            if(!this.HasProp("__OnDisconnected")){
                this.__OnDisconnected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a4964b5f-147c-57e3-82d0-cc7de5ff2def}"),
                    MiracastReceiverSession,
                    MiracastReceiverDisconnectedEventArgs
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
        if(this.HasProp("__OnConnectionCreatedToken")) {
            this.remove_ConnectionCreated(this.__OnConnectionCreatedToken)
            this.__OnConnectionCreated.iface.Dispose()
        }

        if(this.HasProp("__OnMediaSourceCreatedToken")) {
            this.remove_MediaSourceCreated(this.__OnMediaSourceCreatedToken)
            this.__OnMediaSourceCreated.iface.Dispose()
        }

        if(this.HasProp("__OnDisconnectedToken")) {
            this.remove_Disconnected(this.__OnDisconnectedToken)
            this.__OnDisconnected.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverSession, MiracastReceiverConnectionCreatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionCreated(handler) {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.add_ConnectionCreated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ConnectionCreated(token) {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.remove_ConnectionCreated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverSession, MiracastReceiverMediaSourceCreatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MediaSourceCreated(handler) {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.add_MediaSourceCreated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MediaSourceCreated(token) {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.remove_MediaSourceCreated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverSession, MiracastReceiverDisconnectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Disconnected(handler) {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.add_Disconnected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Disconnected(token) {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.remove_Disconnected(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowConnectionTakeover() {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.get_AllowConnectionTakeover()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowConnectionTakeover(value) {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.put_AllowConnectionTakeover(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxSimultaneousConnections() {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.get_MaxSimultaneousConnections()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxSimultaneousConnections(value) {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.put_MaxSimultaneousConnections(value)
    }

    /**
     * Start listening for incoming Miracast connections.
     * @remarks
     * Because this method may block for a noticeable period of time, you should not call it from the UI thread or from a single-threaded apartment. Instead, use the asyncronous method [StartAsync](miracastreceiversession_startasync_1931900819.md).
     * @returns {MiracastReceiverSessionStartResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversession.start
     */
    Start() {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.Start()
    }

    /**
     * Start listening for incoming Miracast connections.
     * @returns {IAsyncOperation<MiracastReceiverSessionStartResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversession.startasync
     */
    StartAsync() {
        if (!this.HasProp("__IMiracastReceiverSession")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSession := IMiracastReceiverSession(outPtr)
        }

        return this.__IMiracastReceiverSession.StartAsync()
    }

    /**
     * Closes the [MiracastReceiverSession](miracastreceiversession.md) object and disconnects any associated [MiracastReceiverConnection](miracastreceiverconnection.md) objects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversession.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
