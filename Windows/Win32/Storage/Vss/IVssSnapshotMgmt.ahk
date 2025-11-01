#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
     * 
     * @param {Guid} ProviderId 
     * @param {Pointer<Guid>} InterfaceId 
     * @param {Pointer<IUnknown>} ppItf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivsssnapshotmgmt-getprovidermgmtinterface
     */
    GetProviderMgmtInterface(ProviderId, InterfaceId, ppItf) {
        result := ComCall(3, this, "ptr", ProviderId, "ptr", InterfaceId, "ptr*", ppItf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProviderId 
     * @param {Integer} lContext 
     * @param {Pointer<IVssEnumMgmtObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivsssnapshotmgmt-queryvolumessupportedforsnapshots
     */
    QueryVolumesSupportedForSnapshots(ProviderId, lContext, ppEnum) {
        result := ComCall(4, this, "ptr", ProviderId, "int", lContext, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwszVolumeName 
     * @param {Guid} ProviderId 
     * @param {Pointer<IVssEnumObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivsssnapshotmgmt-querysnapshotsbyvolume
     */
    QuerySnapshotsByVolume(pwszVolumeName, ProviderId, ppEnum) {
        result := ComCall(5, this, "ushort*", pwszVolumeName, "ptr", ProviderId, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
