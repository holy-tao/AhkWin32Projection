#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRHostBindingPolicyManager extends IUnknown {
    /**
     * The interface identifier for ICLRHostBindingPolicyManager
     * @type {Guid}
     */
    static IID := Guid("{4b3545e7-1856-48c9-a8ba-24b21a753c09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRHostBindingPolicyManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ModifyApplicationPolicy : IntPtr
        EvaluatePolicy          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRHostBindingPolicyManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwzSourceAssemblyIdentity 
     * @param {PWSTR} pwzTargetAssemblyIdentity 
     * @param {Pointer<Integer>} pbApplicationPolicy 
     * @param {Integer} cbAppPolicySize 
     * @param {Integer} dwPolicyModifyFlags 
     * @param {Pointer<Integer>} pcbNewAppPolicySize 
     * @returns {Integer} 
     */
    ModifyApplicationPolicy(pwzSourceAssemblyIdentity, pwzTargetAssemblyIdentity, pbApplicationPolicy, cbAppPolicySize, dwPolicyModifyFlags, pcbNewAppPolicySize) {
        pwzSourceAssemblyIdentity := pwzSourceAssemblyIdentity is String ? StrPtr(pwzSourceAssemblyIdentity) : pwzSourceAssemblyIdentity
        pwzTargetAssemblyIdentity := pwzTargetAssemblyIdentity is String ? StrPtr(pwzTargetAssemblyIdentity) : pwzTargetAssemblyIdentity

        pbApplicationPolicyMarshal := pbApplicationPolicy is VarRef ? "char*" : "ptr"
        pcbNewAppPolicySizeMarshal := pcbNewAppPolicySize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pwzSourceAssemblyIdentity, "ptr", pwzTargetAssemblyIdentity, pbApplicationPolicyMarshal, pbApplicationPolicy, "uint", cbAppPolicySize, "uint", dwPolicyModifyFlags, "char*", &pbNewApplicationPolicy := 0, pcbNewAppPolicySizeMarshal, pcbNewAppPolicySize, "HRESULT")
        return pbNewApplicationPolicy
    }

    /**
     * 
     * @param {PWSTR} pwzReferenceIdentity 
     * @param {Pointer<Integer>} pbApplicationPolicy 
     * @param {Integer} cbAppPolicySize 
     * @param {PWSTR} pwzPostPolicyReferenceIdentity 
     * @param {Pointer<Integer>} pcchPostPolicyReferenceIdentity 
     * @returns {Integer} 
     */
    EvaluatePolicy(pwzReferenceIdentity, pbApplicationPolicy, cbAppPolicySize, pwzPostPolicyReferenceIdentity, pcchPostPolicyReferenceIdentity) {
        pwzReferenceIdentity := pwzReferenceIdentity is String ? StrPtr(pwzReferenceIdentity) : pwzReferenceIdentity
        pwzPostPolicyReferenceIdentity := pwzPostPolicyReferenceIdentity is String ? StrPtr(pwzPostPolicyReferenceIdentity) : pwzPostPolicyReferenceIdentity

        pbApplicationPolicyMarshal := pbApplicationPolicy is VarRef ? "char*" : "ptr"
        pcchPostPolicyReferenceIdentityMarshal := pcchPostPolicyReferenceIdentity is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwzReferenceIdentity, pbApplicationPolicyMarshal, pbApplicationPolicy, "uint", cbAppPolicySize, "ptr", pwzPostPolicyReferenceIdentity, pcchPostPolicyReferenceIdentityMarshal, pcchPostPolicyReferenceIdentity, "uint*", &pdwPoliciesApplied := 0, "HRESULT")
        return pdwPoliciesApplied
    }

    Query(iid) {
        if (ICLRHostBindingPolicyManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ModifyApplicationPolicy := CallbackCreate(GetMethod(implObj, "ModifyApplicationPolicy"), flags, 8)
        this.vtbl.EvaluatePolicy := CallbackCreate(GetMethod(implObj, "EvaluatePolicy"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ModifyApplicationPolicy)
        CallbackFree(this.vtbl.EvaluatePolicy)
    }
}
