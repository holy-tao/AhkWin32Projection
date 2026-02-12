#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HttpCacheControl.ahk
#Include ..\HttpCookieManager.ahk
#Include ..\..\..\Security\Cryptography\Certificates\Certificate.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Security\Credentials\PasswordCredential.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class IHttpBaseProtocolFilter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpBaseProtocolFilter
     * @type {Guid}
     */
    static IID => Guid("{71c89b09-e131-4b54-a53c-eb43ff37e9bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowAutoRedirect", "put_AllowAutoRedirect", "get_AllowUI", "put_AllowUI", "get_AutomaticDecompression", "put_AutomaticDecompression", "get_CacheControl", "get_CookieManager", "get_ClientCertificate", "put_ClientCertificate", "get_IgnorableServerCertificateErrors", "get_MaxConnectionsPerServer", "put_MaxConnectionsPerServer", "get_ProxyCredential", "put_ProxyCredential", "get_ServerCredential", "put_ServerCredential", "get_UseProxy", "put_UseProxy"]

    /**
     * @type {Boolean} 
     */
    AllowAutoRedirect {
        get => this.get_AllowAutoRedirect()
        set => this.put_AllowAutoRedirect(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowUI {
        get => this.get_AllowUI()
        set => this.put_AllowUI(value)
    }

    /**
     * @type {Boolean} 
     */
    AutomaticDecompression {
        get => this.get_AutomaticDecompression()
        set => this.put_AutomaticDecompression(value)
    }

    /**
     * @type {HttpCacheControl} 
     */
    CacheControl {
        get => this.get_CacheControl()
    }

    /**
     * @type {HttpCookieManager} 
     */
    CookieManager {
        get => this.get_CookieManager()
    }

    /**
     * @type {Certificate} 
     */
    ClientCertificate {
        get => this.get_ClientCertificate()
        set => this.put_ClientCertificate(value)
    }

    /**
     * @type {IVector<Integer>} 
     */
    IgnorableServerCertificateErrors {
        get => this.get_IgnorableServerCertificateErrors()
    }

    /**
     * @type {Integer} 
     */
    MaxConnectionsPerServer {
        get => this.get_MaxConnectionsPerServer()
        set => this.put_MaxConnectionsPerServer(value)
    }

    /**
     * @type {PasswordCredential} 
     */
    ProxyCredential {
        get => this.get_ProxyCredential()
        set => this.put_ProxyCredential(value)
    }

    /**
     * @type {PasswordCredential} 
     */
    ServerCredential {
        get => this.get_ServerCredential()
        set => this.put_ServerCredential(value)
    }

    /**
     * @type {Boolean} 
     */
    UseProxy {
        get => this.get_UseProxy()
        set => this.put_UseProxy(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowAutoRedirect() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowAutoRedirect(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowUI() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowUI(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutomaticDecompression() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutomaticDecompression(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpCacheControl} 
     */
    get_CacheControl() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpCacheControl(value)
    }

    /**
     * 
     * @returns {HttpCookieManager} 
     */
    get_CookieManager() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpCookieManager(value)
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ClientCertificate() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Certificate(value)
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_ClientCertificate(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_IgnorableServerCertificateErrors() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxConnectionsPerServer() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxConnectionsPerServer(value) {
        result := ComCall(18, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ProxyCredential() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ProxyCredential(value) {
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ServerCredential() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ServerCredential(value) {
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseProxy() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseProxy(value) {
        result := ComCall(24, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
