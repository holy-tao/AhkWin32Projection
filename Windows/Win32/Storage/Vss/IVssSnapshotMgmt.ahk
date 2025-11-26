#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IVssEnumMgmtObject.ahk
#Include .\IVssEnumObject.ahk

/**
 * Provides a method that returns an interface to further configure a shadow copy provider.
 * @remarks
 * 
 * The <b>IVssSnapshotMgmt</b> interface can be invoked 
 *     remotely using DCOM. The caller must be a member of the local administrators group on the remote machine.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/nn-vsmgmt-ivsssnapshotmgmt
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssSnapshotMgmt extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssSnapshotMgmt
     * @type {Guid}
     */
    static IID => Guid("{fa7df749-66e7-4986-a27f-e2f04ae53772}")

    /**
     * The class identifier for VssSnapshotMgmt
     * @type {Guid}
     */
    static CLSID => Guid("{0b5a2c52-3eb9-470a-96e2-6c6d4570e40f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProviderMgmtInterface", "QueryVolumesSupportedForSnapshots", "QuerySnapshotsByVolume"]

    /**
     * Returns an interface to further configure the system provider.
     * @param {Guid} ProviderId This must be the system provider. The  <b>VSS_ID</b> for the system provider <c>{b5946137-7b9f-4925-af80-51abd60b20d5}</c>.
     * @param {Pointer<Guid>} InterfaceId Must be <b>IID_IVssDifferentialSoftwareSnapshotMgmt</b>, which represents the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nn-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt">IVssDifferentialSoftwareSnapshotMgmt</a> 
     *       interface.
     * @returns {IUnknown} Address of an interface pointer that is filled in with the returned interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/nf-vsmgmt-ivsssnapshotmgmt-getprovidermgmtinterface
     */
    GetProviderMgmtInterface(ProviderId, InterfaceId) {
        result := ComCall(3, this, "ptr", ProviderId, "ptr", InterfaceId, "ptr*", &ppItf := 0, "HRESULT")
        return IUnknown(ppItf)
    }

    /**
     * Reserved for system use.
     * @param {Guid} ProviderId Reserved for system use. Do not use.
     * @param {Integer} lContext Reserved for system use. Do not use.
     * @returns {IVssEnumMgmtObject} Reserved for system use. Do not use.
     * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/nf-vsmgmt-ivsssnapshotmgmt-queryvolumessupportedforsnapshots
     */
    QueryVolumesSupportedForSnapshots(ProviderId, lContext) {
        result := ComCall(4, this, "ptr", ProviderId, "int", lContext, "ptr*", &ppEnum := 0, "HRESULT")
        return IVssEnumMgmtObject(ppEnum)
    }

    /**
     * Reserved for system use.
     * @param {Pointer<Integer>} pwszVolumeName Reserved for system use. Do not use.
     * @param {Guid} ProviderId Reserved for system use. Do not use.
     * @returns {IVssEnumObject} Reserved for system use. Do not use.
     * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/nf-vsmgmt-ivsssnapshotmgmt-querysnapshotsbyvolume
     */
    QuerySnapshotsByVolume(pwszVolumeName, ProviderId) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, pwszVolumeNameMarshal, pwszVolumeName, "ptr", ProviderId, "ptr*", &ppEnum := 0, "HRESULT")
        return IVssEnumObject(ppEnum)
    }
}
