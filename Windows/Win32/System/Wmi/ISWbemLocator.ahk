#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemLocator extends IDispatch{
    /**
     * The interface identifier for ISWbemLocator
     * @type {Guid}
     */
    static IID => Guid("{76a6415b-cb41-11d1-8b02-00600806d9b6}")

    /**
     * The class identifier for SWbemLocator
     * @type {Guid}
     */
    static CLSID => Guid("{76a64158-cb41-11d1-8b02-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} strServer 
     * @param {BSTR} strNamespace 
     * @param {BSTR} strUser 
     * @param {BSTR} strPassword 
     * @param {BSTR} strLocale 
     * @param {BSTR} strAuthority 
     * @param {Integer} iSecurityFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<ISWbemServices>} objWbemServices 
     * @returns {HRESULT} 
     */
    ConnectServer(strServer, strNamespace, strUser, strPassword, strLocale, strAuthority, iSecurityFlags, objWbemNamedValueSet, objWbemServices) {
        strServer := strServer is String ? BSTR.Alloc(strServer).Value : strServer
        strNamespace := strNamespace is String ? BSTR.Alloc(strNamespace).Value : strNamespace
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale
        strAuthority := strAuthority is String ? BSTR.Alloc(strAuthority).Value : strAuthority

        result := ComCall(7, this, "ptr", strServer, "ptr", strNamespace, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "ptr", strAuthority, "int", iSecurityFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemServices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemSecurity>} objWbemSecurity 
     * @returns {HRESULT} 
     */
    get_Security_(objWbemSecurity) {
        result := ComCall(8, this, "ptr", objWbemSecurity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
