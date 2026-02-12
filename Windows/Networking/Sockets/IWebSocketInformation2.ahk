#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Security\Cryptography\Certificates\Certificate.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides socket information on an [IWebSocket](iwebsocket.md) object. This interface extends [IWebSocketInformation](iwebsocketinformation.md) with additional properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketinformation2
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IWebSocketInformation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebSocketInformation2
     * @type {Guid}
     */
    static IID => Guid("{ce1d39ce-a1b7-4d43-8269-8d5b981bd47a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServerCertificate", "get_ServerCertificateErrorSeverity", "get_ServerCertificateErrors", "get_ServerIntermediateCertificates"]

    /**
     * Gets the certificate provided by the server when a secure WebSocket connection has been established.
     * @remarks
     * By the time the server certificate is available through this property, the SSL connection has already been established.
     * 
     * If you wish to inspect the server certificate during the connection process in order to perform custom validation, you should register a handler for the appropriate [MessageWebSocket.ServerCustomValidationRequested](messagewebsocket_servercustomvalidationrequested.md) or [StreamWebSocket.ServerCustomValidationRequested](streamwebsocket_servercustomvalidationrequested.md) event, and perform your custom server validation in that handler.
     * 
     * If you merely wish to ignore certain classes of error when the server certificate is validated (for example, you are using a self-signed certificate and wish to ignore the validation error caused by this condition) you can use the [IgnorableServerCertificateErrors](iwebsocketcontrol2_ignorableservercertificateerrors.md) property to ignore the relevant classes of errors.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketinformation2.servercertificate
     * @type {Certificate} 
     */
    ServerCertificate {
        get => this.get_ServerCertificate()
    }

    /**
     * Gets the category of an error that occurred making an SSL connection with a WebSocket server.
     * @remarks
     * SSL server errors should only be ignored in advanced scenarios. Disregarding server certificate errors when this property is either **Ignorable** or **Fatal** may result in the loss of privacy or integrity of the content passed over the SSL session.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketinformation2.servercertificateerrorseverity
     * @type {Integer} 
     */
    ServerCertificateErrorSeverity {
        get => this.get_ServerCertificateErrorSeverity()
    }

    /**
     * Gets a list of the errors that occurred while establishing a secure WebSocket connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketinformation2.servercertificateerrors
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
     * By the time the list of intermediate certificates is available through this property, the SSL connection has already been established. If you wish to inspect the server certificates during the connection process in order to perform custom validation, you should register a handler for the appropriate [MessageWebSocket.ServerCustomValidationRequested](messagewebsocket_servercustomvalidationrequested.md) or [StreamWebSocket.ServerCustomValidationRequested](streamwebsocket_servercustomvalidationrequested.md) event, and perform your custom server validation in that handler, using the [WebSocketServerCustomValidationRequestedEventArgs](websocketservercustomvalidationrequestedeventargs.md) instance passed to your event handler to inspect the intermediate certificates.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketinformation2.serverintermediatecertificates
     * @type {IVectorView<Certificate>} 
     */
    ServerIntermediateCertificates {
        get => this.get_ServerIntermediateCertificates()
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ServerCertificate() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Certificate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServerCertificateErrorSeverity() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ServerCertificateErrors() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_ServerIntermediateCertificates() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Certificate, value)
    }
}
