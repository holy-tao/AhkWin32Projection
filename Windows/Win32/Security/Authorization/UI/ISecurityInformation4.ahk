#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SECURITY_OBJECT.ahk" { SECURITY_OBJECT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the access control editor (ACE) to obtain the share's security descriptor to initialize the share page.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/nn-aclui-isecurityinformation4
 * @namespace Windows.Win32.Security.Authorization.UI
 */
export default struct ISecurityInformation4 extends IUnknown {
    /**
     * The interface identifier for ISecurityInformation4
     * @type {Guid}
     */
    static IID := Guid("{ea961070-cd14-4621-ace4-f63c03e583e4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISecurityInformation4 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSecondarySecurity : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISecurityInformation4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns additional security contexts that may impact access to the resource.
     * @remarks
     * A resource manager does not need to return secondary objects with the <b>fWellKnown</b> member set to <b>TRUE</b> and the <b>Id</b> member set to SECURITY_OBJECT_ID_OBJECT_SD, SECURITY_OBJECT_ID_CENTRAL_POLICY, or SECURITY_OBJECT_ID_CENTRAL_ACCESS_RULE. Security objects with these IDs will be provided by the access control editor when calling <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-ieffectivepermission2-computeeffectivepermissionwithsecondarysecurity">ComputeEffectivePermissionWithSecondarySecurity</a>.
     * 
     * Interpretation of the returned security objects is tied to the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-ieffectivepermission2-computeeffectivepermissionwithsecondarysecurity">ComputeEffectivePermissionWithSecondarySecurity</a>.
     * @param {Pointer<Pointer<SECURITY_OBJECT>>} pSecurityObjects An array of <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-security_object">SECURITY_OBJECT</a> structures that contain the secondary security objects associated with the resources that are set on success. The array is owned by the caller and is freed by using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function. The <b>pwszName</b> member is also freed by using <b>LocalFree</b>. If the <b>cbData</b> or <b>cbData2</b> members of the <b>SECURITY_OBJECT</b> structure are not zero, then the caller must free the corresponding <b>pData</b> or <b>pData2</b> by using <b>LocalFree</b>. If either of those members are zero, then the corresponding <b>pData</b> and <b>pData2</b> members are owned by the resource manager and must remain valid until the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-editsecurity">EditSecurity</a> function returns
     * @param {Pointer<Integer>} pSecurityObjectCount The number of security objects in the <i>pSecurityObjects</i> parameter that are set on success.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation4-getsecondarysecurity
     */
    GetSecondarySecurity(pSecurityObjects, pSecurityObjectCount) {
        pSecurityObjectsMarshal := pSecurityObjects is VarRef ? "ptr*" : "ptr"
        pSecurityObjectCountMarshal := pSecurityObjectCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pSecurityObjectsMarshal, pSecurityObjects, pSecurityObjectCountMarshal, pSecurityObjectCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISecurityInformation4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSecondarySecurity := CallbackCreate(GetMethod(implObj, "GetSecondarySecurity"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSecondarySecurity)
    }
}
