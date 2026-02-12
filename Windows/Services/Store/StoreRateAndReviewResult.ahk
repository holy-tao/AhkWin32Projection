#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreRateAndReviewResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for a request to rate and review the product.
 * @remarks
 * The [StoreContext.RequestRateAndReviewAppAsync](storecontext_requestrateandreviewappasync_2001521545.md) method returns an object of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storerateandreviewresult
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreRateAndReviewResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreRateAndReviewResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreRateAndReviewResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error code for the request, if the operation encountered an error.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storerateandreviewresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets the complete result data for a rate and review request in JSON format. This includes information to determine if a user aborted the dialog and error details if the call was not successful.
     * @remarks
     * Use the **ExtendedJsonData** property to access the complete data for the [StoreRateAndReviewResult](storerateandreviewresult.md) object as a JSON-formatted string in your code.
     * 
     * JSON Schema:
     * 
     * {
     *     "type": "object",
     *     "properties": {
     *         "status": {
     *             "enum": [ "success", "aborted" ]
     *         },
     *         "data": {
     *             "type": "object",
     *             "properties": {
     *                 "updated": {
     *                     "type": "boolean"
     *                 }
     *             },
     *             "required": [
     *                 "updated"
     *             ]
     *         },
     *         "errorDetails": {
     *             "type": "string"
     *         }
     *     },
     *     "required": [
     *         "status",
     *         "errorDetails"
     *     ]
     * }
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storerateandreviewresult.extendedjsondata
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
    }

    /**
     * Gets a value that indicates whether the request to rate and review had a successful updated.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storerateandreviewresult.wasupdated
     * @type {Boolean} 
     */
    WasUpdated {
        get => this.get_WasUpdated()
    }

    /**
     * Gets the status for the rate and review request for the product.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storerateandreviewresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IStoreRateAndReviewResult")) {
            if ((queryResult := this.QueryInterface(IStoreRateAndReviewResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreRateAndReviewResult := IStoreRateAndReviewResult(outPtr)
        }

        return this.__IStoreRateAndReviewResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        if (!this.HasProp("__IStoreRateAndReviewResult")) {
            if ((queryResult := this.QueryInterface(IStoreRateAndReviewResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreRateAndReviewResult := IStoreRateAndReviewResult(outPtr)
        }

        return this.__IStoreRateAndReviewResult.get_ExtendedJsonData()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasUpdated() {
        if (!this.HasProp("__IStoreRateAndReviewResult")) {
            if ((queryResult := this.QueryInterface(IStoreRateAndReviewResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreRateAndReviewResult := IStoreRateAndReviewResult(outPtr)
        }

        return this.__IStoreRateAndReviewResult.get_WasUpdated()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IStoreRateAndReviewResult")) {
            if ((queryResult := this.QueryInterface(IStoreRateAndReviewResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreRateAndReviewResult := IStoreRateAndReviewResult(outPtr)
        }

        return this.__IStoreRateAndReviewResult.get_Status()
    }

;@endregion Instance Methods
}
