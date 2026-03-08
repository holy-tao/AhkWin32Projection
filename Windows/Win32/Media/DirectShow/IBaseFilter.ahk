#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumPins.ahk
#Include .\IPin.ahk
#Include .\FILTER_INFO.ahk
#Include .\IMediaFilter.ahk

/**
 * The IBaseFilter interface is the primary interface for DirectShow filters.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ibasefilter
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
     * @remarks
     * This method returns an enumerator that supports the <b>IEnumPins</b> interface, which works like a standard COM enumerator. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/enumerating-pins">Enumerating Pins</a>.
     * 
     * If the method succeeds, the <b>IEnumPins</b> interface has an outstanding reference count. Be sure to release the interface when you are done.
     * @returns {IEnumPins} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumpins">IEnumPins</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibasefilter-enumpins
     */
    EnumPins() {
        result := ComCall(10, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPins(ppEnum)
    }

    /**
     * The FindPin method retrieves the pin with the specified identifier.
     * @remarks
     * This method supports graph persistence. Use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-queryid">IPin::QueryId</a> method to save a pin's state, and use this method to restore the state. The pin's identifier string is defined by the filter implementation. The identifier must be unique within the filter.
     * 
     * If the method succeeds, the <b>IPin</b> interface that it returns has an outstanding reference count. Be sure to release the interface when you are done.
     * @param {PWSTR} Id Pointer to a constant wide-character string that identifies the pin. Call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-queryid">IPin::QueryId</a> method to retrieve a pin's identifier.
     * @returns {IPin} Address of a variable that receives a pointer to the pin's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface. If the method fails, <i>*ppPin</i> is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibasefilter-findpin
     */
    FindPin(Id) {
        Id := Id is String ? StrPtr(Id) : Id

        result := ComCall(11, this, "ptr", Id, "ptr*", &ppPin := 0, "HRESULT")
        return IPin(ppPin)
    }

    /**
     * The QueryFilterInfo method retrieves information about the filter.
     * @remarks
     * This method fills the <b>FILTER_INFO</b> structure with the filter information. On return, if the <b>pGraph</b> member of the <b>FILTER_INFO</b> structure is non-<b>NULL</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltergraph">IFilterGraph</a> interface has an outstanding reference count. Be sure to release the interface when you are done.
     * @returns {FILTER_INFO} Pointer to a [FILTER_INFO](/windows/desktop/api/strmif/ns-strmif-filter_info) structure.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibasefilter-queryfilterinfo
     */
    QueryFilterInfo() {
        pInfo := FILTER_INFO()
        result := ComCall(12, this, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * The JoinFilterGraph method notifies the filter that it has joined or left the filter graph.
     * @remarks
     * When the Filter Graph Manager adds a filter to the filter graph, it calls this method with a pointer to itself. It assigns a name for this instance of the filter through the <i>pName</i> parameter. The name can be retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ibasefilter-queryfilterinfo">IBaseFilter::QueryFilterInfo</a> method.
     * 
     * When the Filter Graph Manager removes the filter from the graph, it calls this method with a <b>NULL</b> pointer.
     * 
     * Applications should never call this method. To add a filter to the graph, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltergraph-addfilter">IFilterGraph::AddFilter</a> method on the filter graph manager.
     * 
     * <b>Filter developers</b>: The filter can store the <b>IFilterGraph</b> interface pointer and query it for other Filter Graph Manager interfaces. However, it must never hold a reference count on the Filter Graph Manager. Doing so creates a circular reference count, because the Filter Graph Manager keeps a reference count on the filter. A circular reference count prevents the interface from being released properly, which can lead to a deadlock. The <b>IFilterGraph</b> interface is guaranteed to be valid until the Filter Graph Manager calls this method again with the value <b>NULL</b>. For an implementation of this method, see the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbasefilter-joinfiltergraph">CBaseFilter::JoinFilterGraph</a> method.
     * @param {IFilterGraph} pGraph Pointer to the Filter Graph Manager's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltergraph">IFilterGraph</a> interface, or <b>NULL</b> if the filter is leaving the graph.
     * @param {PWSTR} pName Pointer to a wide-character string that specifies a name for the filter.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibasefilter-joinfiltergraph
     */
    JoinFilterGraph(pGraph, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(13, this, "ptr", pGraph, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * The QueryVendorInfo method retrieves a string containing vendor information.
     * @remarks
     * This method is optional; filters are not required to support it.
     * 
     * If the method is supported, it uses the <b>CoTaskMemAlloc</b> function to allocate memory for the string. Call the <b>CoTaskMemFree</b> function to free the memory.
     * @returns {PWSTR} Address of a variable that receives a pointer to a wide-character string containing the vendor information.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibasefilter-queryvendorinfo
     */
    QueryVendorInfo() {
        result := ComCall(14, this, "ptr*", &pVendorInfo := 0, "HRESULT")
        return pVendorInfo
    }
}
