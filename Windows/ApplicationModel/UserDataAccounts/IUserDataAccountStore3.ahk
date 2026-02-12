#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\UserDataAccount.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class IUserDataAccountStore3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccountStore3
     * @type {Guid}
     */
    static IID => Guid("{8142c094-f3c9-478b-b117-6585bebb6789}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAccountWithPackageRelativeAppIdAndEnterpriseIdAsync"]

    /**
     * 
     * @param {HSTRING} userDisplayName 
     * @param {HSTRING} packageRelativeAppId 
     * @param {HSTRING} enterpriseId 
     * @returns {IAsyncOperation<UserDataAccount>} 
     */
    CreateAccountWithPackageRelativeAppIdAndEnterpriseIdAsync(userDisplayName, packageRelativeAppId, enterpriseId) {
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
        if(enterpriseId is String) {
            pin := HSTRING.Create(enterpriseId)
            enterpriseId := pin.Value
        }
        enterpriseId := enterpriseId is Win32Handle ? NumGet(enterpriseId, "ptr") : enterpriseId

        result := ComCall(6, this, "ptr", userDisplayName, "ptr", packageRelativeAppId, "ptr", enterpriseId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataAccount, result_)
    }
}
