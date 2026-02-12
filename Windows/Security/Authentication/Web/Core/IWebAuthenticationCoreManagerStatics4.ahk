#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include .\FindAllAccountsResult.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Credentials\WebAccountProvider.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationCoreManagerStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationCoreManagerStatics4
     * @type {Guid}
     */
    static IID => Guid("{54e633fe-96e0-41e8-9832-1298897c2aaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAllAccountsAsync", "FindAllAccountsWithClientIdAsync", "FindSystemAccountProviderAsync", "FindSystemAccountProviderWithAuthorityAsync", "FindSystemAccountProviderWithAuthorityForUserAsync"]

    /**
     * 
     * @param {WebAccountProvider} provider 
     * @returns {IAsyncOperation<FindAllAccountsResult>} 
     */
    FindAllAccountsAsync(provider) {
        result := ComCall(6, this, "ptr", provider, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FindAllAccountsResult, operation)
    }

    /**
     * 
     * @param {WebAccountProvider} provider 
     * @param {HSTRING} clientId 
     * @returns {IAsyncOperation<FindAllAccountsResult>} 
     */
    FindAllAccountsWithClientIdAsync(provider, clientId) {
        if(clientId is String) {
            pin := HSTRING.Create(clientId)
            clientId := pin.Value
        }
        clientId := clientId is Win32Handle ? NumGet(clientId, "ptr") : clientId

        result := ComCall(7, this, "ptr", provider, "ptr", clientId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FindAllAccountsResult, operation)
    }

    /**
     * 
     * @param {HSTRING} webAccountProviderId 
     * @returns {IAsyncOperation<WebAccountProvider>} 
     */
    FindSystemAccountProviderAsync(webAccountProviderId) {
        if(webAccountProviderId is String) {
            pin := HSTRING.Create(webAccountProviderId)
            webAccountProviderId := pin.Value
        }
        webAccountProviderId := webAccountProviderId is Win32Handle ? NumGet(webAccountProviderId, "ptr") : webAccountProviderId

        result := ComCall(8, this, "ptr", webAccountProviderId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccountProvider, operation)
    }

    /**
     * 
     * @param {HSTRING} webAccountProviderId 
     * @param {HSTRING} authority 
     * @returns {IAsyncOperation<WebAccountProvider>} 
     */
    FindSystemAccountProviderWithAuthorityAsync(webAccountProviderId, authority) {
        if(webAccountProviderId is String) {
            pin := HSTRING.Create(webAccountProviderId)
            webAccountProviderId := pin.Value
        }
        webAccountProviderId := webAccountProviderId is Win32Handle ? NumGet(webAccountProviderId, "ptr") : webAccountProviderId
        if(authority is String) {
            pin := HSTRING.Create(authority)
            authority := pin.Value
        }
        authority := authority is Win32Handle ? NumGet(authority, "ptr") : authority

        result := ComCall(9, this, "ptr", webAccountProviderId, "ptr", authority, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccountProvider, operation)
    }

    /**
     * 
     * @param {HSTRING} webAccountProviderId 
     * @param {HSTRING} authority 
     * @param {User} user_ 
     * @returns {IAsyncOperation<WebAccountProvider>} 
     */
    FindSystemAccountProviderWithAuthorityForUserAsync(webAccountProviderId, authority, user_) {
        if(webAccountProviderId is String) {
            pin := HSTRING.Create(webAccountProviderId)
            webAccountProviderId := pin.Value
        }
        webAccountProviderId := webAccountProviderId is Win32Handle ? NumGet(webAccountProviderId, "ptr") : webAccountProviderId
        if(authority is String) {
            pin := HSTRING.Create(authority)
            authority := pin.Value
        }
        authority := authority is Win32Handle ? NumGet(authority, "ptr") : authority

        result := ComCall(10, this, "ptr", webAccountProviderId, "ptr", authority, "ptr", user_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccountProvider, operation)
    }
}
