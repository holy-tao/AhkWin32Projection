#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\UserDataAccount.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class IUserDataAccountStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccountStore
     * @type {Guid}
     */
    static IID => Guid("{2073b0ad-7d0a-4e76-bf45-2368f978a59a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAccountsAsync", "GetAccountAsync", "CreateAccountAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<UserDataAccount>>} 
     */
    FindAccountsAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, UserDataAccount), result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncOperation<UserDataAccount>} 
     */
    GetAccountAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(7, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataAccount, result_)
    }

    /**
     * 
     * @param {HSTRING} userDisplayName 
     * @returns {IAsyncOperation<UserDataAccount>} 
     */
    CreateAccountAsync(userDisplayName) {
        if(userDisplayName is String) {
            pin := HSTRING.Create(userDisplayName)
            userDisplayName := pin.Value
        }
        userDisplayName := userDisplayName is Win32Handle ? NumGet(userDisplayName, "ptr") : userDisplayName

        result := ComCall(8, this, "ptr", userDisplayName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataAccount, result_)
    }
}
