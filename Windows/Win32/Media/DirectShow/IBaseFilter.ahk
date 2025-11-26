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
     * The EnumPins method enumerates the pins on this filter.
     * @returns {IEnumPins} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumpins">IEnumPins</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ibasefilter-enumpins
     */
    EnumPins() {
        result := ComCall(10, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPins(ppEnum)
    }

    /**
     * The FindPin method retrieves the pin with the specified identifier.
     * @param {PWSTR} Id Pointer to a constant wide-character string that identifies the pin. Call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-queryid">IPin::QueryId</a> method to retrieve a pin's identifier.
     * @returns {IPin} Address of a variable that receives a pointer to the pin's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface. If the method fails, <i>*ppPin</i> is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ibasefilter-findpin
     */
    FindPin(Id) {
        Id := Id is String ? StrPtr(Id) : Id

        result := ComCall(11, this, "ptr", Id, "ptr*", &ppPin := 0, "HRESULT")
        return IPin(ppPin)
    }

    /**
     * The QueryFilterInfo method retrieves information about the filter.
     * @returns {FILTER_INFO} Pointer to a [FILTER_INFO](/windows/desktop/api/strmif/ns-strmif-filter_info) structure.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ibasefilter-queryfilterinfo
     */
    QueryFilterInfo() {
        pInfo := FILTER_INFO()
        result := ComCall(12, this, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * The JoinFilterGraph method notifies the filter that it has joined or left the filter graph.
     * @param {IFilterGraph} pGraph Pointer to the Filter Graph Manager's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltergraph">IFilterGraph</a> interface, or <b>NULL</b> if the filter is leaving the graph.
     * @param {PWSTR} pName Pointer to a wide-character string that specifies a name for the filter.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ibasefilter-joinfiltergraph
     */
    JoinFilterGraph(pGraph, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(13, this, "ptr", pGraph, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * The QueryVendorInfo method retrieves a string containing vendor information.
     * @returns {PWSTR} Address of a variable that receives a pointer to a wide-character string containing the vendor information.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ibasefilter-queryvendorinfo
     */
    QueryVendorInfo() {
        result := ComCall(14, this, "ptr*", &pVendorInfo := 0, "HRESULT")
        return pVendorInfo
    }
}
