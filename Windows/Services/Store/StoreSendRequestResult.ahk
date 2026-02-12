#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreSendRequestResult.ahk
#Include .\IStoreSendRequestResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for a request that is sent to the Microsoft Store.
 * @remarks
 * The [StoreRequestHelper.SendRequestAsync](storerequesthelper_sendrequestasync_58590558.md) method returns an object of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesendrequestresult
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreSendRequestResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreSendRequestResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreSendRequestResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the response data for the request.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesendrequestresult.response
     * @type {HSTRING} 
     */
    Response {
        get => this.get_Response()
    }

    /**
     * Gets the error code for the request, if the operation encountered an error.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesendrequestresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets the HTTP status code for the request.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesendrequestresult.httpstatuscode
     * @type {Integer} 
     */
    HttpStatusCode {
        get => this.get_HttpStatusCode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Response() {
        if (!this.HasProp("__IStoreSendRequestResult")) {
            if ((queryResult := this.QueryInterface(IStoreSendRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSendRequestResult := IStoreSendRequestResult(outPtr)
        }

        return this.__IStoreSendRequestResult.get_Response()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IStoreSendRequestResult")) {
            if ((queryResult := this.QueryInterface(IStoreSendRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSendRequestResult := IStoreSendRequestResult(outPtr)
        }

        return this.__IStoreSendRequestResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HttpStatusCode() {
        if (!this.HasProp("__IStoreSendRequestResult2")) {
            if ((queryResult := this.QueryInterface(IStoreSendRequestResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSendRequestResult2 := IStoreSendRequestResult2(outPtr)
        }

        return this.__IStoreSendRequestResult2.get_HttpStatusCode()
    }

;@endregion Instance Methods
}
