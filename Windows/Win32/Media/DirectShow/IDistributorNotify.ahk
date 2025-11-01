#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDistributorNotify interface enables a plug-in distributor to be notified when the filter graph changes.Applications never use this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idistributornotify
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDistributorNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDistributorNotify
     * @type {Guid}
     */
    static IID => Guid("{56a868af-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Stop", "Pause", "Run", "SetSyncSource", "NotifyGraphChange"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idistributornotify-stop
     */
    Stop() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idistributornotify-pause
     */
    Pause() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idistributornotify-run
     */
    Run(tStart) {
        result := ComCall(5, this, "int64", tStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IReferenceClock} pClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idistributornotify-setsyncsource
     */
    SetSyncSource(pClock) {
        result := ComCall(6, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idistributornotify-notifygraphchange
     */
    NotifyGraphChange() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
