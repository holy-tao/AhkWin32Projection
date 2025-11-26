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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDRM", "GetDRMStatus"]

    /**
     * Activates a digital rights management (DRM) system on the media transform device (MTD).
     * @param {Pointer<Guid>} puuidNewDrm Pointer to a GUID that specifies the DRM system.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_drmservice-setdrm
     */
    SetDRM(puuidNewDrm) {
        result := ComCall(3, this, "ptr", puuidNewDrm, "HRESULT")
        return result
    }

    /**
     * Gets the current digital rights management (DRM) status.
     * @param {Pointer<BSTR>} pbstrDrmUuidList Receives a comma-separated list of GUIDs that identify the DRM systems supported by the media transform device (MTD). Each GUID is represented in following format: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx". The caller must release the string by calling <b>SysFreeString</b>.
     * @param {Pointer<Guid>} DrmUuid Receives a GUID that identifies which DRM system is currently active.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_drmservice-getdrmstatus
     */
    GetDRMStatus(pbstrDrmUuidList, DrmUuid) {
        result := ComCall(4, this, "ptr", pbstrDrmUuidList, "ptr", DrmUuid, "HRESULT")
        return result
    }
}
