#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\UserDataAccountPartnerAccountInfo.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts.Provider
 * @version WindowsRuntime 1.4
 */
class IUserDataAccountProviderAddAccountOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccountProviderAddAccountOperation
     * @type {Guid}
     */
    static IID => Guid("{b9c72530-3f84-4b5d-8eaa-45e97aa842ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentKinds", "get_PartnerAccountInfos", "ReportCompleted"]

    /**
     * @type {Integer} 
     */
    ContentKinds {
        get => this.get_ContentKinds()
    }

    /**
     * @type {IVectorView<UserDataAccountPartnerAccountInfo>} 
     */
    PartnerAccountInfos {
        get => this.get_PartnerAccountInfos()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentKinds() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<UserDataAccountPartnerAccountInfo>} 
     */
    get_PartnerAccountInfos() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UserDataAccountPartnerAccountInfo, value)
    }

    /**
     * 
     * @param {HSTRING} userDataAccountId 
     * @returns {HRESULT} 
     */
    ReportCompleted(userDataAccountId) {
        if(userDataAccountId is String) {
            pin := HSTRING.Create(userDataAccountId)
            userDataAccountId := pin.Value
        }
        userDataAccountId := userDataAccountId is Win32Handle ? NumGet(userDataAccountId, "ptr") : userDataAccountId

        result := ComCall(8, this, "ptr", userDataAccountId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
