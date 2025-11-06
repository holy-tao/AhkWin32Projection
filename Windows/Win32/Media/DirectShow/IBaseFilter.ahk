#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumPins.ahk
#Include .\IPin.ahk
#Include .\FILTER_INFO.ahk
#Include .\IMediaFilter.ahk

/**
 * The IBaseFilter interface is the primary interface for DirectShow filters.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ibasefilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBaseFilter extends IMediaFilter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBaseFilter
     * @type {Guid}
     */
    static IID => Guid("{56a86895-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumPins", "FindPin", "QueryFilterInfo", "JoinFilterGraph", "QueryVendorInfo"]

    /**
     * 
     * @returns {IEnumPins} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibasefilter-enumpins
     */
    EnumPins() {
        result := ComCall(10, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPins(ppEnum)
    }

    /**
     * 
     * @param {PWSTR} Id 
     * @returns {IPin} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibasefilter-findpin
     */
    FindPin(Id) {
        Id := Id is String ? StrPtr(Id) : Id

        result := ComCall(11, this, "ptr", Id, "ptr*", &ppPin := 0, "HRESULT")
        return IPin(ppPin)
    }

    /**
     * 
     * @returns {FILTER_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibasefilter-queryfilterinfo
     */
    QueryFilterInfo() {
        pInfo := FILTER_INFO()
        result := ComCall(12, this, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * 
     * @param {IFilterGraph} pGraph 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibasefilter-joinfiltergraph
     */
    JoinFilterGraph(pGraph, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(13, this, "ptr", pGraph, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibasefilter-queryvendorinfo
     */
    QueryVendorInfo() {
        result := ComCall(14, this, "ptr*", &pVendorInfo := 0, "HRESULT")
        return pVendorInfo
    }
}
