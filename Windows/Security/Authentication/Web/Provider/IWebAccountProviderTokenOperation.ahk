#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\WebProviderTokenRequest.ahk
#Include ..\..\..\..\Foundation\Collections\IVector.ahk
#Include .\WebProviderTokenResponse.ahk
#Include ..\..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines properties for web account provider token operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.iwebaccountprovidertokenoperation
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebAccountProviderTokenOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountProviderTokenOperation
     * @type {Guid}
     */
    static IID => Guid("{95c613be-2034-4c38-9434-d26c14b2b4b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProviderRequest", "get_ProviderResponses", "put_CacheExpirationTime", "get_CacheExpirationTime"]

    /**
     * Gets the web provider token request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.iwebaccountprovidertokenoperation.providerrequest
     * @type {WebProviderTokenRequest} 
     */
    ProviderRequest {
        get => this.get_ProviderRequest()
    }

    /**
     * Gets the web provider token responses.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.iwebaccountprovidertokenoperation.providerresponses
     * @type {IVector<WebProviderTokenResponse>} 
     */
    ProviderResponses {
        get => this.get_ProviderResponses()
    }

    /**
     * Gets or sets the cache expiration time.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.iwebaccountprovidertokenoperation.cacheexpirationtime
     * @type {DateTime} 
     */
    CacheExpirationTime {
        get => this.get_CacheExpirationTime()
        set => this.put_CacheExpirationTime(value)
    }

    /**
     * 
     * @returns {WebProviderTokenRequest} 
     */
    get_ProviderRequest() {
        result := ComCall(6, this, "ptr*", &webTokenRequest_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebProviderTokenRequest(webTokenRequest_)
    }

    /**
     * 
     * @returns {IVector<WebProviderTokenResponse>} 
     */
    get_ProviderResponses() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(WebProviderTokenResponse, value)
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_CacheExpirationTime(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_CacheExpirationTime() {
        value := DateTime()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
