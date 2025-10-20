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
     * 
     * @param {Pointer<Byte>} pbCancel 
     * @returns {HRESULT} 
     */
    QueryCancel(pbCancel) {
        result := ComCall(3, this, "char*", pbCancel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyPnPActivity() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCompletedSteps 
     * @param {Integer} nTotalSteps 
     * @returns {HRESULT} 
     */
    NotifyAddProgress(nCompletedSteps, nTotalSteps) {
        result := ComCall(5, this, "int", nCompletedSteps, "int", nTotalSteps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCompleted 
     * @param {Integer} nTotal 
     * @returns {HRESULT} 
     */
    NotifyBlockProgress(nCompleted, nTotal) {
        result := ComCall(6, this, "int", nCompleted, "int", nTotal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCurrentTrack 
     * @param {Integer} nTotalTracks 
     * @returns {HRESULT} 
     */
    NotifyTrackProgress(nCurrentTrack, nTotalTracks) {
        result := ComCall(7, this, "int", nCurrentTrack, "int", nTotalTracks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nEstimatedSeconds 
     * @returns {HRESULT} 
     */
    NotifyPreparingBurn(nEstimatedSeconds) {
        result := ComCall(8, this, "int", nEstimatedSeconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nEstimatedSeconds 
     * @returns {HRESULT} 
     */
    NotifyClosingDisc(nEstimatedSeconds) {
        result := ComCall(9, this, "int", nEstimatedSeconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     */
    NotifyBurnComplete(status) {
        result := ComCall(10, this, "int", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     */
    NotifyEraseComplete(status) {
        result := ComCall(11, this, "int", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
