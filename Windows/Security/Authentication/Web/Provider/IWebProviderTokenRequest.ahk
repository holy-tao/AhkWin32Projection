#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\Core\WebTokenRequest.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Credentials\WebAccount.ahk
#Include ..\..\..\..\Foundation\Uri.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Cryptography\Core\CryptographicKey.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebProviderTokenRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebProviderTokenRequest
     * @type {Guid}
     */
    static IID => Guid("{1e18778b-8805-454b-9f11-468d2af1095a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClientRequest", "get_WebAccounts", "get_WebAccountSelectionOptions", "get_ApplicationCallbackUri", "GetApplicationTokenBindingKeyAsync"]

    /**
     * @type {WebTokenRequest} 
     */
    ClientRequest {
        get => this.get_ClientRequest()
    }

    /**
     * @type {IVectorView<WebAccount>} 
     */
    WebAccounts {
        get => this.get_WebAccounts()
    }

    /**
     * @type {Integer} 
     */
    WebAccountSelectionOptions {
        get => this.get_WebAccountSelectionOptions()
    }

    /**
     * @type {Uri} 
     */
    ApplicationCallbackUri {
        get => this.get_ApplicationCallbackUri()
    }

    /**
     * 
     * @returns {WebTokenRequest} 
     */
    get_ClientRequest() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebTokenRequest(value)
    }

    /**
     * 
     * @returns {IVectorView<WebAccount>} 
     */
    get_WebAccounts() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WebAccount, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WebAccountSelectionOptions() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ApplicationCallbackUri() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Integer} keyType 
     * @param {Uri} target 
     * @returns {IAsyncOperation<CryptographicKey>} 
     */
    GetApplicationTokenBindingKeyAsync(keyType, target) {
        result := ComCall(10, this, "int", keyType, "ptr", target, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CryptographicKey, asyncInfo)
    }
}
