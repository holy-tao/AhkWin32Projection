#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFilterGraph interface provides methods for building a filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifiltergraph
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterGraph extends IUnknown{
    /**
     * The interface identifier for IFilterGraph
     * @type {Guid}
     */
    static IID => Guid("{56a8689f-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IBaseFilter>} pFilter 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     */
    AddFilter(pFilter, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(3, this, "ptr", pFilter, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBaseFilter>} pFilter 
     * @returns {HRESULT} 
     */
    RemoveFilter(pFilter) {
        result := ComCall(4, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumFilters>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumFilters(ppEnum) {
        result := ComCall(5, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Pointer<IBaseFilter>} ppFilter 
     * @returns {HRESULT} 
     */
    FindFilterByName(pName, ppFilter) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(6, this, "ptr", pName, "ptr", ppFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} ppinOut 
     * @param {Pointer<IPin>} ppinIn 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    ConnectDirect(ppinOut, ppinIn, pmt) {
        result := ComCall(7, this, "ptr", ppinOut, "ptr", ppinIn, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} ppin 
     * @returns {HRESULT} 
     */
    Reconnect(ppin) {
        result := ComCall(8, this, "ptr", ppin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} ppin 
     * @returns {HRESULT} 
     */
    Disconnect(ppin) {
        result := ComCall(9, this, "ptr", ppin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetDefaultSyncSource() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
