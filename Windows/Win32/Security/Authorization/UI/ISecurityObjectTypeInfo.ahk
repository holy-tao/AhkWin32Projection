#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\ACL.ahk" { ACL }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\INHERITED_FROMA.ahk" { INHERITED_FROMA }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a means of determining the source of inherited access control entries (ACEs) in discretionary access control lists (DACLs) and system access control lists (SACLs).
 * @see https://learn.microsoft.com/windows/win32/api/aclui/nn-aclui-isecurityobjecttypeinfo
 * @namespace Windows.Win32.Security.Authorization.UI
 */
export default struct ISecurityObjectTypeInfo extends IUnknown {
    /**
     * The interface identifier for ISecurityObjectTypeInfo
     * @type {Guid}
     */
    static IID := Guid("{fc3066eb-79ef-444b-9111-d18a75ebf2fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISecurityObjectTypeInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInheritSource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISecurityObjectTypeInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ISecurityObjectTypeInfo::GetInheritSource method provides a means of determining the source of inherited access control entries in discretionary access control lists and system access control lists.
     * @param {Integer} si A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that represents the security information of the object.
     * @param {Pointer<ACL>} pACL A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure that represents the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) of the object.
     * @param {Pointer<Pointer<INHERITED_FROMA>>} ppInheritArray A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-inherited_froma">INHERITED_FROM</a> structure that receives an array of <b>INHERITED_FROM</b> structures. The length of this array is the same as the number of <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace">ACEs</a> in the ACL referenced by <i>pACL</i>. Each <b>INHERITED_FROM</b> entry in <i>ppInheritArray</i> provides inheritance information for the corresponding <b>ACE</b> entry in <i>pACL</i>.
     * @returns {HRESULT} If the function is successful, the return value is S_OK.
     * 
     *  
     * If the function fails, the return value is an <b>HRESULT</b> that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityobjecttypeinfo-getinheritsource
     */
    GetInheritSource(si, pACL, ppInheritArray) {
        ppInheritArrayMarshal := ppInheritArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", si, ACL.Ptr, pACL, ppInheritArrayMarshal, ppInheritArray, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISecurityObjectTypeInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInheritSource := CallbackCreate(GetMethod(implObj, "GetInheritSource"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInheritSource)
    }
}
