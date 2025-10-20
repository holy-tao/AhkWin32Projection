#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRHostBindingPolicyManager extends IUnknown{
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
     * 
     * @param {PWSTR} pwzSourceAssemblyIdentity 
     * @param {PWSTR} pwzTargetAssemblyIdentity 
     * @param {Pointer<Byte>} pbApplicationPolicy 
     * @param {Integer} cbAppPolicySize 
     * @param {Integer} dwPolicyModifyFlags 
     * @param {Pointer<Byte>} pbNewApplicationPolicy 
     * @param {Pointer<UInt32>} pcbNewAppPolicySize 
     * @returns {HRESULT} 
     */
    ModifyApplicationPolicy(pwzSourceAssemblyIdentity, pwzTargetAssemblyIdentity, pbApplicationPolicy, cbAppPolicySize, dwPolicyModifyFlags, pbNewApplicationPolicy, pcbNewAppPolicySize) {
        pwzSourceAssemblyIdentity := pwzSourceAssemblyIdentity is String ? StrPtr(pwzSourceAssemblyIdentity) : pwzSourceAssemblyIdentity
        pwzTargetAssemblyIdentity := pwzTargetAssemblyIdentity is String ? StrPtr(pwzTargetAssemblyIdentity) : pwzTargetAssemblyIdentity

        result := ComCall(3, this, "ptr", pwzSourceAssemblyIdentity, "ptr", pwzTargetAssemblyIdentity, "char*", pbApplicationPolicy, "uint", cbAppPolicySize, "uint", dwPolicyModifyFlags, "char*", pbNewApplicationPolicy, "uint*", pcbNewAppPolicySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzReferenceIdentity 
     * @param {Pointer<Byte>} pbApplicationPolicy 
     * @param {Integer} cbAppPolicySize 
     * @param {PWSTR} pwzPostPolicyReferenceIdentity 
     * @param {Pointer<UInt32>} pcchPostPolicyReferenceIdentity 
     * @param {Pointer<UInt32>} pdwPoliciesApplied 
     * @returns {HRESULT} 
     */
    EvaluatePolicy(pwzReferenceIdentity, pbApplicationPolicy, cbAppPolicySize, pwzPostPolicyReferenceIdentity, pcchPostPolicyReferenceIdentity, pdwPoliciesApplied) {
        pwzReferenceIdentity := pwzReferenceIdentity is String ? StrPtr(pwzReferenceIdentity) : pwzReferenceIdentity
        pwzPostPolicyReferenceIdentity := pwzPostPolicyReferenceIdentity is String ? StrPtr(pwzPostPolicyReferenceIdentity) : pwzPostPolicyReferenceIdentity

        result := ComCall(4, this, "ptr", pwzReferenceIdentity, "char*", pbApplicationPolicy, "uint", cbAppPolicySize, "ptr", pwzPostPolicyReferenceIdentity, "uint*", pcchPostPolicyReferenceIdentity, "uint*", pdwPoliciesApplied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
