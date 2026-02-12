#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebSocketServerCustomValidationRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a ServerCustomValidationRequested event on a WebSocket. This event occurs when a new, secure connection to a WebSocket is being made, and gives your code the opportunity to perform custom validation of the server certificates before the connection has been established.
 * @remarks
 * Instances of this object are created by the system and passed as an argument to your registered event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketservercustomvalidationrequestedeventargs
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class WebSocketServerCustomValidationRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebSocketServerCustomValidationRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebSocketServerCustomValidationRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The certificate being offered by the server for validation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketservercustomvalidationrequestedeventargs.servercertificate
     * @type {Certificate} 
     */
    ServerCertificate {
        get => this.get_ServerCertificate()
    }

    /**
     * Gets the category of an error that occurred making an SSL connection with this WebSocket server.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketservercustomvalidationrequestedeventargs.servercertificateerrorseverity
     * @type {Integer} 
     */
    ServerCertificateErrorSeverity {
        get => this.get_ServerCertificateErrorSeverity()
    }

    /**
     * A list of errors encountered in validating the server certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketservercustomvalidationrequestedeventargs.servercertificateerrors
     * @type {IVectorView<Integer>} 
     */
    ServerCertificateErrors {
        get => this.get_ServerCertificateErrors()
    }

    /**
     * Gets a list of intermediate certificates from the validation process currently being validated.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketservercustomvalidationrequestedeventargs.serverintermediatecertificates
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
     * @returns {Certificate} 
     */
    get_ServerCertificate() {
        if (!this.HasProp("__IWebSocketServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebSocketServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketServerCustomValidationRequestedEventArgs := IWebSocketServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IWebSocketServerCustomValidationRequestedEventArgs.get_ServerCertificate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServerCertificateErrorSeverity() {
        if (!this.HasProp("__IWebSocketServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebSocketServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketServerCustomValidationRequestedEventArgs := IWebSocketServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IWebSocketServerCustomValidationRequestedEventArgs.get_ServerCertificateErrorSeverity()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ServerCertificateErrors() {
        if (!this.HasProp("__IWebSocketServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebSocketServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketServerCustomValidationRequestedEventArgs := IWebSocketServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IWebSocketServerCustomValidationRequestedEventArgs.get_ServerCertificateErrors()
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_ServerIntermediateCertificates() {
        if (!this.HasProp("__IWebSocketServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebSocketServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketServerCustomValidationRequestedEventArgs := IWebSocketServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IWebSocketServerCustomValidationRequestedEventArgs.get_ServerIntermediateCertificates()
    }

    /**
     * Rejects validation of this server. Call this method when your validation has determined that you should not connect to the server.
     * @remarks
     * There is no explicit method that allows a connection during validation. If no event handler calls Reject, then the connection is allowed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketservercustomvalidationrequestedeventargs.reject
     */
    Reject() {
        if (!this.HasProp("__IWebSocketServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebSocketServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketServerCustomValidationRequestedEventArgs := IWebSocketServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IWebSocketServerCustomValidationRequestedEventArgs.Reject()
    }

    /**
     * Gets the [Deferral](../windows.foundation/deferral.md) object that manages the validation operation. Call this method when you begin your validation operation, and call [Deferral.Complete](../windows.foundation/deferral_complete_1807836922.md) when the operation is complete.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketservercustomvalidationrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IWebSocketServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebSocketServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketServerCustomValidationRequestedEventArgs := IWebSocketServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IWebSocketServerCustomValidationRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
