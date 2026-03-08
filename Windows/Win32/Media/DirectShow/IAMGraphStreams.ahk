#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMGraphStreams interface controls a filter graph that renders a live source.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamgraphstreams
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMGraphStreams extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMGraphStreams
     * @type {Guid}
     */
    static IID => Guid("{632105fa-072e-11d3-8af9-00c04fb6bd3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindUpstreamInterface", "SyncUsingStreamOffset", "SetMaxGraphLatency"]

    /**
     * The FindUpstreamInterface method searches the filter graph for a specified interface, upstream from a specified pin.
     * @remarks
     * If <i>dwFlags</i> is zero, this method searches for the interface in the following order:
     * 
     * <ol>
     * <li>It queries the pin specified by <i>pPin</i>.</li>
     * <li>
     * If <i>pPin</i> is an input pin, it calls <b>FindUpstreamInterface</b> recursively on the output pin that is connected to <i>pPin</i>, if any.
     * 
     * If <i>pPin</i> is an output pin, it queries the filter that owns <i>pPin</i>. Then it creates a list of input pins on the filter that have internal connections to <i>pPin</i>, and calls <c>FindUpstreamInterface</c> recursively on those input pins.
     * 
     * To create a list of input pins with internal connections, the method does the following:
     * 
     * <ul>
     * <li>Calls <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-queryinternalconnections">IPin::QueryInternalConnections</a>.</li>
     * <li>If that fails, calls <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ibasefilter-enumpins">IBaseFilter::EnumPins</a> and looks for input pins.</li>
     * </ul>
     * </li>
     * </ol>
     * It stops at the first object it finds that supports the interface. You can limit the objects that are searched (filters, input pin, or output pins) by setting <i>dwFlags</i> to a non-zero value.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder2-findinterface">ICaptureGraphBuilder2::FindInterface</a> method implements a more general approach to this problem, and in most situations is preferred.</div>
     * <div> </div>
     * @param {IPin} pPin Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of a pin. The pin must belong to a filter in the filter graph.
     * @param {Pointer<Guid>} riid Reference to an interface identifier (IID) that specifies the interface to find.
     * @param {Integer} dwFlags Combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_am_intf_search_flags">AM_INTF_SEARCH_FLAGS</a> enumeration, specifying what to search (pins or filters).
     * @returns {Pointer<Void>} Address of a void pointer. If the method succeeds, this variable receives a pointer to the interface specified by <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamgraphstreams-findupstreaminterface
     */
    FindUpstreamInterface(pPin, riid, dwFlags) {
        result := ComCall(3, this, "ptr", pPin, "ptr", riid, "ptr*", &ppvInterface := 0, "uint", dwFlags, "HRESULT")
        return ppvInterface
    }

    /**
     * The SyncUsingStreamOffset method enables or disables synchronization using time-stamp offsets.
     * @remarks
     * By default, the filter graph does not attempt to synchronize live streams by means of time-stamp offsets. Call this method with a value of <b>TRUE</b> if you want the filter graph to determine the maximum latency in the graph and adjust time stamps accordingly. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iampushsource-setstreamoffset">IAMPushSource::SetStreamOffset</a>.
     * @param {BOOL} bUseStreamOffset Boolean value indicating whether to use a time-stamp offset. If <b>TRUE</b>, live sources will use a time-stamp offset to synchronize streams.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamgraphstreams-syncusingstreamoffset
     */
    SyncUsingStreamOffset(bUseStreamOffset) {
        result := ComCall(4, this, "int", bUseStreamOffset, "HRESULT")
        return result
    }

    /**
     * The SetMaxGraphLatency method sets the maximum latency for the graph. You must call the IAMGraphStreams::SyncUsingStreamOffset method before calling this method.
     * @remarks
     * At connection time, some live source filters use the maximum latency to determine the size of buffer to allocate. Calling this method before constructing the graph can help to ensure that sufficient buffers are allocated for the expected latency.
     * 
     * If you call this method before calling <b>SyncUsingStreamOffset</b>, the method returns E_FAIL.
     * @param {Integer} rtMaxGraphLatency Specifies the maximum latency in 100-nanosecond units.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamgraphstreams-setmaxgraphlatency
     */
    SetMaxGraphLatency(rtMaxGraphLatency) {
        result := ComCall(5, this, "int64", rtMaxGraphLatency, "HRESULT")
        return result
    }
}
