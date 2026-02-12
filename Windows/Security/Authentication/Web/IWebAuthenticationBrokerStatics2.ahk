#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\WebAuthenticationResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationBrokerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationBrokerStatics2
     * @type {Guid}
     */
    static IID => Guid("{73cdfb9e-14e7-41da-a971-aaf4410b621e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AuthenticateAndContinue", "AuthenticateWithCallbackUriAndContinue", "AuthenticateWithCallbackUriContinuationDataAndOptionsAndContinue", "AuthenticateSilentlyAsync", "AuthenticateSilentlyWithOptionsAsync"]

    /**
     * 
     * @param {Uri} requestUri 
     * @returns {HRESULT} 
     */
    AuthenticateAndContinue(requestUri) {
        result := ComCall(6, this, "ptr", requestUri, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Uri} requestUri 
     * @param {Uri} callbackUri 
     * @returns {HRESULT} 
     */
    AuthenticateWithCallbackUriAndContinue(requestUri, callbackUri) {
        result := ComCall(7, this, "ptr", requestUri, "ptr", callbackUri, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Uri} requestUri 
     * @param {Uri} callbackUri 
     * @param {ValueSet} continuationData 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    AuthenticateWithCallbackUriContinuationDataAndOptionsAndContinue(requestUri, callbackUri, continuationData, options) {
        result := ComCall(8, this, "ptr", requestUri, "ptr", callbackUri, "ptr", continuationData, "uint", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Uri} requestUri 
     * @returns {IAsyncOperation<WebAuthenticationResult>} 
     */
    AuthenticateSilentlyAsync(requestUri) {
        result := ComCall(9, this, "ptr", requestUri, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAuthenticationResult, asyncInfo)
    }

    /**
     * 
     * @param {Uri} requestUri 
     * @param {Integer} options 
     * @returns {IAsyncOperation<WebAuthenticationResult>} 
     */
    AuthenticateSilentlyWithOptionsAsync(requestUri, options) {
        result := ComCall(10, this, "ptr", requestUri, "uint", options, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAuthenticationResult, asyncInfo)
    }
}
