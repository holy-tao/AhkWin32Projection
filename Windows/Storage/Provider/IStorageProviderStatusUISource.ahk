#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StorageProviderStatusUI.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The contract implemented by a cloud files provider, which is required to use the storage provider status UI flyout.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderstatusuisource
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderStatusUISource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderStatusUISource
     * @type {Guid}
     */
    static IID => Guid("{a306c249-3d66-5e70-9007-e43df96051ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatusUI", "add_StatusUIChanged", "remove_StatusUIChanged"]

    /**
     * Gets the [StorageProviderStatusUI](storageproviderstatusui.md) object from an implementation of the [IStorageProviderStatusUISource](istorageproviderstatusuisource.md).
     * @returns {StorageProviderStatusUI} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderstatusuisource.getstatusui
     */
    GetStatusUI() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderStatusUI(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<IStorageProviderStatusUISource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusUIChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusUIChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
