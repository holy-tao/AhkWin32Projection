#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\WebAuthenticationResult.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationBrokerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationBrokerStatics
     * @type {Guid}
     */
    static IID => Guid("{2f149f1a-e673-40b5-bc22-201a6864a37b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AuthenticateWithCallbackUriAsync", "AuthenticateWithoutCallbackUriAsync", "GetCurrentApplicationCallbackUri"]

    /**
     * 
     * @param {Integer} options 
     * @param {Uri} requestUri 
     * @param {Uri} callbackUri 
     * @returns {IAsyncOperation<WebAuthenticationResult>} 
     */
    AuthenticateWithCallbackUriAsync(options, requestUri, callbackUri) {
        result := ComCall(6, this, "uint", options, "ptr", requestUri, "ptr", callbackUri, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAuthenticationResult, asyncInfo)
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Uri} requestUri 
     * @returns {IAsyncOperation<WebAuthenticationResult>} 
     */
    AuthenticateWithoutCallbackUriAsync(options, requestUri) {
        result := ComCall(7, this, "uint", options, "ptr", requestUri, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAuthenticationResult, asyncInfo)
    }

    /**
     * 
     * @returns {Uri} 
     */
    GetCurrentApplicationCallbackUri() {
        result := ComCall(8, this, "ptr*", &callbackUri := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(callbackUri)
    }
}
