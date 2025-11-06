#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\IReferenceClock.ahk
#Include ..\..\System\Com\IPersist.ahk

/**
 * The IMediaFilter interface controls the streaming state of a filter.All DirectShow filters implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediafilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaFilter extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFilter
     * @type {Guid}
     */
    static IID => Guid("{56a86899-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Stop", "Pause", "Run", "GetState", "SetSyncSource", "GetSyncSource"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediafilter-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediafilter-pause
     */
    Pause() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediafilter-run
     */
    Run(tStart) {
        result := ComCall(6, this, "int64", tStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMilliSecsTimeout 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediafilter-getstate
     */
    GetState(dwMilliSecsTimeout) {
        result := ComCall(7, this, "uint", dwMilliSecsTimeout, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * 
     * @param {IReferenceClock} pClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediafilter-setsyncsource
     */
    SetSyncSource(pClock) {
        result := ComCall(8, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IReferenceClock} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediafilter-getsyncsource
     */
    GetSyncSource() {
        result := ComCall(9, this, "ptr*", &pClock := 0, "HRESULT")
        return IReferenceClock(pClock)
    }
}
