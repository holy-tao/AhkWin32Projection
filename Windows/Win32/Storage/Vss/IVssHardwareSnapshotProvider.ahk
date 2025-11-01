#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains the methods used by VSS to map volumes to LUNs, discover LUNs created during the shadow copy process, and transport LUNs on a SAN.
 * @see https://docs.microsoft.com/windows/win32/api//vsprov/nn-vsprov-ivsshardwaresnapshotprovider
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssHardwareSnapshotProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssHardwareSnapshotProvider
     * @type {Guid}
     */
    static IID => Guid("{9593a157-44e9-4344-bbeb-44fbf9b06b10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AreLunsSupported", "FillInLunInfo", "BeginPrepareSnapshot", "GetTargetLuns", "LocateLuns", "OnLunEmpty"]

    /**
     * 
     * @param {Integer} lLunCount 
     * @param {Integer} lContext 
     * @param {Pointer<Pointer<Integer>>} rgwszDevices 
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInformation 
     * @param {Pointer<BOOL>} pbIsSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-arelunssupported
     */
    AreLunsSupported(lLunCount, lContext, rgwszDevices, pLunInformation, pbIsSupported) {
        result := ComCall(3, this, "int", lLunCount, "int", lContext, "ptr*", rgwszDevices, "ptr", pLunInformation, "ptr", pbIsSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} wszDeviceName 
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInfo 
     * @param {Pointer<BOOL>} pbIsSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-fillinluninfo
     */
    FillInLunInfo(wszDeviceName, pLunInfo, pbIsSupported) {
        wszDeviceNameMarshal := wszDeviceName is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, wszDeviceNameMarshal, wszDeviceName, "ptr", pLunInfo, "ptr", pbIsSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} SnapshotSetId 
     * @param {Guid} SnapshotId 
     * @param {Integer} lContext 
     * @param {Integer} lLunCount 
     * @param {Pointer<Pointer<Integer>>} rgDeviceNames 
     * @param {Pointer<VDS_LUN_INFORMATION>} rgLunInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-beginpreparesnapshot
     */
    BeginPrepareSnapshot(SnapshotSetId, SnapshotId, lContext, lLunCount, rgDeviceNames, rgLunInformation) {
        result := ComCall(5, this, "ptr", SnapshotSetId, "ptr", SnapshotId, "int", lContext, "int", lLunCount, "ptr*", rgDeviceNames, "ptr", rgLunInformation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLunCount 
     * @param {Pointer<Pointer<Integer>>} rgDeviceNames 
     * @param {Pointer<VDS_LUN_INFORMATION>} rgSourceLuns 
     * @param {Pointer<VDS_LUN_INFORMATION>} rgDestinationLuns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-gettargetluns
     */
    GetTargetLuns(lLunCount, rgDeviceNames, rgSourceLuns, rgDestinationLuns) {
        result := ComCall(6, this, "int", lLunCount, "ptr*", rgDeviceNames, "ptr", rgSourceLuns, "ptr", rgDestinationLuns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLunCount 
     * @param {Pointer<VDS_LUN_INFORMATION>} rgSourceLuns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-locateluns
     */
    LocateLuns(lLunCount, rgSourceLuns) {
        result := ComCall(7, this, "int", lLunCount, "ptr", rgSourceLuns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} wszDeviceName 
     * @param {Pointer<VDS_LUN_INFORMATION>} pInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-onlunempty
     */
    OnLunEmpty(wszDeviceName, pInformation) {
        wszDeviceNameMarshal := wszDeviceName is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, wszDeviceNameMarshal, wszDeviceName, "ptr", pInformation, "HRESULT")
        return result
    }
}
