#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWSManConnectionOptionsEx.ahk

/**
 * The IWSManConnectionOptionsEx2 object is passed to the IWSMan::CreateSession method to provide the authentication mechanism, access type, and credentials to connect to a proxy server.
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsmanconnectionoptionsex2
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManConnectionOptionsEx2 extends IWSManConnectionOptionsEx{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSManConnectionOptionsEx2
     * @type {Guid}
     */
    static IID => Guid("{f500c9ec-24ee-48ab-b38d-fc9a164c658e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProxy", "ProxyIEConfig", "ProxyWinHttpConfig", "ProxyAutoDetect", "ProxyNoProxyServer", "ProxyAuthenticationUseNegotiate", "ProxyAuthenticationUseBasic", "ProxyAuthenticationUseDigest"]

    /**
     * 
     * @param {Integer} accessType 
     * @param {Integer} authenticationMechanism 
     * @param {BSTR} userName 
     * @param {BSTR} password 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-setproxy
     */
    SetProxy(accessType, authenticationMechanism, userName, password) {
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(12, this, "int", accessType, "int", authenticationMechanism, "ptr", userName, "ptr", password, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyieconfig
     */
    ProxyIEConfig(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxywinhttpconfig
     */
    ProxyWinHttpConfig(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyautodetect
     */
    ProxyAutoDetect(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxynoproxyserver
     */
    ProxyNoProxyServer(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyauthenticationusenegotiate
     */
    ProxyAuthenticationUseNegotiate(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyauthenticationusebasic
     */
    ProxyAuthenticationUseBasic(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyauthenticationusedigest
     */
    ProxyAuthenticationUseDigest(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, valueMarshal, value, "HRESULT")
        return result
    }
}
