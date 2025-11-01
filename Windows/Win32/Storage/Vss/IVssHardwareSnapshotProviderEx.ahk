#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssHardwareSnapshotProvider.ahk

/**
 * Provides an additional method used by VSS to notify hardware providers of LUN state changes.
 * @see https://docs.microsoft.com/windows/win32/api//vsprov/nn-vsprov-ivsshardwaresnapshotproviderex
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssHardwareSnapshotProviderEx extends IVssHardwareSnapshotProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssHardwareSnapshotProviderEx
     * @type {Guid}
     */
    static IID => Guid("{7f5ba925-cdb1-4d11-a71f-339eb7e709fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProviderCapabilities", "OnLunStateChange", "ResyncLuns", "OnReuseLuns"]

    /**
     * 
     * @param {Pointer<Integer>} pllOriginalCapabilityMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-getprovidercapabilities
     */
    GetProviderCapabilities(pllOriginalCapabilityMask) {
        pllOriginalCapabilityMaskMarshal := pllOriginalCapabilityMask is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pllOriginalCapabilityMaskMarshal, pllOriginalCapabilityMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_LUN_INFORMATION>} pSnapshotLuns 
     * @param {Pointer<VDS_LUN_INFORMATION>} pOriginalLuns 
     * @param {Integer} dwCount 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-onlunstatechange
     */
    OnLunStateChange(pSnapshotLuns, pOriginalLuns, dwCount, dwFlags) {
        result := ComCall(10, this, "ptr", pSnapshotLuns, "ptr", pOriginalLuns, "uint", dwCount, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_LUN_INFORMATION>} pSourceLuns 
     * @param {Pointer<VDS_LUN_INFORMATION>} pTargetLuns 
     * @param {Integer} dwCount 
     * @param {Pointer<IVssAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-resyncluns
     */
    ResyncLuns(pSourceLuns, pTargetLuns, dwCount, ppAsync) {
        result := ComCall(11, this, "ptr", pSourceLuns, "ptr", pTargetLuns, "uint", dwCount, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_LUN_INFORMATION>} pSnapshotLuns 
     * @param {Pointer<VDS_LUN_INFORMATION>} pOriginalLuns 
     * @param {Integer} dwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-onreuseluns
     */
    OnReuseLuns(pSnapshotLuns, pOriginalLuns, dwCount) {
        result := ComCall(12, this, "ptr", pSnapshotLuns, "ptr", pOriginalLuns, "uint", dwCount, "HRESULT")
        return result
    }
}
