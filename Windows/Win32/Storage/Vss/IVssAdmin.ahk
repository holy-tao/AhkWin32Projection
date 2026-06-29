#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VSS_PROVIDER_TYPE.ahk" { VSS_PROVIDER_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVssEnumObject.ahk" { IVssEnumObject }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVssAdmin interface manages providers registered with VSS.
 * @see https://learn.microsoft.com/windows/win32/api/vsadmin/nn-vsadmin-ivssadmin
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssAdmin extends IUnknown {
    /**
     * The interface identifier for IVssAdmin
     * @type {Guid}
     */
    static IID := Guid("{77ed5996-2f63-11d3-8a39-00c04f72d8e3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssAdmin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterProvider            : IntPtr
        UnregisterProvider          : IntPtr
        QueryProviders              : IntPtr
        AbortAllSnapshotsInProgress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssAdmin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a new shadow copy provider.
     * @remarks
     * If the hardware provider is updated, the setup application should call the 
     *    <a href="https://docs.microsoft.com/windows/desktop/api/vsadmin/nf-vsadmin-ivssadmin-unregisterprovider">UnregisterProvider</a> method to unregister the 
     *    outdated version, and then call  the 
     *    <b>RegisterProvider</b> method to register the 
     *    updated provider.
     * 
     * <div class="alert"><b>Note</b>  Hardware providers can only be registered on Windows Server operating systems.</div>
     * <div> </div>
     * @param {Guid} pProviderId The <b>VSS_ID</b> that uniquely and persistently identifies the provider. After it is 
     *      defined, the <i>ProviderId</i> parameter should remain the same, even when the software 
     *      revision is updated. A <i>ProviderId</i> parameter should be changed only when the 
     *      functionality changes enough that both providers would be active on the same system. A requester may use the 
     *      <i>ProviderId</i> parameter to request that a specific provider be used in a shadow copy 
     *      creation.
     * @param {Guid} ClassId The CLSID of the provider.
     * @param {Pointer<Integer>} pwszProviderName The name of the provider.
     * @param {VSS_PROVIDER_TYPE} eProviderType A 
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
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsadmin/nf-vsadmin-ivssadmin-registerprovider
     */
    RegisterProvider(pProviderId, ClassId, pwszProviderName, eProviderType, pwszProviderVersion, ProviderVersionId) {
        pwszProviderNameMarshal := pwszProviderName is VarRef ? "ushort*" : "ptr"
        pwszProviderVersionMarshal := pwszProviderVersion is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, Guid, pProviderId, Guid, ClassId, pwszProviderNameMarshal, pwszProviderName, VSS_PROVIDER_TYPE, eProviderType, pwszProviderVersionMarshal, pwszProviderVersion, Guid, ProviderVersionId, "HRESULT")
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
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsadmin/nf-vsadmin-ivssadmin-unregisterprovider
     */
    UnregisterProvider(ProviderId) {
        result := ComCall(4, this, Guid, ProviderId, "HRESULT")
        return result
    }

    /**
     * Queries all registered providers.
     * @remarks
     * Calling the <a href="https://docs.microsoft.com/windows/desktop/api/vss/nf-vss-ivssenumobject-next">IVssEnumObject::Next</a> method on the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> interface returned though the 
     *     <i>ppEnum</i>  parameter will return 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_object_prop">VSS_OBJECT_PROP</a> structures containing a 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_provider_prop">VSS_PROVIDER_PROP</a> structure for each registered 
     *     provider.
     * @returns {IVssEnumObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> interface pointer, 
     *       which is initialized on return. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vsadmin/nf-vsadmin-ivssadmin-queryproviders
     */
    QueryProviders() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IVssEnumObject(ppEnum)
    }

    /**
     * This method is reserved for system use.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsadmin/nf-vsadmin-ivssadmin-abortallsnapshotsinprogress
     */
    AbortAllSnapshotsInProgress() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVssAdmin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterProvider := CallbackCreate(GetMethod(implObj, "RegisterProvider"), flags, 7)
        this.vtbl.UnregisterProvider := CallbackCreate(GetMethod(implObj, "UnregisterProvider"), flags, 2)
        this.vtbl.QueryProviders := CallbackCreate(GetMethod(implObj, "QueryProviders"), flags, 2)
        this.vtbl.AbortAllSnapshotsInProgress := CallbackCreate(GetMethod(implObj, "AbortAllSnapshotsInProgress"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterProvider)
        CallbackFree(this.vtbl.UnregisterProvider)
        CallbackFree(this.vtbl.QueryProviders)
        CallbackFree(this.vtbl.AbortAllSnapshotsInProgress)
    }
}
