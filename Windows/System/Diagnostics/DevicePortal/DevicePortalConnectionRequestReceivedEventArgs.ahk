#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDevicePortalConnectionRequestReceivedEventArgs.ahk
#Include .\IDevicePortalWebSocketConnectionRequestReceivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes a [DevicePortalConnection.RequestReceived](DevicePortalConnection_RequestReceived.md) event that was raised.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnectionrequestreceivedeventargs
 * @namespace Windows.System.Diagnostics.DevicePortal
 * @version WindowsRuntime 1.4
 */
class DevicePortalConnectionRequestReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDevicePortalConnectionRequestReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDevicePortalConnectionRequestReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the HTTP request message for this request.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnectionrequestreceivedeventargs.requestmessage
     * @type {HttpRequestMessage} 
     */
    RequestMessage {
        get => this.get_RequestMessage()
    }

    /**
     * Gets the HTTP response message for this request.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnectionrequestreceivedeventargs.responsemessage
     * @type {HttpResponseMessage} 
     */
    ResponseMessage {
        get => this.get_ResponseMessage()
    }

    /**
     * Gets a value describing whether the request is for WebSocket communication.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnectionrequestreceivedeventargs.iswebsocketupgraderequest
     * @type {Boolean} 
     */
    IsWebSocketUpgradeRequest {
        get => this.get_IsWebSocketUpgradeRequest()
    }

    /**
     * Gets a list of the sub-protocols that the WebSocket is requested to follow.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnectionrequestreceivedeventargs.websocketprotocolsrequested
     * @type {IVectorView<HSTRING>} 
     */
    WebSocketProtocolsRequested {
        get => this.get_WebSocketProtocolsRequested()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_RequestMessage() {
        if (!this.HasProp("__IDevicePortalConnectionRequestReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePortalConnectionRequestReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalConnectionRequestReceivedEventArgs := IDevicePortalConnectionRequestReceivedEventArgs(outPtr)
        }

        return this.__IDevicePortalConnectionRequestReceivedEventArgs.get_RequestMessage()
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_ResponseMessage() {
        if (!this.HasProp("__IDevicePortalConnectionRequestReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePortalConnectionRequestReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalConnectionRequestReceivedEventArgs := IDevicePortalConnectionRequestReceivedEventArgs(outPtr)
        }

        return this.__IDevicePortalConnectionRequestReceivedEventArgs.get_ResponseMessage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWebSocketUpgradeRequest() {
        if (!this.HasProp("__IDevicePortalWebSocketConnectionRequestReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePortalWebSocketConnectionRequestReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalWebSocketConnectionRequestReceivedEventArgs := IDevicePortalWebSocketConnectionRequestReceivedEventArgs(outPtr)
        }

        return this.__IDevicePortalWebSocketConnectionRequestReceivedEventArgs.get_IsWebSocketUpgradeRequest()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_WebSocketProtocolsRequested() {
        if (!this.HasProp("__IDevicePortalWebSocketConnectionRequestReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePortalWebSocketConnectionRequestReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalWebSocketConnectionRequestReceivedEventArgs := IDevicePortalWebSocketConnectionRequestReceivedEventArgs(outPtr)
        }

        return this.__IDevicePortalWebSocketConnectionRequestReceivedEventArgs.get_WebSocketProtocolsRequested()
    }

    /**
     * Retrieves a deferral object to allow the background task to continue executing while a Device Portal connection is open.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnectionrequestreceivedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IDevicePortalWebSocketConnectionRequestReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePortalWebSocketConnectionRequestReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalWebSocketConnectionRequestReceivedEventArgs := IDevicePortalWebSocketConnectionRequestReceivedEventArgs(outPtr)
        }

        return this.__IDevicePortalWebSocketConnectionRequestReceivedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
