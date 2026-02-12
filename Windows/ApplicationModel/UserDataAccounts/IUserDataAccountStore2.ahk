#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\UserDataAccount.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class IUserDataAccountStore2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccountStore2
     * @type {Guid}
     */
    static IID => Guid("{b1e0aef7-9560-4631-8af0-061d30161469}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAccountWithPackageRelativeAppIdAsync", "add_StoreChanged", "remove_StoreChanged"]

    /**
     * 
     * @param {HSTRING} userDisplayName 
     * @param {HSTRING} packageRelativeAppId 
     * @returns {IAsyncOperation<UserDataAccount>} 
     */
    CreateAccountWithPackageRelativeAppIdAsync(userDisplayName, packageRelativeAppId) {
        if(userDisplayName is String) {
            pin := HSTRING.Create(userDisplayName)
            userDisplayName := pin.Value
        }
        userDisplayName := userDisplayName is Win32Handle ? NumGet(userDisplayName, "ptr") : userDisplayName
        if(packageRelativeAppId is String) {
            pin := HSTRING.Create(packageRelativeAppId)
            packageRelativeAppId := pin.Value
        }
        packageRelativeAppId := packageRelativeAppId is Win32Handle ? NumGet(packageRelativeAppId, "ptr") : packageRelativeAppId

        result := ComCall(6, this, "ptr", userDisplayName, "ptr", packageRelativeAppId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataAccount, result_)
    }

    /**
     * 
     * @param {TypedEventHandler<UserDataAccountStore, UserDataAccountStoreChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StoreChanged(handler) {
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
    remove_StoreChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
