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
     * 
     * @param {Integer} lLunCount 
     * @param {Integer} lContext 
     * @param {Pointer<UInt16>} rgwszDevices 
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInformation 
     * @param {Pointer<BOOL>} pbIsSupported 
     * @returns {HRESULT} 
     */
    AreLunsSupported(lLunCount, lContext, rgwszDevices, pLunInformation, pbIsSupported) {
        result := ComCall(3, this, "int", lLunCount, "int", lContext, "ushort*", rgwszDevices, "ptr", pLunInformation, "ptr", pbIsSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} wszDeviceName 
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInfo 
     * @param {Pointer<BOOL>} pbIsSupported 
     * @returns {HRESULT} 
     */
    FillInLunInfo(wszDeviceName, pLunInfo, pbIsSupported) {
        result := ComCall(4, this, "ushort*", wszDeviceName, "ptr", pLunInfo, "ptr", pbIsSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SnapshotSetId 
     * @param {Pointer<Guid>} SnapshotId 
     * @param {Integer} lContext 
     * @param {Integer} lLunCount 
     * @param {Pointer<UInt16>} rgDeviceNames 
     * @param {Pointer<VDS_LUN_INFORMATION>} rgLunInformation 
     * @returns {HRESULT} 
     */
    BeginPrepareSnapshot(SnapshotSetId, SnapshotId, lContext, lLunCount, rgDeviceNames, rgLunInformation) {
        result := ComCall(5, this, "ptr", SnapshotSetId, "ptr", SnapshotId, "int", lContext, "int", lLunCount, "ushort*", rgDeviceNames, "ptr", rgLunInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLunCount 
     * @param {Pointer<UInt16>} rgDeviceNames 
     * @param {Pointer<VDS_LUN_INFORMATION>} rgSourceLuns 
     * @param {Pointer<VDS_LUN_INFORMATION>} rgDestinationLuns 
     * @returns {HRESULT} 
     */
    GetTargetLuns(lLunCount, rgDeviceNames, rgSourceLuns, rgDestinationLuns) {
        result := ComCall(6, this, "int", lLunCount, "ushort*", rgDeviceNames, "ptr", rgSourceLuns, "ptr", rgDestinationLuns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLunCount 
     * @param {Pointer<VDS_LUN_INFORMATION>} rgSourceLuns 
     * @returns {HRESULT} 
     */
    LocateLuns(lLunCount, rgSourceLuns) {
        result := ComCall(7, this, "int", lLunCount, "ptr", rgSourceLuns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} wszDeviceName 
     * @param {Pointer<VDS_LUN_INFORMATION>} pInformation 
     * @returns {HRESULT} 
     */
    OnLunEmpty(wszDeviceName, pInformation) {
        result := ComCall(8, this, "ushort*", wszDeviceName, "ptr", pInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
