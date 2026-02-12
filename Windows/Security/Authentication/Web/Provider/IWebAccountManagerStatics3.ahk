#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Credentials\WebAccount.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebAccountManagerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountManagerStatics3
     * @type {Guid}
     */
    static IID => Guid("{dd4523a6-8a4f-4aa2-b15e-03f550af1359}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAllProviderWebAccountsForUserAsync", "AddWebAccountForUserAsync", "AddWebAccountWithScopeForUserAsync", "AddWebAccountWithScopeAndMapForUserAsync"]

    /**
     * 
     * @param {User} user_ 
     * @returns {IAsyncOperation<IVectorView<WebAccount>>} 
     */
    FindAllProviderWebAccountsForUserAsync(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, WebAccount), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} webAccountId 
     * @param {HSTRING} webAccountUserName 
     * @param {IMapView<HSTRING, HSTRING>} props 
     * @returns {IAsyncOperation<WebAccount>} 
     */
    AddWebAccountForUserAsync(user_, webAccountId, webAccountUserName, props) {
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

        result := ComCall(7, this, "ptr", user_, "ptr", webAccountId, "ptr", webAccountUserName, "ptr", props, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccount, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} webAccountId 
     * @param {HSTRING} webAccountUserName 
     * @param {IMapView<HSTRING, HSTRING>} props 
     * @param {Integer} scope 
     * @returns {IAsyncOperation<WebAccount>} 
     */
    AddWebAccountWithScopeForUserAsync(user_, webAccountId, webAccountUserName, props, scope) {
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

        result := ComCall(8, this, "ptr", user_, "ptr", webAccountId, "ptr", webAccountUserName, "ptr", props, "int", scope, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccount, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} webAccountId 
     * @param {HSTRING} webAccountUserName 
     * @param {IMapView<HSTRING, HSTRING>} props 
     * @param {Integer} scope 
     * @param {HSTRING} perUserWebAccountId 
     * @returns {IAsyncOperation<WebAccount>} 
     */
    AddWebAccountWithScopeAndMapForUserAsync(user_, webAccountId, webAccountUserName, props, scope, perUserWebAccountId) {
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

        result := ComCall(9, this, "ptr", user_, "ptr", webAccountId, "ptr", webAccountUserName, "ptr", props, "int", scope, "ptr", perUserWebAccountId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccount, operation)
    }
}
