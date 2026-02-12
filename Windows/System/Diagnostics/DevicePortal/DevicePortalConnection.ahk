#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDevicePortalConnection.ahk
#Include .\IDevicePortalWebSocketConnection.ahk
#Include .\IDevicePortalConnectionStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\DevicePortalConnection.ahk
#Include .\DevicePortalConnectionClosedEventArgs.ahk
#Include .\DevicePortalConnectionRequestReceivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Handles a connection to the [Windows Device Portal](/windows/uwp/debug-test-perf/device-portal).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnection
 * @namespace Windows.System.Diagnostics.DevicePortal
 * @version WindowsRuntime 1.4
 */
class DevicePortalConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDevicePortalConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDevicePortalConnection.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes an instance of [DevicePortalConnection](DevicePortalConnection.md) by using the app service connection passed in.
     * @param {AppServiceConnection} appServiceConnection_ The [AppServiceConnection](/uwp/api/Windows.ApplicationModel.AppService.AppServiceConnection) that was used to launch the background task calling this method.
     * @returns {DevicePortalConnection} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnection.getforappserviceconnection
     */
    static GetForAppServiceConnection(appServiceConnection_) {
        if (!DevicePortalConnection.HasProp("__IDevicePortalConnectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.DevicePortal.DevicePortalConnection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDevicePortalConnectionStatics.IID)
            DevicePortalConnection.__IDevicePortalConnectionStatics := IDevicePortalConnectionStatics(factoryPtr)
        }

        return DevicePortalConnection.__IDevicePortalConnectionStatics.GetForAppServiceConnection(appServiceConnection_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        if(this.HasProp("__OnRequestReceivedToken")) {
            this.remove_RequestReceived(this.__OnRequestReceivedToken)
            this.__OnRequestReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<DevicePortalConnection, DevicePortalConnectionClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IDevicePortalConnection")) {
            if ((queryResult := this.QueryInterface(IDevicePortalConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalConnection := IDevicePortalConnection(outPtr)
        }

        return this.__IDevicePortalConnection.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IDevicePortalConnection")) {
            if ((queryResult := this.QueryInterface(IDevicePortalConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalConnection := IDevicePortalConnection(outPtr)
        }

        return this.__IDevicePortalConnection.remove_Closed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DevicePortalConnection, DevicePortalConnectionRequestReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RequestReceived(handler) {
        if (!this.HasProp("__IDevicePortalConnection")) {
            if ((queryResult := this.QueryInterface(IDevicePortalConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalConnection := IDevicePortalConnection(outPtr)
        }

        return this.__IDevicePortalConnection.add_RequestReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RequestReceived(token) {
        if (!this.HasProp("__IDevicePortalConnection")) {
            if ((queryResult := this.QueryInterface(IDevicePortalConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalConnection := IDevicePortalConnection(outPtr)
        }

        return this.__IDevicePortalConnection.remove_RequestReceived(token)
    }

    /**
     * Returns a server-side message WebSocket for use with Device Portal.
     * @param {HttpRequestMessage} request The HTTP request message (found as a property of the **[DevicePortalConnectionRequestReceivedEventArgs](DevicePortalConnectionRequestReceivedEventArgs.md)** class).
     * @returns {ServerMessageWebSocket} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnection.getservermessagewebsocketforrequest
     */
    GetServerMessageWebSocketForRequest(request) {
        if (!this.HasProp("__IDevicePortalWebSocketConnection")) {
            if ((queryResult := this.QueryInterface(IDevicePortalWebSocketConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalWebSocketConnection := IDevicePortalWebSocketConnection(outPtr)
        }

        return this.__IDevicePortalWebSocketConnection.GetServerMessageWebSocketForRequest(request)
    }

    /**
     * Returns a server-side message WebSocket for use with Device Portal.
     * @param {HttpRequestMessage} request The HTTP request message (found as a property of the **[DevicePortalConnectionRequestReceivedEventArgs](DevicePortalConnectionRequestReceivedEventArgs.md)** class).
     * @param {Integer} messageType 
     * @param {HSTRING} protocol 
     * @returns {ServerMessageWebSocket} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnection.getservermessagewebsocketforrequest
     */
    GetServerMessageWebSocketForRequest2(request, messageType, protocol) {
        if (!this.HasProp("__IDevicePortalWebSocketConnection")) {
            if ((queryResult := this.QueryInterface(IDevicePortalWebSocketConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalWebSocketConnection := IDevicePortalWebSocketConnection(outPtr)
        }

        return this.__IDevicePortalWebSocketConnection.GetServerMessageWebSocketForRequest2(request, messageType, protocol)
    }

    /**
     * Returns a server-side message WebSocket for use with Device Portal.
     * @param {HttpRequestMessage} request The HTTP request message (found as a property of the **[DevicePortalConnectionRequestReceivedEventArgs](DevicePortalConnectionRequestReceivedEventArgs.md)** class).
     * @param {Integer} messageType 
     * @param {HSTRING} protocol 
     * @param {Integer} outboundBufferSizeInBytes 
     * @param {Integer} maxMessageSize 
     * @param {Integer} receiveMode 
     * @returns {ServerMessageWebSocket} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnection.getservermessagewebsocketforrequest
     */
    GetServerMessageWebSocketForRequest3(request, messageType, protocol, outboundBufferSizeInBytes, maxMessageSize, receiveMode) {
        if (!this.HasProp("__IDevicePortalWebSocketConnection")) {
            if ((queryResult := this.QueryInterface(IDevicePortalWebSocketConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalWebSocketConnection := IDevicePortalWebSocketConnection(outPtr)
        }

        return this.__IDevicePortalWebSocketConnection.GetServerMessageWebSocketForRequest3(request, messageType, protocol, outboundBufferSizeInBytes, maxMessageSize, receiveMode)
    }

    /**
     * Returns a server-side stream WebSocket for use with Device Portal.
     * @param {HttpRequestMessage} request The HTTP request message (found as a property of the **[DevicePortalConnectionRequestReceivedEventArgs](DevicePortalConnectionRequestReceivedEventArgs.md)** class).
     * @returns {ServerStreamWebSocket} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnection.getserverstreamwebsocketforrequest
     */
    GetServerStreamWebSocketForRequest(request) {
        if (!this.HasProp("__IDevicePortalWebSocketConnection")) {
            if ((queryResult := this.QueryInterface(IDevicePortalWebSocketConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalWebSocketConnection := IDevicePortalWebSocketConnection(outPtr)
        }

        return this.__IDevicePortalWebSocketConnection.GetServerStreamWebSocketForRequest(request)
    }

    /**
     * Returns a server-side stream WebSocket for use with Device Portal.
     * @param {HttpRequestMessage} request The HTTP request message (found as a property of the **[DevicePortalConnectionRequestReceivedEventArgs](DevicePortalConnectionRequestReceivedEventArgs.md)** class).
     * @param {HSTRING} protocol 
     * @param {Integer} outboundBufferSizeInBytes 
     * @param {Boolean} noDelay 
     * @returns {ServerStreamWebSocket} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnection.getserverstreamwebsocketforrequest
     */
    GetServerStreamWebSocketForRequest2(request, protocol, outboundBufferSizeInBytes, noDelay) {
        if (!this.HasProp("__IDevicePortalWebSocketConnection")) {
            if ((queryResult := this.QueryInterface(IDevicePortalWebSocketConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalWebSocketConnection := IDevicePortalWebSocketConnection(outPtr)
        }

        return this.__IDevicePortalWebSocketConnection.GetServerStreamWebSocketForRequest2(request, protocol, outboundBufferSizeInBytes, noDelay)
    }

;@endregion Instance Methods
}
