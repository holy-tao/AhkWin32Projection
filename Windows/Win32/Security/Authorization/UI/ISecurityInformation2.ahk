#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\ACL.ahk" { ACL }
#Import "..\..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\PSID.ahk" { PSID }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the access control editor to obtain information from the client that is not provided by the ISecurityInformation interface.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/nn-aclui-isecurityinformation2
 * @namespace Windows.Win32.Security.Authorization.UI
 */
export default struct ISecurityInformation2 extends IUnknown {
    /**
     * The interface identifier for ISecurityInformation2
     * @type {Guid}
     */
    static IID := Guid("{c3ccfdb4-6f88-11d2-a3ce-00c04fb1782a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISecurityInformation2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsDaclCanonical : IntPtr
        LookupSids      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISecurityInformation2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IsDaclCanonical method determines whether the ACEs contained in the specified DACL structure are ordered according to the definition of DACL ordering implemented by the client.
     * @remarks
     * If the return value of this method is <b>FALSE</b>, the access control editor  displays a message box stating that the DACL is incorrectly ordered. If this method is not provided and the editor requires this information, the editor will check the  canonical ordering defined in 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/order-of-aces-in-a-dacl">Order of ACEs in a DACL</a>.
     * @param {Pointer<ACL>} pDacl A pointer to a discretionary 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure initialized by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-initializeacl">InitializeAcl</a>.
     * @returns {BOOL} Returns <b>TRUE</b> if the ACEs contained in the specified DACL structure are ordered according to the definition of DACL ordering implemented by the client.
     * 
     * Returns <b>FALSE</b> if the ACEs are not ordered correctly.
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation2-isdaclcanonical
     */
    IsDaclCanonical(pDacl) {
        result := ComCall(3, this, ACL.Ptr, pDacl, BOOL)
        return result
    }

    /**
     * The LookupSids method returns the common names corresponding to each of the elements in the specified list of SIDs.
     * @remarks
     * Your implementation of <b>LookupSids</b> can return E_NOTIMPL if the access control editor is to determine the common names corresponding to the specified SIDs. However, if the access control editor receives any return code other than S_OK, the editor determines this information.
     * 
     * The client must return the common names through the data object using the following format.
     * 
     * 
     * ```cpp
     * @param {Integer} cSids The number of 
     * pointers to  <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures pointed to by <i>rgpSids</i>.
     * @param {Pointer<PSID>} rgpSids A pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures.
     * @returns {IDataObject} A pointer to a pointer to a returned data transfer object that contains the common names of the SIDs. Optionally, this parameter also returns the user principal name (UPN) of the SIDs in the <i>rgpSids</i> parameter. The data transfer object is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-sid_info">SID_INFO</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation2-lookupsids
     */
    LookupSids(cSids, rgpSids) {
        rgpSidsMarshal := rgpSids is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", cSids, rgpSidsMarshal, rgpSids, "ptr*", &ppdo := 0, "HRESULT")
        return IDataObject(ppdo)
    }

    Query(iid) {
        if (ISecurityInformation2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsDaclCanonical := CallbackCreate(GetMethod(implObj, "IsDaclCanonical"), flags, 2)
        this.vtbl.LookupSids := CallbackCreate(GetMethod(implObj, "LookupSids"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsDaclCanonical)
        CallbackFree(this.vtbl.LookupSids)
    }
}
