#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HttpCookieCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpCookieManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpCookieManager
     * @type {Guid}
     */
    static IID => Guid("{7a431780-cd4f-4e57-a84a-5b0a53d6bb96}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCookie", "SetCookieWithThirdParty", "DeleteCookie", "GetCookies"]

    /**
     * 
     * @param {HttpCookie} cookie 
     * @returns {Boolean} 
     */
    SetCookie(cookie) {
        result := ComCall(6, this, "ptr", cookie, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HttpCookie} cookie 
     * @param {Boolean} thirdParty 
     * @returns {Boolean} 
     */
    SetCookieWithThirdParty(cookie, thirdParty) {
        result := ComCall(7, this, "ptr", cookie, "int", thirdParty, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HttpCookie} cookie 
     * @returns {HRESULT} 
     */
    DeleteCookie(cookie) {
        result := ComCall(8, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {HttpCookieCollection} 
     */
    GetCookies(uri_) {
        result := ComCall(9, this, "ptr", uri_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpCookieCollection(result_)
    }
}
