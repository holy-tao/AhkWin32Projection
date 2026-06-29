#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISWbemServices.ahk" { ISWbemServices }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISWbemSecurity.ahk" { ISWbemSecurity }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemLocator extends IDispatch {
    /**
     * The interface identifier for ISWbemLocator
     * @type {Guid}
     */
    static IID := Guid("{76a6415b-cb41-11d1-8b02-00600806d9b6}")

    /**
     * The class identifier for SWbemLocator
     * @type {Guid}
     */
    static CLSID := Guid("{76a64158-cb41-11d1-8b02-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemLocator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ConnectServer : IntPtr
        get_Security_ : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        strServer := strServer is String ? BSTR.Alloc(strServer).Value : strServer
        strNamespace := strNamespace is String ? BSTR.Alloc(strNamespace).Value : strNamespace
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale
        strAuthority := strAuthority is String ? BSTR.Alloc(strAuthority).Value : strAuthority

        result := ComCall(7, this, BSTR, strServer, BSTR, strNamespace, BSTR, strUser, BSTR, strPassword, BSTR, strLocale, BSTR, strAuthority, "int", iSecurityFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemServices := 0, "HRESULT")
        return ISWbemServices(objWbemServices)
    }

    /**
     * 
     * @returns {ISWbemSecurity} 
     */
    get_Security_() {
        result := ComCall(8, this, "ptr*", &objWbemSecurity := 0, "HRESULT")
        return ISWbemSecurity(objWbemSecurity)
    }

    Query(iid) {
        if (ISWbemLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectServer := CallbackCreate(GetMethod(implObj, "ConnectServer"), flags, 10)
        this.vtbl.get_Security_ := CallbackCreate(GetMethod(implObj, "get_Security_"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectServer)
        CallbackFree(this.vtbl.get_Security_)
    }
}
