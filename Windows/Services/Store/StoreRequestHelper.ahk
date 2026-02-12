#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreRequestHelperStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a helper method that can be used to send requests to the Microsoft Store for operations that do not yet have a corresponding API available in the Windows SDK.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storerequesthelper
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreRequestHelper extends IInspectable {
;@region Static Methods
    /**
     * Sends the specified request to the Windows Store with the provided context and parameters.
     * @remarks
     * This method is intended to be used to send requests to the Windows Store for operations that do not yet have a corresponding API available in the Windows SDK. For more information about using this method, including details about the requests that are currently available, see [Send requests to the Store](/windows/uwp/monetize/send-requests-to-the-store).
     * @param {StoreContext} context_ An object that specifies the user for which to perform the operation. If your app is a single-user app (that is, it runs only in the context of the user that launched the app), use the [StoreContext.GetDefault](storecontext_getdefault_846721868.md) method to get a [StoreContext](storecontext.md) object that you can use to send a request that operates in the context of the user. If your app is a multi-user app, use the [StoreContext.GetForUser](storecontext_getforuser_2058550280.md) method to get a [StoreContext](storecontext.md) object that you can use to send a request that operates in the context of a specific user.
     * @param {Integer} requestKind A value that identifies the request that you want to send to the Windows Store.
     * @param {HSTRING} parametersAsJson A JSON-formatted string that contains the arguments to pass to the request.
     * @returns {IAsyncOperation<StoreSendRequestResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storerequesthelper.sendrequestasync
     */
    static SendRequestAsync(context_, requestKind, parametersAsJson) {
        if (!StoreRequestHelper.HasProp("__IStoreRequestHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Store.StoreRequestHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreRequestHelperStatics.IID)
            StoreRequestHelper.__IStoreRequestHelperStatics := IStoreRequestHelperStatics(factoryPtr)
        }

        return StoreRequestHelper.__IStoreRequestHelperStatics.SendRequestAsync(context_, requestKind, parametersAsJson)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
