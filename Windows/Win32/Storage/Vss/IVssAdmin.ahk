#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssEnumObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssAdmin interface manages providers registered with VSS.
 * @see https://docs.microsoft.com/windows/win32/api//vsadmin/nn-vsadmin-ivssadmin
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssAdmin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssAdmin
     * @type {Guid}
     */
    static IID => Guid("{77ed5996-2f63-11d3-8a39-00c04f72d8e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterProvider", "UnregisterProvider", "QueryProviders", "AbortAllSnapshotsInProgress"]

    /**
     * Registers a new shadow copy provider.
     * @param {Guid} pProviderId The <b>VSS_ID</b> that uniquely and persistently identifies the provider. After it is 
     *      defined, the <i>ProviderId</i> parameter should remain the same, even when the software 
     *      revision is updated. A <i>ProviderId</i> parameter should be changed only when the 
     *      functionality changes enough that both providers would be active on the same system. A requester may use the 
     *      <i>ProviderId</i> parameter to request that a specific provider be used in a shadow copy 
     *      creation.
     * @param {Guid} ClassId The CLSID of the provider.
     * @param {Pointer<Integer>} pwszProviderName The name of the provider.
     * @param {Integer} eProviderType A 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_provider_type">VSS_PROVIDER_TYPE</a> enumeration value that specifies the provider type. Note that <b>VSS_PROV_HARDWARE</b> is not a valid provider type on Windows client operating system versions. Hardware providers will run only on Windows server operating system versions.
     * @param {Pointer<Integer>} pwszProviderVersion The version of the provider.
     * @param {Guid} ProviderVersionId The <b>VSS_ID</b> that uniquely identifies this version of the  provider. The 
     *      combination of the <i>pProviderId</i> and <i>ProviderVersionId</i> 
     *      parameters should be unique. The  <i>ProviderVersionId</i> parameter can be the same as the 
     *      <i>ProviderVersionId</i> parameter of another provider.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider was registered successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameter values is not valid. For example, <b>VSS_PROV_HARDWARE</b> is not a valid provider type on Windows client operating system versions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not an administrator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_ALREADY_REGISTERED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider has already been registered on this computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vsadmin/nf-vsadmin-ivssadmin-registerprovider
     */
    RegisterProvider(pProviderId, ClassId, pwszProviderName, eProviderType, pwszProviderVersion, ProviderVersionId) {
        pwszProviderNameMarshal := pwszProviderName is VarRef ? "ushort*" : "ptr"
        pwszProviderVersionMarshal := pwszProviderVersion is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "ptr", pProviderId, "ptr", ClassId, pwszProviderNameMarshal, pwszProviderName, "int", eProviderType, pwszProviderVersionMarshal, pwszProviderVersion, "ptr", ProviderVersionId, "HRESULT")
        return result
    }

    /**
     * Unregisters an existing provider.
     * @param {Guid} ProviderId The <b>VSS_ID</b> of the provider.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider was unregistered successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_IN_USE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider is in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_NOT_REGISTERED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider is not registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vsadmin/nf-vsadmin-ivssadmin-unregisterprovider
     */
    UnregisterProvider(ProviderId) {
        result := ComCall(4, this, "ptr", ProviderId, "HRESULT")
        return result
    }

    /**
     * Queries all registered providers.
     * @returns {IVssEnumObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> interface pointer, 
     *       which is initialized on return. Callers must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vsadmin/nf-vsadmin-ivssadmin-queryproviders
     */
    QueryProviders() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IVssEnumObject(ppEnum)
    }

    /**
     * This method is reserved for system use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//vsadmin/nf-vsadmin-ivssadmin-abortallsnapshotsinprogress
     */
    AbortAllSnapshotsInProgress() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
