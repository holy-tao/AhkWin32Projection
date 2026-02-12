#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WebTokenResponse.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebTokenResponseFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebTokenResponseFactory
     * @type {Guid}
     */
    static IID => Guid("{ab6bf7f8-5450-4ef6-97f7-052b0431c0f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithToken", "CreateWithTokenAndAccount", "CreateWithTokenAccountAndError"]

    /**
     * 
     * @param {HSTRING} token 
     * @returns {WebTokenResponse} 
     */
    CreateWithToken(token) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(6, this, "ptr", token, "ptr*", &webTokenResponse_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebTokenResponse(webTokenResponse_)
    }

    /**
     * 
     * @param {HSTRING} token 
     * @param {WebAccount} webAccount_ 
     * @returns {WebTokenResponse} 
     */
    CreateWithTokenAndAccount(token, webAccount_) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "ptr", webAccount_, "ptr*", &webTokenResponse_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebTokenResponse(webTokenResponse_)
    }

    /**
     * 
     * @param {HSTRING} token 
     * @param {WebAccount} webAccount_ 
     * @param {WebProviderError} error 
     * @returns {WebTokenResponse} 
     */
    CreateWithTokenAccountAndError(token, webAccount_, error) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "ptr", webAccount_, "ptr", error, "ptr*", &webTokenResponse_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebTokenResponse(webTokenResponse_)
    }
}
