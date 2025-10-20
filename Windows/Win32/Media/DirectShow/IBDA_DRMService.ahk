#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a device's Digital Rights Management (DRM) Service.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DRMService)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_drmservice
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_DRMService extends IUnknown{
    /**
     * The interface identifier for IBDA_DRMService
     * @type {Guid}
     */
    static IID => Guid("{bff6b5bb-b0ae-484c-9dca-73528fb0b46e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} puuidNewDrm 
     * @returns {HRESULT} 
     */
    SetDRM(puuidNewDrm) {
        result := ComCall(3, this, "ptr", puuidNewDrm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDrmUuidList 
     * @param {Pointer<Guid>} DrmUuid 
     * @returns {HRESULT} 
     */
    GetDRMStatus(pbstrDrmUuidList, DrmUuid) {
        result := ComCall(4, this, "ptr", pbstrDrmUuidList, "ptr", DrmUuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
