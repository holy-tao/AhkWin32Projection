#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\UserDataAccountStore.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class IUserDataAccountManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccountManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{0d9b89ea-1928-4a20-86d5-3c737f7dc3b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestStoreAsync", "ShowAddAccountAsync", "ShowAccountSettingsAsync", "ShowAccountErrorResolverAsync"]

    /**
     * 
     * @param {Integer} storeAccessType 
     * @returns {IAsyncOperation<UserDataAccountStore>} 
     */
    RequestStoreAsync(storeAccessType) {
        result := ComCall(6, this, "int", storeAccessType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataAccountStore, result_)
    }

    /**
     * 
     * @param {Integer} contentKinds 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowAddAccountAsync(contentKinds) {
        result := ComCall(7, this, "uint", contentKinds, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncAction} 
     */
    ShowAccountSettingsAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(8, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncAction} 
     */
    ShowAccountErrorResolverAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(9, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
