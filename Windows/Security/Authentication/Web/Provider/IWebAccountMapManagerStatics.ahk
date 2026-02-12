#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Credentials\WebAccount.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebAccountMapManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountMapManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{e8fa446f-3a1b-48a4-8e90-1e59ca6f54db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddWebAccountWithScopeAndMapAsync", "SetPerAppToPerUserAccountAsync", "GetPerUserFromPerAppAccountAsync", "ClearPerUserFromPerAppAccountAsync"]

    /**
     * 
     * @param {HSTRING} webAccountId 
     * @param {HSTRING} webAccountUserName 
     * @param {IMapView<HSTRING, HSTRING>} props 
     * @param {Integer} scope 
     * @param {HSTRING} perUserWebAccountId 
     * @returns {IAsyncOperation<WebAccount>} 
     */
    AddWebAccountWithScopeAndMapAsync(webAccountId, webAccountUserName, props, scope, perUserWebAccountId) {
        if(webAccountId is String) {
            pin := HSTRING.Create(webAccountId)
            webAccountId := pin.Value
        }
        webAccountId := webAccountId is Win32Handle ? NumGet(webAccountId, "ptr") : webAccountId
        if(webAccountUserName is String) {
            pin := HSTRING.Create(webAccountUserName)
            webAccountUserName := pin.Value
        }
        webAccountUserName := webAccountUserName is Win32Handle ? NumGet(webAccountUserName, "ptr") : webAccountUserName
        if(perUserWebAccountId is String) {
            pin := HSTRING.Create(perUserWebAccountId)
            perUserWebAccountId := pin.Value
        }
        perUserWebAccountId := perUserWebAccountId is Win32Handle ? NumGet(perUserWebAccountId, "ptr") : perUserWebAccountId

        result := ComCall(6, this, "ptr", webAccountId, "ptr", webAccountUserName, "ptr", props, "int", scope, "ptr", perUserWebAccountId, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccount, asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} perAppAccount 
     * @param {HSTRING} perUserWebAccountId 
     * @returns {IAsyncAction} 
     */
    SetPerAppToPerUserAccountAsync(perAppAccount, perUserWebAccountId) {
        if(perUserWebAccountId is String) {
            pin := HSTRING.Create(perUserWebAccountId)
            perUserWebAccountId := pin.Value
        }
        perUserWebAccountId := perUserWebAccountId is Win32Handle ? NumGet(perUserWebAccountId, "ptr") : perUserWebAccountId

        result := ComCall(7, this, "ptr", perAppAccount, "ptr", perUserWebAccountId, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} perAppAccount 
     * @returns {IAsyncOperation<WebAccount>} 
     */
    GetPerUserFromPerAppAccountAsync(perAppAccount) {
        result := ComCall(8, this, "ptr", perAppAccount, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccount, asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} perAppAccount 
     * @returns {IAsyncAction} 
     */
    ClearPerUserFromPerAppAccountAsync(perAppAccount) {
        result := ComCall(9, this, "ptr", perAppAccount, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
