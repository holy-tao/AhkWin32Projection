#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\OBJECT_TYPE_LIST.ahk" { OBJECT_TYPE_LIST }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import "..\..\PSID.ahk" { PSID }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a means to determine effective permission for a security principal on an object.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/nn-aclui-ieffectivepermission
 * @namespace Windows.Win32.Security.Authorization.UI
 */
export default struct IEffectivePermission extends IUnknown {
    /**
     * The interface identifier for IEffectivePermission
     * @type {Guid}
     */
    static IID := Guid("{3853dc76-9f35-407c-88a1-d19344365fbc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEffectivePermission interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEffectivePermission : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEffectivePermission.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the effective permission for an object type.
     * @param {Pointer<Guid>} pguidObjectType A <b>GUID</b> for the object type whose permission is being queried.
     * @param {PSID} pUserSid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that represents the security principal whose effective permission is being determined.
     * @param {PWSTR} pszServerName A pointer to null-terminated wide character string that represents the server name.
     * @param {PSECURITY_DESCRIPTOR} pSD A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that represents the object's  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>. The security descriptor is used to perform the access check.
     * @param {Pointer<Pointer<OBJECT_TYPE_LIST>>} ppObjectTypeList A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structure that represents the array of object types in the object tree for the object. If an object does not support property access, use the following technique to specify the value for the <b>OBJECT_TYPE_LIST</b>.
     * 
     * 
     * ```cpp
     * @param {Pointer<Integer>} pcObjectTypeListLength A pointer to a <b>ULONG</b> that receives the count of object types pointed to by  <i>ppObjectTypeList</i>.
     * @param {Pointer<Pointer<Integer>>} ppGrantedAccessList A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> that receives the array of granted access masks. The operating system will use <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to free the memory allocated for this parameter.
     * @param {Pointer<Integer>} pcGrantedAccessListLength A pointer to a <b>ULONG</b> variable that receives the count of granted access masks pointed to by  the <i>ppGrantedAccessList</i> parameter.
     * @returns {HRESULT} If the function is successful, the return value is S_OK.
     * 
     * If the function fails, the return value is an <b>HRESULT</b> that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-ieffectivepermission-geteffectivepermission
     */
    GetEffectivePermission(pguidObjectType, pUserSid, pszServerName, pSD, ppObjectTypeList, pcObjectTypeListLength, ppGrantedAccessList, pcGrantedAccessListLength) {
        pszServerName := pszServerName is String ? StrPtr(pszServerName) : pszServerName

        ppObjectTypeListMarshal := ppObjectTypeList is VarRef ? "ptr*" : "ptr"
        pcObjectTypeListLengthMarshal := pcObjectTypeListLength is VarRef ? "uint*" : "ptr"
        ppGrantedAccessListMarshal := ppGrantedAccessList is VarRef ? "ptr*" : "ptr"
        pcGrantedAccessListLengthMarshal := pcGrantedAccessListLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, pguidObjectType, PSID, pUserSid, "ptr", pszServerName, PSECURITY_DESCRIPTOR, pSD, ppObjectTypeListMarshal, ppObjectTypeList, pcObjectTypeListLengthMarshal, pcObjectTypeListLength, ppGrantedAccessListMarshal, ppGrantedAccessList, pcGrantedAccessListLengthMarshal, pcGrantedAccessListLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEffectivePermission.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEffectivePermission := CallbackCreate(GetMethod(implObj, "GetEffectivePermission"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEffectivePermission)
    }
}
