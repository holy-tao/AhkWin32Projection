#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersist.ahk

/**
 * The IMediaFilter interface controls the streaming state of a filter.All DirectShow filters implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediafilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaFilter extends IPersist{
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
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(5, this, "int")
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
        result := ComCall(6, this, "int64", tStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMilliSecsTimeout 
     * @param {Pointer<Int32>} State 
     * @returns {HRESULT} 
     */
    GetState(dwMilliSecsTimeout, State) {
        result := ComCall(7, this, "uint", dwMilliSecsTimeout, "int*", State, "int")
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
        result := ComCall(8, this, "ptr", pClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IReferenceClock>} pClock 
     * @returns {HRESULT} 
     */
    GetSyncSource(pClock) {
        result := ComCall(9, this, "ptr", pClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
