#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebSocketInformation.ahk
#Include .\IWebSocketInformation2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket information on a [MessageWebSocket](messagewebsocket.md).
 * @remarks
 * [MessageWebSocketInformation](messagewebsocket_information.md) can be called any time after the [MessageWebSocket](messagewebsocket.md) has been created.
 * 
 * A MessageWebSocketInformation object is automatically created with the parent [MessageWebSocket](messagewebsocket.md) object. The [MessageWebSocket.Information](messagewebsocket_information.md) property provides access to the associated MessageWebSocketInformation object.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketinformation
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class MessageWebSocketInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebSocketInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebSocketInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the IP address associated with a [MessageWebSocket](messagewebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketinformation.localaddress
     * @type {HostName} 
     */
    LocalAddress {
        get => this.get_LocalAddress()
    }

    /**
     * Gets bandwidth information for network data transfer on a [MessageWebSocket](messagewebsocket.md) object.
     * 
     * Note that the returned statistics are based on extended TCP statistics, which are enabled by default on Client versions of Windows, but disabled by default for performance reasons on Server versions of Windows. If extended TCP statistics are not available, all returned numerical statistics are set to 0, and boolean statistics are set to false.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketinformation.bandwidthstatistics
     * @type {BandwidthStatistics} 
     */
    BandwidthStatistics {
        get => this.get_BandwidthStatistics()
    }

    /**
     * Gets the WebSocket sub-protocol negotiated with the server during WebSocket handshake on a [MessageWebSocket](messagewebsocket.md) object.
     * @remarks
     * Both a WebSocket client and a WebSocket server may support multiple sub-protocols. During the WebSocket handshake, the server will select one of the sub-protocols from the mutually supported sub-protocols and reply in the "Sec-WebSocket-Protocol" header. The Protocol property will contain the selected sub-protocol string.
     * 
     * Before the [MessageWebSocket](messagewebsocket.md) is connected, this property is null.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketinformation.protocol
     * @type {HSTRING} 
     */
    Protocol {
        get => this.get_Protocol()
    }

    /**
     * Gets the certificate provided by the server when a secure WebSocket connection has been established.
     * @remarks
     * By the time the server certificate is available through this property, the SSL connection has already been established.
     * 
     * If you wish to inspect the server certificate during the connection process in order to perform custom validation, you should register a handler for the [MessageWebSocket.ServerCustomValidationRequested](messagewebsocket_servercustomvalidationrequested.md) event, and perform your custom server validation in that handler.
     * 
     * If you merely wish to ignore certain classes of error when the server certificate is validated (for example, you are using a self-signed certificate and wish to ignore the validation error caused by this condition) you can use the [IgnorableServerCertificateErrors](iwebsocketcontrol2_ignorableservercertificateerrors.md) property to ignore the relevant classes of errors.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketinformation.servercertificate
     * @type {Certificate} 
     */
    ServerCertificate {
        get => this.get_ServerCertificate()
    }

    /**
     * Gets the category of an error that occurred making an SSL connection with a WebSocket server.
     * @remarks
     * SSL server errors should only be ignored in advanced scenarios. Disregarding server certificate errors when this property is either **Ignorable** or **Fatal** may result in the loss of privacy or integrity of the content passed over the SSL session.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketinformation.servercertificateerrorseverity
     * @type {Integer} 
     */
    ServerCertificateErrorSeverity {
        get => this.get_ServerCertificateErrorSeverity()
    }

    /**
     * Gets a list of the errors that occurred while establishing a secure WebSocket connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketinformation.servercertificateerrors
     * @type {IVectorView<Integer>} 
     */
    ServerCertificateErrors {
        get => this.get_ServerCertificateErrors()
    }

    /**
     * Gets the intermediate certificates sent by the server during SSL negotiation when making an SSL connection with a WebSockets server.
     * @remarks
     * This property returns the intermediate server certificates used when making an SSL connection with a WebSockets server. These certificates are provided by the server during the SSL connection negotiation. The properties on the [Certificate](../windows.security.cryptography.certificates/certificate.md) objects in the returned vector can be used to get detailed information on the certificates.
     * 
     * By the time the list of intermediate certificates is available through this property, the SSL connection has already been established. If you wish to inspect the server certificates during the connection process in order to perform custom validation, you should register a handler for the [MessageWebSocket.ServerCustomValidationRequested](messagewebsocket_servercustomvalidationrequested.md) event, and perform your custom server validation in that handler, using the [WebSocketServerCustomValidationRequestedEventArgs](websocketservercustomvalidationrequestedeventargs.md) instance passed to your event handler to inspect the intermediate certificates.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.messagewebsocketinformation.serverintermediatecertificates
     * @type {IVectorView<Certificate>} 
     */
    ServerIntermediateCertificates {
        get => this.get_ServerIntermediateCertificates()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalAddress() {
        if (!this.HasProp("__IWebSocketInformation")) {
            if ((queryResult := this.QueryInterface(IWebSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketInformation := IWebSocketInformation(outPtr)
        }

        return this.__IWebSocketInformation.get_LocalAddress()
    }

    /**
     * 
     * @returns {BandwidthStatistics} 
     */
    get_BandwidthStatistics() {
        if (!this.HasProp("__IWebSocketInformation")) {
            if ((queryResult := this.QueryInterface(IWebSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketInformation := IWebSocketInformation(outPtr)
        }

        return this.__IWebSocketInformation.get_BandwidthStatistics()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Protocol() {
        if (!this.HasProp("__IWebSocketInformation")) {
            if ((queryResult := this.QueryInterface(IWebSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketInformation := IWebSocketInformation(outPtr)
        }

        return this.__IWebSocketInformation.get_Protocol()
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ServerCertificate() {
        if (!this.HasProp("__IWebSocketInformation2")) {
            if ((queryResult := this.QueryInterface(IWebSocketInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketInformation2 := IWebSocketInformation2(outPtr)
        }

        return this.__IWebSocketInformation2.get_ServerCertificate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServerCertificateErrorSeverity() {
        if (!this.HasProp("__IWebSocketInformation2")) {
            if ((queryResult := this.QueryInterface(IWebSocketInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketInformation2 := IWebSocketInformation2(outPtr)
        }

        return this.__IWebSocketInformation2.get_ServerCertificateErrorSeverity()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ServerCertificateErrors() {
        if (!this.HasProp("__IWebSocketInformation2")) {
            if ((queryResult := this.QueryInterface(IWebSocketInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketInformation2 := IWebSocketInformation2(outPtr)
        }

        return this.__IWebSocketInformation2.get_ServerCertificateErrors()
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_ServerIntermediateCertificates() {
        if (!this.HasProp("__IWebSocketInformation2")) {
            if ((queryResult := this.QueryInterface(IWebSocketInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketInformation2 := IWebSocketInformation2(outPtr)
        }

        return this.__IWebSocketInformation2.get_ServerIntermediateCertificates()
    }

;@endregion Instance Methods
}
