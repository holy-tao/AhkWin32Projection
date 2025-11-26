#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMGraphStreams interface controls a filter graph that renders a live source.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamgraphstreams
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
     * @param {IPin} pPin Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of a pin. The pin must belong to a filter in the filter graph.
     * @param {Pointer<Guid>} riid Reference to an interface identifier (IID) that specifies the interface to find.
     * @param {Integer} dwFlags Combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_am_intf_search_flags">AM_INTF_SEARCH_FLAGS</a> enumeration, specifying what to search (pins or filters).
     * @returns {Pointer<Void>} Address of a void pointer. If the method succeeds, this variable receives a pointer to the interface specified by <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamgraphstreams-findupstreaminterface
     */
    FindUpstreamInterface(pPin, riid, dwFlags) {
        result := ComCall(3, this, "ptr", pPin, "ptr", riid, "ptr*", &ppvInterface := 0, "uint", dwFlags, "HRESULT")
        return ppvInterface
    }

    /**
     * The SyncUsingStreamOffset method enables or disables synchronization using time-stamp offsets.
     * @param {BOOL} bUseStreamOffset Boolean value indicating whether to use a time-stamp offset. If <b>TRUE</b>, live sources will use a time-stamp offset to synchronize streams.
     * @returns {HRESULT} Returns S_OK if successsful, or an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamgraphstreams-syncusingstreamoffset
     */
    SyncUsingStreamOffset(bUseStreamOffset) {
        result := ComCall(4, this, "int", bUseStreamOffset, "HRESULT")
        return result
    }

    /**
     * The SetMaxGraphLatency method sets the maximum latency for the graph. You must call the IAMGraphStreams::SyncUsingStreamOffset method before calling this method.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamgraphstreams-setmaxgraphlatency
     */
    SetMaxGraphLatency(rtMaxGraphLatency) {
        result := ComCall(5, this, "int64", rtMaxGraphLatency, "HRESULT")
        return result
    }
}
