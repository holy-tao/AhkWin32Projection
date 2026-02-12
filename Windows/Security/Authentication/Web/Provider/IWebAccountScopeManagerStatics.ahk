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
class IWebAccountScopeManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountScopeManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{5c6ce37c-12b2-423a-bf3d-85b8d7e53656}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddWebAccountWithScopeAsync", "SetScopeAsync", "GetScope"]

    /**
     * 
     * @param {HSTRING} webAccountId 
     * @param {HSTRING} webAccountUserName 
     * @param {IMapView<HSTRING, HSTRING>} props 
     * @param {Integer} scope 
     * @returns {IAsyncOperation<WebAccount>} 
     */
    AddWebAccountWithScopeAsync(webAccountId, webAccountUserName, props, scope) {
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

        result := ComCall(6, this, "ptr", webAccountId, "ptr", webAccountUserName, "ptr", props, "int", scope, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccount, asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @param {Integer} scope 
     * @returns {IAsyncAction} 
     */
    SetScopeAsync(webAccount_, scope) {
        result := ComCall(7, this, "ptr", webAccount_, "int", scope, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @returns {Integer} 
     */
    GetScope(webAccount_) {
        result := ComCall(8, this, "ptr", webAccount_, "int*", &scope := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return scope
    }
}
