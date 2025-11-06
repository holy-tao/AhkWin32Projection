#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDiscMasterProgressEvents interface provides a single interface for all callbacks that can be made from IMAPI to an application.
 * @see https://docs.microsoft.com/windows/win32/api//imapi/nn-imapi-idiscmasterprogressevents
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscMasterProgressEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscMasterProgressEvents
     * @type {Guid}
     */
    static IID => Guid("{ec9e51c1-4e5d-11d3-9144-00104ba11c5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryCancel", "NotifyPnPActivity", "NotifyAddProgress", "NotifyBlockProgress", "NotifyTrackProgress", "NotifyPreparingBurn", "NotifyClosingDisc", "NotifyBurnComplete", "NotifyEraseComplete"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-querycancel
     */
    QueryCancel() {
        result := ComCall(3, this, "char*", &pbCancel := 0, "HRESULT")
        return pbCancel
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifypnpactivity
     */
    NotifyPnPActivity() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCompletedSteps 
     * @param {Integer} nTotalSteps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifyaddprogress
     */
    NotifyAddProgress(nCompletedSteps, nTotalSteps) {
        result := ComCall(5, this, "int", nCompletedSteps, "int", nTotalSteps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCompleted 
     * @param {Integer} nTotal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifyblockprogress
     */
    NotifyBlockProgress(nCompleted, nTotal) {
        result := ComCall(6, this, "int", nCompleted, "int", nTotal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCurrentTrack 
     * @param {Integer} nTotalTracks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifytrackprogress
     */
    NotifyTrackProgress(nCurrentTrack, nTotalTracks) {
        result := ComCall(7, this, "int", nCurrentTrack, "int", nTotalTracks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nEstimatedSeconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifypreparingburn
     */
    NotifyPreparingBurn(nEstimatedSeconds) {
        result := ComCall(8, this, "int", nEstimatedSeconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nEstimatedSeconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifyclosingdisc
     */
    NotifyClosingDisc(nEstimatedSeconds) {
        result := ComCall(9, this, "int", nEstimatedSeconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifyburncomplete
     */
    NotifyBurnComplete(status) {
        result := ComCall(10, this, "int", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifyerasecomplete
     */
    NotifyEraseComplete(status) {
        result := ComCall(11, this, "int", status, "HRESULT")
        return result
    }
}
