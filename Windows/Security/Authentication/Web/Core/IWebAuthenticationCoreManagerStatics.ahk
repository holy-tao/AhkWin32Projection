#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include .\WebTokenRequestResult.ahk
#Include ..\..\..\Credentials\WebAccount.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Credentials\WebAccountProvider.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationCoreManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationCoreManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{6aca7c92-a581-4479-9c10-752eff44fd34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTokenSilentlyAsync", "GetTokenSilentlyWithWebAccountAsync", "RequestTokenAsync", "RequestTokenWithWebAccountAsync", "FindAccountAsync", "FindAccountProviderAsync", "FindAccountProviderWithAuthorityAsync"]

    /**
     * 
     * @param {WebTokenRequest} request 
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     */
    GetTokenSilentlyAsync(request) {
        result := ComCall(6, this, "ptr", request, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebTokenRequestResult, asyncInfo)
    }

    /**
     * 
     * @param {WebTokenRequest} request 
     * @param {WebAccount} webAccount_ 
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     */
    GetTokenSilentlyWithWebAccountAsync(request, webAccount_) {
        result := ComCall(7, this, "ptr", request, "ptr", webAccount_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebTokenRequestResult, asyncInfo)
    }

    /**
     * 
     * @param {WebTokenRequest} request 
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     */
    RequestTokenAsync(request) {
        result := ComCall(8, this, "ptr", request, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebTokenRequestResult, asyncInfo)
    }

    /**
     * 
     * @param {WebTokenRequest} request 
     * @param {WebAccount} webAccount_ 
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     */
    RequestTokenWithWebAccountAsync(request, webAccount_) {
        result := ComCall(9, this, "ptr", request, "ptr", webAccount_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebTokenRequestResult, asyncInfo)
    }

    /**
     * 
     * @param {WebAccountProvider} provider 
     * @param {HSTRING} webAccountId 
     * @returns {IAsyncOperation<WebAccount>} 
     */
    FindAccountAsync(provider, webAccountId) {
        if(webAccountId is String) {
            pin := HSTRING.Create(webAccountId)
            webAccountId := pin.Value
        }
        webAccountId := webAccountId is Win32Handle ? NumGet(webAccountId, "ptr") : webAccountId

        result := ComCall(10, this, "ptr", provider, "ptr", webAccountId, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccount, asyncInfo)
    }

    /**
     * 
     * @param {HSTRING} webAccountProviderId 
     * @returns {IAsyncOperation<WebAccountProvider>} 
     */
    FindAccountProviderAsync(webAccountProviderId) {
        if(webAccountProviderId is String) {
            pin := HSTRING.Create(webAccountProviderId)
            webAccountProviderId := pin.Value
        }
        webAccountProviderId := webAccountProviderId is Win32Handle ? NumGet(webAccountProviderId, "ptr") : webAccountProviderId

        result := ComCall(11, this, "ptr", webAccountProviderId, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccountProvider, asyncInfo)
    }

    /**
     * 
     * @param {HSTRING} webAccountProviderId 
     * @param {HSTRING} authority 
     * @returns {IAsyncOperation<WebAccountProvider>} 
     */
    FindAccountProviderWithAuthorityAsync(webAccountProviderId, authority) {
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

        result := ComCall(12, this, "ptr", webAccountProviderId, "ptr", authority, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccountProvider, asyncInfo)
    }
}
