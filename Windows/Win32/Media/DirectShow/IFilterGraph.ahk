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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFilter", "RemoveFilter", "EnumFilters", "FindFilterByName", "ConnectDirect", "Reconnect", "Disconnect", "SetDefaultSyncSource"]

    /**
     * 
     * @param {IBaseFilter} pFilter 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-addfilter
     */
    AddFilter(pFilter, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(3, this, "ptr", pFilter, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBaseFilter} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-removefilter
     */
    RemoveFilter(pFilter) {
        result := ComCall(4, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumFilters>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-enumfilters
     */
    EnumFilters(ppEnum) {
        result := ComCall(5, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Pointer<IBaseFilter>} ppFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-findfilterbyname
     */
    FindFilterByName(pName, ppFilter) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(6, this, "ptr", pName, "ptr*", ppFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPin} ppinOut 
     * @param {IPin} ppinIn 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-connectdirect
     */
    ConnectDirect(ppinOut, ppinIn, pmt) {
        result := ComCall(7, this, "ptr", ppinOut, "ptr", ppinIn, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPin} ppin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-reconnect
     */
    Reconnect(ppin) {
        result := ComCall(8, this, "ptr", ppin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPin} ppin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-disconnect
     */
    Disconnect(ppin) {
        result := ComCall(9, this, "ptr", ppin, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-setdefaultsyncsource
     */
    SetDefaultSyncSource() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
