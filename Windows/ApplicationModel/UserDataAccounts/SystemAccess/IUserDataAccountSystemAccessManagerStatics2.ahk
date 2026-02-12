#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\DeviceAccountConfiguration.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts.SystemAccess
 * @version WindowsRuntime 1.4
 */
class IUserDataAccountSystemAccessManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccountSystemAccessManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{943f854d-4b4e-439f-83d3-979b27c05ac7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SuppressLocalAccountWithAccountAsync", "CreateDeviceAccountAsync", "DeleteDeviceAccountAsync", "GetDeviceAccountConfigurationAsync"]

    /**
     * 
     * @param {HSTRING} userDataAccountId 
     * @returns {IAsyncAction} 
     */
    SuppressLocalAccountWithAccountAsync(userDataAccountId) {
        if(userDataAccountId is String) {
            pin := HSTRING.Create(userDataAccountId)
            userDataAccountId := pin.Value
        }
        userDataAccountId := userDataAccountId is Win32Handle ? NumGet(userDataAccountId, "ptr") : userDataAccountId

        result := ComCall(6, this, "ptr", userDataAccountId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {DeviceAccountConfiguration} account 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    CreateDeviceAccountAsync(account) {
        result := ComCall(7, this, "ptr", account, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {HSTRING} accountId 
     * @returns {IAsyncAction} 
     */
    DeleteDeviceAccountAsync(accountId) {
        if(accountId is String) {
            pin := HSTRING.Create(accountId)
            accountId := pin.Value
        }
        accountId := accountId is Win32Handle ? NumGet(accountId, "ptr") : accountId

        result := ComCall(8, this, "ptr", accountId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} accountId 
     * @returns {IAsyncOperation<DeviceAccountConfiguration>} 
     */
    GetDeviceAccountConfigurationAsync(accountId) {
        if(accountId is String) {
            pin := HSTRING.Create(accountId)
            accountId := pin.Value
        }
        accountId := accountId is Win32Handle ? NumGet(accountId, "ptr") : accountId

        result := ComCall(9, this, "ptr", accountId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceAccountConfiguration, result_)
    }
}
