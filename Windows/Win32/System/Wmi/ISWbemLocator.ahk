#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISWbemServices.ahk
#Include .\ISWbemSecurity.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemLocator extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectServer", "get_Security_"]

    /**
     * @type {ISWbemSecurity} 
     */
    Security_ {
        get => this.get_Security_()
    }

    /**
     * 
     * @param {BSTR} strServer 
     * @param {BSTR} strNamespace 
     * @param {BSTR} strUser 
     * @param {BSTR} strPassword 
     * @param {BSTR} strLocale 
     * @param {BSTR} strAuthority 
     * @param {Integer} iSecurityFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemServices} 
     */
    ConnectServer(strServer, strNamespace, strUser, strPassword, strLocale, strAuthority, iSecurityFlags, objWbemNamedValueSet) {
        if(strServer is String) {
            pin := BSTR.Alloc(strServer)
            strServer := pin.Value
        }
        if(strNamespace is String) {
            pin := BSTR.Alloc(strNamespace)
            strNamespace := pin.Value
        }
        if(strUser is String) {
            pin := BSTR.Alloc(strUser)
            strUser := pin.Value
        }
        if(strPassword is String) {
            pin := BSTR.Alloc(strPassword)
            strPassword := pin.Value
        }
        if(strLocale is String) {
            pin := BSTR.Alloc(strLocale)
            strLocale := pin.Value
        }
        if(strAuthority is String) {
            pin := BSTR.Alloc(strAuthority)
            strAuthority := pin.Value
        }

        result := ComCall(7, this, "ptr", strServer, "ptr", strNamespace, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "ptr", strAuthority, "int", iSecurityFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemServices := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemServices(objWbemServices)
    }

    /**
     * 
     * @returns {ISWbemSecurity} 
     */
    get_Security_() {
        result := ComCall(8, this, "ptr*", &objWbemSecurity := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemSecurity(objWbemSecurity)
    }
}
