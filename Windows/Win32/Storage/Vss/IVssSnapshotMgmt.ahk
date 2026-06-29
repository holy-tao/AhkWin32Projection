#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVssEnumObject.ahk" { IVssEnumObject }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IVssEnumMgmtObject.ahk" { IVssEnumMgmtObject }

/**
 * Provides a method that returns an interface to further configure a shadow copy provider.
 * @remarks
 * The <b>IVssSnapshotMgmt</b> interface can be invoked 
 *     remotely using DCOM. The caller must be a member of the local administrators group on the remote machine.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nn-vsmgmt-ivsssnapshotmgmt
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssSnapshotMgmt extends IUnknown {
    /**
     * The interface identifier for IVssSnapshotMgmt
     * @type {Guid}
     */
    static IID := Guid("{fa7df749-66e7-4986-a27f-e2f04ae53772}")

    /**
     * The class identifier for VssSnapshotMgmt
     * @type {Guid}
     */
    static CLSID := Guid("{0b5a2c52-3eb9-470a-96e2-6c6d4570e40f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssSnapshotMgmt interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProviderMgmtInterface          : IntPtr
        QueryVolumesSupportedForSnapshots : IntPtr
        QuerySnapshotsByVolume            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssSnapshotMgmt.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns an interface to further configure the system provider.
     * @param {Guid} ProviderId This must be the system provider. The  <b>VSS_ID</b> for the system provider <c>{b5946137-7b9f-4925-af80-51abd60b20d5}</c>.
     * @param {Pointer<Guid>} InterfaceId Must be <b>IID_IVssDifferentialSoftwareSnapshotMgmt</b>, which represents the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nn-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt">IVssDifferentialSoftwareSnapshotMgmt</a> 
     *       interface.
     * @returns {IUnknown} Address of an interface pointer that is filled in with the returned interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivsssnapshotmgmt-getprovidermgmtinterface
     */
    GetProviderMgmtInterface(ProviderId, InterfaceId) {
        result := ComCall(3, this, Guid, ProviderId, Guid.Ptr, InterfaceId, "ptr*", &ppItf := 0, "HRESULT")
        return IUnknown(ppItf)
    }

    /**
     * Reserved for system use. (IVssSnapshotMgmt.QueryVolumesSupportedForSnapshots)
     * @param {Guid} ProviderId Reserved for system use. Do not use.
     * @param {Integer} lContext Reserved for system use. Do not use.
     * @returns {IVssEnumMgmtObject} Reserved for system use. Do not use.
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivsssnapshotmgmt-queryvolumessupportedforsnapshots
     */
    QueryVolumesSupportedForSnapshots(ProviderId, lContext) {
        result := ComCall(4, this, Guid, ProviderId, "int", lContext, "ptr*", &ppEnum := 0, "HRESULT")
        return IVssEnumMgmtObject(ppEnum)
    }

    /**
     * Reserved for system use. (IVssSnapshotMgmt.QuerySnapshotsByVolume)
     * @param {Pointer<Integer>} pwszVolumeName Reserved for system use. Do not use.
     * @param {Guid} ProviderId Reserved for system use. Do not use.
     * @returns {IVssEnumObject} Reserved for system use. Do not use.
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivsssnapshotmgmt-querysnapshotsbyvolume
     */
    QuerySnapshotsByVolume(pwszVolumeName, ProviderId) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, pwszVolumeNameMarshal, pwszVolumeName, Guid, ProviderId, "ptr*", &ppEnum := 0, "HRESULT")
        return IVssEnumObject(ppEnum)
    }

    Query(iid) {
        if (IVssSnapshotMgmt.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProviderMgmtInterface := CallbackCreate(GetMethod(implObj, "GetProviderMgmtInterface"), flags, 4)
        this.vtbl.QueryVolumesSupportedForSnapshots := CallbackCreate(GetMethod(implObj, "QueryVolumesSupportedForSnapshots"), flags, 4)
        this.vtbl.QuerySnapshotsByVolume := CallbackCreate(GetMethod(implObj, "QuerySnapshotsByVolume"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProviderMgmtInterface)
        CallbackFree(this.vtbl.QueryVolumesSupportedForSnapshots)
        CallbackFree(this.vtbl.QuerySnapshotsByVolume)
    }
}
