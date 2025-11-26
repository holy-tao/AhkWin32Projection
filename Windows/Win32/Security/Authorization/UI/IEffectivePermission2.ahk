#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a way to determine effective permission for a security principal on an object.
 * @remarks
 * 
 * The <b>IEffectivePermission2</b> interface should be implemented by resource managers that support dynamic access control or by resource managers where the effective access to an object is determined by more than one security check, for example, a security descriptor and a firewall. 
 * 
 * The resource manager typically implements <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation4">ISecurityInformation4</a> before implementing <b>IEffectivePermission2</b> because <b>IEffectivePermission2</b> interprets the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-security_object">SECURITY_OBJECT</a> returned by the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation4-getsecondarysecurity">GetSecondarySecurity</a> method.
 * 
 * If the <b>IEffectivePermission2</b> interface is implemented, then the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-ieffectivepermission">IEffectivePermission</a> interface is not used.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//aclui/nn-aclui-ieffectivepermission2
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class IEffectivePermission2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEffectivePermission2
     * @type {Guid}
     */
    static IID => Guid("{941fabca-dd47-4fca-90bb-b0e10255f20d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ComputeEffectivePermissionWithSecondarySecurity"]

    /**
     * Computes the effective permissions by using the secondary security for an object.
     * @param {PSID} pSid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that represents the security principal whose effective permission is being determined.
     * @param {PSID} pDeviceSid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that represents the device from which the principal is accessing the object. If this is not <b>NULL</b> and you are using the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> function to compute the effective permissions, then the device SID may be compounded with the <i>pSid</i> parameter by using the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzinitializecompoundcontext">AuthzInitializeCompoundContext</a> function.
     * @param {PWSTR} pszServerName The name of the server on which the object resides. This is the same name that was returned from the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getobjectinformation">ISecurityInformation::GetObjectInformation</a> method.
     * @param {Pointer<SECURITY_OBJECT>} pSecurityObjects An array of security objects. This array is composed of objects that were deduced by the access control editor in addition to the ones returned from the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation4-getsecondarysecurity">ISecurityInformation4::GetSecondarySecurity</a> method.
     * @param {Integer} dwSecurityObjectCount The number of security objects in the <i>pSecurityObjects</i> parameter, and the number of results lists in the <i>pEffpermResultLists</i> parameter.
     * @param {Pointer<TOKEN_GROUPS>} pUserGroups A pointer to additional user groups that should be used to modify the security context which was initialized from the <i>pSid</i> parameter.  If you are using the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> function to compute the effective permissions, then the modification may be done by calling the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzmodifysids">AuthzModifySids</a> function using         AuthzContextInfoGroupsSids as the  <i>SidClass</i> parameter.
     * @param {Pointer<Integer>} pAuthzUserGroupsOperations Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/authz/ne-authz-authz_sid_operation">AUTHZ_SID_OPERATION</a> structures that specify how the user groups in the authz context must be modified for each user group in the <i>pUserGroups</i> argument. This array contains as many elements as the number of groups in the <i>pUserGroups</i> parameter.
     * @param {Pointer<TOKEN_GROUPS>} pDeviceGroups A pointer to additional device groups that should be used to modify the security context which was initialized from the <i>pSid</i> parameter or one that was created by compounding the contexts that were initialized from the <i>pSid</i> and <i>pDeviceSid</i> parameters.  If you are using the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> function to compute the effective permissions, then the modification may be done by calling the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzmodifysids">AuthzModifySids</a> function using         AuthzContextInfoDeviceSids as the  <i>SidClass</i> parameter.
     * @param {Pointer<Integer>} pAuthzDeviceGroupsOperations Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/authz/ne-authz-authz_sid_operation">AUTHZ_SID_OPERATION</a> enumeration types that specify how the device groups in the authz context must be modified for each device group in the <i>pDeviceGroups</i> argument. This array contains as many elements as the number of groups in the <i>pDeviceGroups</i> parameter.
     * @param {Pointer<AUTHZ_SECURITY_ATTRIBUTES_INFORMATION>} pAuthzUserClaims Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_security_attributes_information">AUTHZ_SECURITY_ATTRIBUTES_INFORMATION</a> structure that contains  the user claims context that should be used to modify the security context that was initialized from the <i>pSid</i> parameter.  If you are using the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> function to compute the effective permissions, then the modification may be done by calling the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzmodifyclaims">AuthzModifyClaims</a> function using         AuthzContextInfoUserClaims as the  <i>ClaimClass</i> parameter.
     * @param {Pointer<Integer>} pAuthzUserClaimsOperations Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/authz/ne-authz-authz_security_attribute_operation">AUTHZ_SECURITY_ATTRIBUTE_OPERATION</a> enumeration type that specifies  the operations associated with the user claims context.
     * @param {Pointer<AUTHZ_SECURITY_ATTRIBUTES_INFORMATION>} pAuthzDeviceClaims A pointer to the device claims context that should be used to modify the security context that was initialized from the <i>pSid</i> parameter or one that was created by compounding the contexts that were initialized from the <i>pSid</i> and <i>pDeviceSid</i> parameters.  This may be supplied by the caller, even if  the <i>pDeviceSid</i> parameter is not. If you are using the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzaccesscheck">AuthzAccessCheck</a> function to compute the effective permissions, then the modification may be done by calling the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzmodifyclaims">AuthzModifyClaims</a> function using         AuthzContextInfoDeviceClaims as the  <i>ClaimClass</i> parameter.
     * @param {Pointer<Integer>} pAuthzDeviceClaimsOperations Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/authz/ne-authz-authz_security_attribute_operation">AUTHZ_SECURITY_ATTRIBUTE_OPERATION</a> enumeration type that specifies the operations associated with the device claims context.
     * @param {Pointer<EFFPERM_RESULT_LIST>} pEffpermResultLists A pointer to an array of the effective permissions results of type <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-effperm_result_list">EFFPERM_RESULT_LIST</a>. This array is <i>dwSecurityObjectCount</i> elements long. The array is initialized by the caller and the implementation is expected to set all fields of each member in the array, indicating what access was granted by the corresponding security object.
     * 
     * If a security object was considered, the <b>fEvaluated</b> member should be set to <b>TRUE</b>.  In this case, the  <b>pObjectTypeList</b> and <b>pGrantedAccessList</b> members should both be <b>cObjectTypeListLength</b> elements long.  The <b>pObjectTypeList</b> member must point to memory that is owned by the resource manager and must remain valid until the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-editsecurity">EditSecurity</a> function exits.  The <b>pGrantedAccessList</b> member is freed by the caller by using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.  If the resource manager does not support object ACEs, then the <b>pObjectTypeList</b> member should point to the <b>NULL</b> GUID, the <b>cObjectTypeListLength</b> member should be 1, and the <b>pGrantedAccessList</b> member should be a single <b>DWORD.</b>
     * @returns {HRESULT} If the function is successful, the return value is S_OK.
     * 
     * If the function is successful but returned an approximate result, the return value is S_FALSE.
     * 
     * If the function fails, the return value is an <b>HRESULT</b> that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-ieffectivepermission2-computeeffectivepermissionwithsecondarysecurity
     */
    ComputeEffectivePermissionWithSecondarySecurity(pSid, pDeviceSid, pszServerName, pSecurityObjects, dwSecurityObjectCount, pUserGroups, pAuthzUserGroupsOperations, pDeviceGroups, pAuthzDeviceGroupsOperations, pAuthzUserClaims, pAuthzUserClaimsOperations, pAuthzDeviceClaims, pAuthzDeviceClaimsOperations, pEffpermResultLists) {
        pszServerName := pszServerName is String ? StrPtr(pszServerName) : pszServerName

        pAuthzUserGroupsOperationsMarshal := pAuthzUserGroupsOperations is VarRef ? "int*" : "ptr"
        pAuthzDeviceGroupsOperationsMarshal := pAuthzDeviceGroupsOperations is VarRef ? "int*" : "ptr"
        pAuthzUserClaimsOperationsMarshal := pAuthzUserClaimsOperations is VarRef ? "int*" : "ptr"
        pAuthzDeviceClaimsOperationsMarshal := pAuthzDeviceClaimsOperations is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pSid, "ptr", pDeviceSid, "ptr", pszServerName, "ptr", pSecurityObjects, "uint", dwSecurityObjectCount, "ptr", pUserGroups, pAuthzUserGroupsOperationsMarshal, pAuthzUserGroupsOperations, "ptr", pDeviceGroups, pAuthzDeviceGroupsOperationsMarshal, pAuthzDeviceGroupsOperations, "ptr", pAuthzUserClaims, pAuthzUserClaimsOperationsMarshal, pAuthzUserClaimsOperations, "ptr", pAuthzDeviceClaims, pAuthzDeviceClaimsOperationsMarshal, pAuthzDeviceClaimsOperations, "ptr", pEffpermResultLists, "HRESULT")
        return result
    }
}
