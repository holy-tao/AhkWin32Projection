#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMGraphBuilderCallback interface provides a callback mechanism during graph building.To use this interface, implement the interface in your application or client object.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-iamgraphbuildercallback
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMGraphBuilderCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMGraphBuilderCallback
     * @type {Guid}
     */
    static IID => Guid("{4995f511-9ddb-4f12-bd3b-f04611807b79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectedFilter", "CreatedFilter"]

    /**
     * The Filter Graph Manager calls this method when it finds a candidate filter for the graph, but before it creates the filter.
     * @remarks
     * This method enables the client to examine a filter to determine whether it is acceptable for the current filter graph.
     * 
     * The Filter Graph Manager holds a graph-wide critical section while it calls this method. Therefore, the callback method should avoid calling any methods on the Filter Graph Manager, or any methods on filters that might change the graph state (such as disconnecting pins). Doing so might cause a deadlock or other unexpected behaviors.
     * @param {IMoniker} pMon Pointer to a moniker that contains information about the filter.
     * @returns {HRESULT} If the method returns a success code, the Filter Graph Manager creates the filter and tries to connect it. If the method returns a failure code, the Filter Graph Manager rejects the filter.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iamgraphbuildercallback-selectedfilter
     */
    SelectedFilter(pMon) {
        result := ComCall(3, this, "ptr", pMon, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Filter Graph Manager calls this method after it has created a filter, but before it attempts to connect the filter.
     * @remarks
     * This method enables the client to configure the filter immediately after it has been created. The Video Mixing Renderer is the primary example of a filter that requires configuration before it is connected. Most other DirectShow filters can be configured after they are connected.
     * 
     * The Filter Graph Manager holds a graph-wide critical section while it calls this method. Therefore, the callback method should avoid calling any methods on the Filter Graph Manager, or any methods on filters that might change the graph state (such as disconnecting pins). Doing so might cause a deadlock or other unexpected behaviors.
     * @param {IBaseFilter} pFil Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter.
     * @returns {HRESULT} If the method returns a success code, the Filter Graph Manager tries to connect the filter. If the method returns a failure code, the Filter Graph Manager rejects the filter.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iamgraphbuildercallback-createdfilter
     */
    CreatedFilter(pFil) {
        result := ComCall(4, this, "ptr", pFil, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
