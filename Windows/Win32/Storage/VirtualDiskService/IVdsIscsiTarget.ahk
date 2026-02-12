#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_ISCSI_TARGET_PROP.ahk
#Include .\IVdsSubSystem.ahk
#Include .\IEnumVdsObject.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVdsIscsiTarget interface (vds.h) provides methods for performing query and configuration operations on an iSCSI target.
 * @see https://learn.microsoft.com/windows/win32/api//content/vds/nn-vds-ivdsiscsitarget
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsIscsiTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsIscsiTarget
     * @type {Guid}
     */
    static IID => Guid("{aa8f5055-83e5-4bcc-aa73-19851a36a849}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetSubSystem", "QueryPortalGroups", "QueryAssociatedLuns", "CreatePortalGroup", "Delete", "SetFriendlyName", "SetSharedSecret", "RememberInitiatorSharedSecret", "GetConnectedInitiators"]

    /**
     * The IVdsIscsiTarget::GetProperties method (vds.h) returns the properties of an iSCSI target.
     * @returns {VDS_ISCSI_TARGET_PROP} The address of a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_target_prop">VDS_ISCSI_TARGET_PROP</a> 
     *       structure allocated by the caller. VDS allocates memory for the strings pointed to by the 
     *       <b>pwszIscsiName</b> and <b>pwszFriendlyName</b> members of this 
     *       structure. Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsiscsitarget-getproperties
     */
    GetProperties() {
        pTargetProp := VDS_ISCSI_TARGET_PROP()
        result := ComCall(3, this, "ptr", pTargetProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pTargetProp
    }

    /**
     * The IVdsIscsiTarget::GetSubSystem method (vds.h) returns the subsystem to which the target belongs.
     * @returns {IVdsSubSystem} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdssubsystem">IVdsSubSystem</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsiscsitarget-getsubsystem
     */
    GetSubSystem() {
        result := ComCall(4, this, "ptr*", &ppSubSystem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVdsSubSystem(ppSubSystem)
    }

    /**
     * The IVdsIscsiTarget::QueryPortalGroups method (vds.h) returns an enumeration of the iSCSI portal groups within the target.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the portal groups  as <a href="https://docs.microsoft.com/windows/desktop/VDS/portal-group-object">portal group objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the portal  group objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsiscsitarget-queryportalgroups
     */
    QueryPortalGroups() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumVdsObject(ppEnum)
    }

    /**
     * The IVdsIscsiTarget::QueryAssociatedLuns method (vds.h) returns a enumeration of the LUNs associated with the target.
     * @remarks
     * LUNs are associated with the target by calling the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsluniscsi-associatetargets">IVdsLunIscsi::AssociateTargets</a> method.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface 
     *       pointer that can be used to enumerate the LUNs  as <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-object">LUN objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the LUN  objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsiscsitarget-queryassociatedluns
     */
    QueryAssociatedLuns() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumVdsObject(ppEnum)
    }

    /**
     * The IVdsIscsiTarget::CreatePortalGroup method (vds.h) creates a portal group.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, which VDS 
     *       initializes on return. Callers must release the interface. Use this interface to cancel, wait for, or query the 
     *       status of the operation. If you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method on this interface and a success HRESULT value is returned, you must 
     *       release the interfaces returned in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsiscsitarget-createportalgroup
     */
    CreatePortalGroup() {
        result := ComCall(7, this, "ptr*", &ppAsync := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVdsAsync(ppAsync)
    }

    /**
     * The IVdsIscsiTarget::Delete function (vds.h) deletes the target and all of its portal groups if no LUNs are associated with the target.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, which VDS 
     *       initializes on return. Callers must release the interface. Use this interface to cancel, wait for, or query the 
     *       status of the operation. If you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method on this interface and a success HRESULT value is returned, you must 
     *       release the interfaces returned in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer.
     *      However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsiscsitarget-delete
     */
    Delete() {
        result := ComCall(8, this, "ptr*", &ppAsync := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVdsAsync(ppAsync)
    }

    /**
     * The IVdsIscsiTarget::SetFriendlyName method (vds.h) sets the friendly name of the target.
     * @param {PWSTR} pwszFriendlyName A string specifying the friendly name to assign to the target. This corresponds to the iSCSI alias.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The friendly name was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_S_NAME_TRUNCATED</b></b></dt>
     * <dt>0x00042700L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name was set successfully but had to be truncated due to limitations in the subsystem. The name that 
     *         was set might not match the name passed in the <i>pwszFriendlyName</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache of the provider is corrupted. This indicates a software or communication problem inside a provider 
     *         that caches information about the attached devices. The caller can use the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to restore the cache.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_DELETED</b></b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress; this operation cannot proceed until the previous operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_NOT_SUPPORTED</b></b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsiscsitarget-setfriendlyname
     */
    SetFriendlyName(pwszFriendlyName) {
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(9, this, "ptr", pwszFriendlyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IVdsIscsiTarget::SetSharedSecret method (vds.h) sets the target CHAP shared secret used for CHAP authentication when the target authenticates the initiator.
     * @remarks
     * The hardware provider must configure the subsystem itself to change the target shared secret. Secrets that are used for 
     *     security are not persisted by VDS nor should they be persisted by the hardware providers on the local computer. 
     *     The hardware provider should transmit the secret to the subsystem in a secure manner, and the subsystem is 
     *     responsible for persisting it.
     * 
     * Some iSCSI targets may support setting a different CHAP shared secret for each initiator. If a target does not support initiator-specific secrets,  the call to <b>SetSharedSecret</b> returns VDS_E_INITIATOR_SPECIFIC_NOT_SUPPORTED.
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pTargetSharedSecret The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_shared_secret">VDS_ISCSI_SHARED_SECRET</a> 
     *       structure that contains the shared secret. If the <b>pSharedSecret</b> member  is <b>NULL</b> and the <b>ulSharedSecretSize</b> is zero, the <b>SetSharedSecret</b> method  clears   any existing secret.
     * @param {PWSTR} pwszInitiatorName The string specifying the iSCSI name to which the shared secret is to be associated, if the secret is 
     *       initiator-specific. The value passed is used as the CHAP name. If the address is <b>NULL</b> 
     *       the changes apply to the default secret for all initiators.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shared secret was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache of the provider is corrupted. This indicates a software or communication problem inside a 
     *         provider that caches information about the attached devices. The caller can use the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to restore the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_DELETED</b></b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_NOT_SUPPORTED</b></b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_INITIATOR_SPECIFIC_NOT_SUPPORTED</b></b></dt>
     * <dt>0x80042707L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target does not support initiator-specific shared secrets.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsiscsitarget-setsharedsecret
     */
    SetSharedSecret(pTargetSharedSecret, pwszInitiatorName) {
        pwszInitiatorName := pwszInitiatorName is String ? StrPtr(pwszInitiatorName) : pwszInitiatorName

        result := ComCall(10, this, "ptr", pTargetSharedSecret, "ptr", pwszInitiatorName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The RememberInitiatorSharedSecret method (vds.h) communicates the initiator CHAP secret that the initiator used for mutual CHAP authentication of the target.
     * @param {PWSTR} pwszInitiatorName The string specifying the iSCSI name of the initiator. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pInitiatorSharedSecret The address of a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_shared_secret">VDS_ISCSI_SHARED_SECRET</a> 
     *       structure that contains the shared secret.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shared secret was remembered successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache of the provider is corrupted. This indicates a software or communication problem inside a provider 
     *         that caches information about the attached devices. The caller can use the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to restore the cache.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_DELETED</b></b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_NOT_SUPPORTED</b></b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsiscsitarget-rememberinitiatorsharedsecret
     */
    RememberInitiatorSharedSecret(pwszInitiatorName, pInitiatorSharedSecret) {
        pwszInitiatorName := pwszInitiatorName is String ? StrPtr(pwszInitiatorName) : pwszInitiatorName

        result := ComCall(11, this, "ptr", pwszInitiatorName, "ptr", pInitiatorSharedSecret, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IVdsIscsiTarget::GetConnectedInitiators method (vds.h) returns the list of iSCSI names of the initiators currently logged into the target.
     * @param {Pointer<Pointer<PWSTR>>} pppwszInitiatorList The address of a variable that receives an array of strings containing the iSCSI names of the initiators currently logged into the 
     *       target. Callers must free each string in this array, as well as the array itself, by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfInitiators A pointer to the number of strings returned in <i>pppwszInitiatorList</i>.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The list of connected initiators was returned successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress; this operation cannot proceed until the previous operations are 
     *         complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache of the provider is corrupted. This indicates a software or communication problem inside a 
     *         provider that caches information about the attached devices. The caller can use the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to restore the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_DELETED</b></b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target object is no longer present.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsiscsitarget-getconnectedinitiators
     */
    GetConnectedInitiators(pppwszInitiatorList, plNumberOfInitiators) {
        pppwszInitiatorListMarshal := pppwszInitiatorList is VarRef ? "ptr*" : "ptr"
        plNumberOfInitiatorsMarshal := plNumberOfInitiators is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pppwszInitiatorListMarshal, pppwszInitiatorList, plNumberOfInitiatorsMarshal, plNumberOfInitiators, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
