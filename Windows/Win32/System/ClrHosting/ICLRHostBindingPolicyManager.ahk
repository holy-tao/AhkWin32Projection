#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRHostBindingPolicyManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRHostBindingPolicyManager
     * @type {Guid}
     */
    static IID => Guid("{4b3545e7-1856-48c9-a8ba-24b21a753c09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ModifyApplicationPolicy", "EvaluatePolicy"]

    /**
     * 
     * @param {PWSTR} pwzSourceAssemblyIdentity 
     * @param {PWSTR} pwzTargetAssemblyIdentity 
     * @param {Pointer<Integer>} pbApplicationPolicy 
     * @param {Integer} cbAppPolicySize 
     * @param {Integer} dwPolicyModifyFlags 
     * @param {Pointer<Integer>} pbNewApplicationPolicy 
     * @param {Pointer<Integer>} pcbNewAppPolicySize 
     * @returns {HRESULT} 
     */
    ModifyApplicationPolicy(pwzSourceAssemblyIdentity, pwzTargetAssemblyIdentity, pbApplicationPolicy, cbAppPolicySize, dwPolicyModifyFlags, pbNewApplicationPolicy, pcbNewAppPolicySize) {
        pwzSourceAssemblyIdentity := pwzSourceAssemblyIdentity is String ? StrPtr(pwzSourceAssemblyIdentity) : pwzSourceAssemblyIdentity
        pwzTargetAssemblyIdentity := pwzTargetAssemblyIdentity is String ? StrPtr(pwzTargetAssemblyIdentity) : pwzTargetAssemblyIdentity

        pbApplicationPolicyMarshal := pbApplicationPolicy is VarRef ? "char*" : "ptr"
        pbNewApplicationPolicyMarshal := pbNewApplicationPolicy is VarRef ? "char*" : "ptr"
        pcbNewAppPolicySizeMarshal := pcbNewAppPolicySize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pwzSourceAssemblyIdentity, "ptr", pwzTargetAssemblyIdentity, pbApplicationPolicyMarshal, pbApplicationPolicy, "uint", cbAppPolicySize, "uint", dwPolicyModifyFlags, pbNewApplicationPolicyMarshal, pbNewApplicationPolicy, pcbNewAppPolicySizeMarshal, pcbNewAppPolicySize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzReferenceIdentity 
     * @param {Pointer<Integer>} pbApplicationPolicy 
     * @param {Integer} cbAppPolicySize 
     * @param {PWSTR} pwzPostPolicyReferenceIdentity 
     * @param {Pointer<Integer>} pcchPostPolicyReferenceIdentity 
     * @param {Pointer<Integer>} pdwPoliciesApplied 
     * @returns {HRESULT} 
     */
    EvaluatePolicy(pwzReferenceIdentity, pbApplicationPolicy, cbAppPolicySize, pwzPostPolicyReferenceIdentity, pcchPostPolicyReferenceIdentity, pdwPoliciesApplied) {
        pwzReferenceIdentity := pwzReferenceIdentity is String ? StrPtr(pwzReferenceIdentity) : pwzReferenceIdentity
        pwzPostPolicyReferenceIdentity := pwzPostPolicyReferenceIdentity is String ? StrPtr(pwzPostPolicyReferenceIdentity) : pwzPostPolicyReferenceIdentity

        pbApplicationPolicyMarshal := pbApplicationPolicy is VarRef ? "char*" : "ptr"
        pcchPostPolicyReferenceIdentityMarshal := pcchPostPolicyReferenceIdentity is VarRef ? "uint*" : "ptr"
        pdwPoliciesAppliedMarshal := pdwPoliciesApplied is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwzReferenceIdentity, pbApplicationPolicyMarshal, pbApplicationPolicy, "uint", cbAppPolicySize, "ptr", pwzPostPolicyReferenceIdentity, pcchPostPolicyReferenceIdentityMarshal, pcchPostPolicyReferenceIdentity, pdwPoliciesAppliedMarshal, pdwPoliciesApplied, "HRESULT")
        return result
    }
}
