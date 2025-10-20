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
     * 
     * @param {Integer} accessType 
     * @param {Integer} authenticationMechanism 
     * @param {BSTR} userName 
     * @param {BSTR} password 
     * @returns {HRESULT} 
     */
    SetProxy(accessType, authenticationMechanism, userName, password) {
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(12, this, "int", accessType, "int", authenticationMechanism, "ptr", userName, "ptr", password, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    ProxyIEConfig(value) {
        result := ComCall(13, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    ProxyWinHttpConfig(value) {
        result := ComCall(14, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    ProxyAutoDetect(value) {
        result := ComCall(15, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    ProxyNoProxyServer(value) {
        result := ComCall(16, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    ProxyAuthenticationUseNegotiate(value) {
        result := ComCall(17, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    ProxyAuthenticationUseBasic(value) {
        result := ComCall(18, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    ProxyAuthenticationUseDigest(value) {
        result := ComCall(19, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
