#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IResponseInformation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents data that is returned by a server response.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.responseinformation
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class ResponseInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IResponseInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IResponseInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies whether the download is resumable.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.responseinformation.isresumable
     * @type {Boolean} 
     */
    IsResumable {
        get => this.get_IsResumable()
    }

    /**
     * Gets the URI that contains the requested data.
     * @remarks
     * If a request sent by an operation never gets redirected, the value of this property is the same as the URI specified in the operation constructor. If a request gets redirected, this property contains the URI that returned the requested data.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.responseinformation.actualuri
     * @type {Uri} 
     */
    ActualUri {
        get => this.get_ActualUri()
    }

    /**
     * Gets the status code returned by the server.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.responseinformation.statuscode
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * Gets all response headers sent by the server.
     * @remarks
     * The dictionary returned by the **Headers** property stores header names (as its keys) in the case that the server sends, which can vary between servers and/or HTTP versions. The dictionary also performs key lookups case-sensitively. If the server sends the header name `Content-Length`, then the dictionary stores it that way, and you'll need to use that same case as a lookup key. Header *values* are stored exactly as they come over the wire.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.responseinformation.headers
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    Headers {
        get => this.get_Headers()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsResumable() {
        if (!this.HasProp("__IResponseInformation")) {
            if ((queryResult := this.QueryInterface(IResponseInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResponseInformation := IResponseInformation(outPtr)
        }

        return this.__IResponseInformation.get_IsResumable()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ActualUri() {
        if (!this.HasProp("__IResponseInformation")) {
            if ((queryResult := this.QueryInterface(IResponseInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResponseInformation := IResponseInformation(outPtr)
        }

        return this.__IResponseInformation.get_ActualUri()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        if (!this.HasProp("__IResponseInformation")) {
            if ((queryResult := this.QueryInterface(IResponseInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResponseInformation := IResponseInformation(outPtr)
        }

        return this.__IResponseInformation.get_StatusCode()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Headers() {
        if (!this.HasProp("__IResponseInformation")) {
            if ((queryResult := this.QueryInterface(IResponseInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResponseInformation := IResponseInformation(outPtr)
        }

        return this.__IResponseInformation.get_Headers()
    }

;@endregion Instance Methods
}
