#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Credentials\WebAccount.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\WebAccountClientView.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebAccountManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{b2e8e1a6-d49a-4032-84bf-1a2847747bf1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateWebAccountPropertiesAsync", "AddWebAccountAsync", "DeleteWebAccountAsync", "FindAllProviderWebAccountsAsync", "PushCookiesAsync", "SetViewAsync", "ClearViewAsync", "GetViewsAsync", "SetWebAccountPictureAsync", "ClearWebAccountPictureAsync"]

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @param {HSTRING} webAccountUserName 
     * @param {IMapView<HSTRING, HSTRING>} additionalProperties 
     * @returns {IAsyncAction} 
     */
    UpdateWebAccountPropertiesAsync(webAccount_, webAccountUserName, additionalProperties) {
        if(webAccountUserName is String) {
            pin := HSTRING.Create(webAccountUserName)
            webAccountUserName := pin.Value
        }
        webAccountUserName := webAccountUserName is Win32Handle ? NumGet(webAccountUserName, "ptr") : webAccountUserName

        result := ComCall(6, this, "ptr", webAccount_, "ptr", webAccountUserName, "ptr", additionalProperties, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {HSTRING} webAccountId 
     * @param {HSTRING} webAccountUserName 
     * @param {IMapView<HSTRING, HSTRING>} props 
     * @returns {IAsyncOperation<WebAccount>} 
     */
    AddWebAccountAsync(webAccountId, webAccountUserName, props) {
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

        result := ComCall(7, this, "ptr", webAccountId, "ptr", webAccountUserName, "ptr", props, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccount, asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @returns {IAsyncAction} 
     */
    DeleteWebAccountAsync(webAccount_) {
        result := ComCall(8, this, "ptr", webAccount_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<WebAccount>>} 
     */
    FindAllProviderWebAccountsAsync() {
        result := ComCall(9, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, WebAccount), asyncInfo)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IVectorView<HttpCookie>} cookies 
     * @returns {IAsyncAction} 
     */
    PushCookiesAsync(uri_, cookies) {
        result := ComCall(10, this, "ptr", uri_, "ptr", cookies, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @param {WebAccountClientView} view_ 
     * @returns {IAsyncAction} 
     */
    SetViewAsync(webAccount_, view_) {
        result := ComCall(11, this, "ptr", webAccount_, "ptr", view_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @param {Uri} applicationCallbackUri 
     * @returns {IAsyncAction} 
     */
    ClearViewAsync(webAccount_, applicationCallbackUri) {
        result := ComCall(12, this, "ptr", webAccount_, "ptr", applicationCallbackUri, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @returns {IAsyncOperation<IVectorView<WebAccountClientView>>} 
     */
    GetViewsAsync(webAccount_) {
        result := ComCall(13, this, "ptr", webAccount_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, WebAccountClientView), asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @param {IRandomAccessStream} webAccountPicture 
     * @returns {IAsyncAction} 
     */
    SetWebAccountPictureAsync(webAccount_, webAccountPicture) {
        result := ComCall(14, this, "ptr", webAccount_, "ptr", webAccountPicture, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @returns {IAsyncAction} 
     */
    ClearWebAccountPictureAsync(webAccount_) {
        result := ComCall(15, this, "ptr", webAccount_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
