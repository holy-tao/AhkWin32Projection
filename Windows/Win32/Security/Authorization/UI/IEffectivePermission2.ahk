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
     * 
     * @param {PSID} pSid 
     * @param {PSID} pDeviceSid 
     * @param {PWSTR} pszServerName 
     * @param {Pointer<SECURITY_OBJECT>} pSecurityObjects 
     * @param {Integer} dwSecurityObjectCount 
     * @param {Pointer<TOKEN_GROUPS>} pUserGroups 
     * @param {Pointer<Integer>} pAuthzUserGroupsOperations 
     * @param {Pointer<TOKEN_GROUPS>} pDeviceGroups 
     * @param {Pointer<Integer>} pAuthzDeviceGroupsOperations 
     * @param {Pointer<AUTHZ_SECURITY_ATTRIBUTES_INFORMATION>} pAuthzUserClaims 
     * @param {Pointer<Integer>} pAuthzUserClaimsOperations 
     * @param {Pointer<AUTHZ_SECURITY_ATTRIBUTES_INFORMATION>} pAuthzDeviceClaims 
     * @param {Pointer<Integer>} pAuthzDeviceClaimsOperations 
     * @param {Pointer<EFFPERM_RESULT_LIST>} pEffpermResultLists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-ieffectivepermission2-computeeffectivepermissionwithsecondarysecurity
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
