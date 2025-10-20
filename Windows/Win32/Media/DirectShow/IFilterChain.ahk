#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFilterChain interface provides methods for starting, stopping, or removing chains of filters in a filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifilterchain
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterChain extends IUnknown{
    /**
     * The interface identifier for IFilterChain
     * @type {Guid}
     */
    static IID => Guid("{dcfbdcf6-0dc2-45f5-9ab2-7c330ea09c29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IBaseFilter>} pStartFilter 
     * @param {Pointer<IBaseFilter>} pEndFilter 
     * @returns {HRESULT} 
     */
    StartChain(pStartFilter, pEndFilter) {
        result := ComCall(3, this, "ptr", pStartFilter, "ptr", pEndFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBaseFilter>} pStartFilter 
     * @param {Pointer<IBaseFilter>} pEndFilter 
     * @returns {HRESULT} 
     */
    PauseChain(pStartFilter, pEndFilter) {
        result := ComCall(4, this, "ptr", pStartFilter, "ptr", pEndFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBaseFilter>} pStartFilter 
     * @param {Pointer<IBaseFilter>} pEndFilter 
     * @returns {HRESULT} 
     */
    StopChain(pStartFilter, pEndFilter) {
        result := ComCall(5, this, "ptr", pStartFilter, "ptr", pEndFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBaseFilter>} pStartFilter 
     * @param {Pointer<IBaseFilter>} pEndFilter 
     * @returns {HRESULT} 
     */
    RemoveChain(pStartFilter, pEndFilter) {
        result := ComCall(6, this, "ptr", pStartFilter, "ptr", pEndFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
