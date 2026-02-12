#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\StoreSendRequestResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreRequestHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreRequestHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{6ce5e5f9-a0c9-4b2c-96a6-a171c630038d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendRequestAsync"]

    /**
     * 
     * @param {StoreContext} context_ 
     * @param {Integer} requestKind 
     * @param {HSTRING} parametersAsJson 
     * @returns {IAsyncOperation<StoreSendRequestResult>} 
     */
    SendRequestAsync(context_, requestKind, parametersAsJson) {
        if(parametersAsJson is String) {
            pin := HSTRING.Create(parametersAsJson)
            parametersAsJson := pin.Value
        }
        parametersAsJson := parametersAsJson is Win32Handle ? NumGet(parametersAsJson, "ptr") : parametersAsJson

        result := ComCall(6, this, "ptr", context_, "uint", requestKind, "ptr", parametersAsJson, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreSendRequestResult, operation)
    }
}
