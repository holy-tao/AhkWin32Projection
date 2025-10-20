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
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tStart 
     * @returns {HRESULT} 
     */
    Run(tStart) {
        result := ComCall(5, this, "int64", tStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IReferenceClock>} pClock 
     * @returns {HRESULT} 
     */
    SetSyncSource(pClock) {
        result := ComCall(6, this, "ptr", pClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyGraphChange() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
