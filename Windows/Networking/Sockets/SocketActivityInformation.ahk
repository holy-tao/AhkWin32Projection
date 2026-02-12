#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocketActivityInformation.ahk
#Include .\ISocketActivityInformationStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information on the transferred socket from the Socket Broker.
 * @remarks
 * You can get an instance of this class from the static [SocketActivityInformation.AllSockets](socketactivityinformation_allsockets.md) collection, or from the [SocketActivityTriggerDetails](socketactivitytriggerdetails.md) object passed to your [SocketActivityTrigger](../windows.applicationmodel.background/socketactivitytrigger.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivityinformation
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class SocketActivityInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISocketActivityInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISocketActivityInformation.IID

    /**
     * Gets a list of all the sockets transferred to the socket brokering service by this app.
     * @remarks
     * When a new instance of your app has become active, and you want the new instance to take ownership of the sockets that a previous instance of your app transferred to the socket broker, use the static AllSockets collection to enumerate the sockets associated with your app. For each socket in the collection, transfer ownership to the current app instance by getting the appropriate socket object ([DatagramSocket](datagramsocket.md), [StreamSocket](streamsocket.md), or [StreamSocketListener](streamsocketlistener.md)), as indicated by the [SocketKind](socketactivityinformation_socketkind.md) property. Using the property getter for the socket object transfers ownership of the socket back from the socket broker to your app.
     * 
     * Note that your code is only allowed to transfer ownership of a socket to a socket object whose type that matches the [SocketActivityKind](socketactivitykind.md) of the socket being transferred. Attempting to use the wrong type of socket object will fail.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivityinformation.allsockets
     * @type {IMapView<HSTRING, SocketActivityInformation>} 
     */
    static AllSockets {
        get => SocketActivityInformation.get_AllSockets()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IMapView<HSTRING, SocketActivityInformation>} 
     */
    static get_AllSockets() {
        if (!SocketActivityInformation.HasProp("__ISocketActivityInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.SocketActivityInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISocketActivityInformationStatics.IID)
            SocketActivityInformation.__ISocketActivityInformationStatics := ISocketActivityInformationStatics(factoryPtr)
        }

        return SocketActivityInformation.__ISocketActivityInformationStatics.get_AllSockets()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The background task ID used while transferring ownership of the socket.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivityinformation.taskid
     * @type {Guid} 
     */
    TaskId {
        get => this.get_TaskId()
    }

    /**
     * A unique string for this app used to identify the transferred socket. This is passed by the app while transferring the socket ownership to the service.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivityinformation.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a [SocketActivityKind](socketactivitykind.md) enumeration value that identifies socket kind.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivityinformation.socketkind
     * @type {Integer} 
     */
    SocketKind {
        get => this.get_SocketKind()
    }

    /**
     * Get the context associated while transferring ownership of the socket.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivityinformation.context
     * @type {SocketActivityContext} 
     */
    Context {
        get => this.get_Context()
    }

    /**
     * Based on the socket type, the app can reclaim the ownership of the appropriate [DatagramSocket](datagramsocket.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivityinformation.datagramsocket
     * @type {DatagramSocket} 
     */
    DatagramSocket {
        get => this.get_DatagramSocket()
    }

    /**
     * Based on the socket type, the app can reclaim the ownership of the appropriate [StreamSocket](streamsocket.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivityinformation.streamsocket
     * @type {StreamSocket} 
     */
    StreamSocket {
        get => this.get_StreamSocket()
    }

    /**
     * Based on the socket type, the app can reclaim the ownership of the appropriate [StreamSocketListener](streamsocketlistener.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivityinformation.streamsocketlistener
     * @type {StreamSocketListener} 
     */
    StreamSocketListener {
        get => this.get_StreamSocketListener()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TaskId() {
        if (!this.HasProp("__ISocketActivityInformation")) {
            if ((queryResult := this.QueryInterface(ISocketActivityInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocketActivityInformation := ISocketActivityInformation(outPtr)
        }

        return this.__ISocketActivityInformation.get_TaskId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__ISocketActivityInformation")) {
            if ((queryResult := this.QueryInterface(ISocketActivityInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocketActivityInformation := ISocketActivityInformation(outPtr)
        }

        return this.__ISocketActivityInformation.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SocketKind() {
        if (!this.HasProp("__ISocketActivityInformation")) {
            if ((queryResult := this.QueryInterface(ISocketActivityInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocketActivityInformation := ISocketActivityInformation(outPtr)
        }

        return this.__ISocketActivityInformation.get_SocketKind()
    }

    /**
     * 
     * @returns {SocketActivityContext} 
     */
    get_Context() {
        if (!this.HasProp("__ISocketActivityInformation")) {
            if ((queryResult := this.QueryInterface(ISocketActivityInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocketActivityInformation := ISocketActivityInformation(outPtr)
        }

        return this.__ISocketActivityInformation.get_Context()
    }

    /**
     * 
     * @returns {DatagramSocket} 
     */
    get_DatagramSocket() {
        if (!this.HasProp("__ISocketActivityInformation")) {
            if ((queryResult := this.QueryInterface(ISocketActivityInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocketActivityInformation := ISocketActivityInformation(outPtr)
        }

        return this.__ISocketActivityInformation.get_DatagramSocket()
    }

    /**
     * 
     * @returns {StreamSocket} 
     */
    get_StreamSocket() {
        if (!this.HasProp("__ISocketActivityInformation")) {
            if ((queryResult := this.QueryInterface(ISocketActivityInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocketActivityInformation := ISocketActivityInformation(outPtr)
        }

        return this.__ISocketActivityInformation.get_StreamSocket()
    }

    /**
     * 
     * @returns {StreamSocketListener} 
     */
    get_StreamSocketListener() {
        if (!this.HasProp("__ISocketActivityInformation")) {
            if ((queryResult := this.QueryInterface(ISocketActivityInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocketActivityInformation := ISocketActivityInformation(outPtr)
        }

        return this.__ISocketActivityInformation.get_StreamSocketListener()
    }

;@endregion Instance Methods
}
