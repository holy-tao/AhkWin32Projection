#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_DRIDRMService interface implements a Digital Rights Management (DRM) service for Media Transform Devices (MTDs) under the Protected Broadcast Driver Architecture (PBDA).
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DRIDRMService)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_dridrmservice
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_DRIDRMService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_DRIDRMService
     * @type {Guid}
     */
    static IID => Guid("{1f9bc2a5-44a3-4c52-aab1-0bbce5a1381d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDRM", "GetDRMStatus", "GetPairingStatus"]

    /**
     * 
     * @param {BSTR} bstrNewDrm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_dridrmservice-setdrm
     */
    SetDRM(bstrNewDrm) {
        bstrNewDrm := bstrNewDrm is String ? BSTR.Alloc(bstrNewDrm).Value : bstrNewDrm

        result := ComCall(3, this, "ptr", bstrNewDrm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDrmUuidList 
     * @param {Pointer<Guid>} DrmUuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_dridrmservice-getdrmstatus
     */
    GetDRMStatus(pbstrDrmUuidList, DrmUuid) {
        result := ComCall(4, this, "ptr", pbstrDrmUuidList, "ptr", DrmUuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penumPairingStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_dridrmservice-getpairingstatus
     */
    GetPairingStatus(penumPairingStatus) {
        result := ComCall(5, this, "int*", penumPairingStatus, "HRESULT")
        return result
    }
}
