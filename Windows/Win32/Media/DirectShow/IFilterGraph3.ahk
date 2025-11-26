#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFilterGraph2.ahk

/**
 * The IFilterGraph3 interface extends the IFilterGraph2 interface, which contains methods for building filter graphs.The Filter Graph Manager implements this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifiltergraph3
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterGraph3 extends IFilterGraph2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilterGraph3
     * @type {Guid}
     */
    static IID => Guid("{aaf38154-b80b-422f-91e6-b66467509a07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSyncSourceEx"]

    /**
     * The SetSyncSourceEx method establishes two reference clocks for the filter graph:\_a primary clock that is used by most of the filters, and a secondary clock that is used only by one specified filter.
     * @param {IReferenceClock} pClockForMostOfFilterGraph Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ireferenceclock">IReferenceClock</a> interface of the main reference clock. Every filter in the graph uses this clock, except for the filter specified by the <i>pFilter</i> parameter.
     * @param {IReferenceClock} pClockForFilter Pointer to the <b>IReferenceClock</b> interface of the secondary clock. The filter specified by the <i>pFilter</i> parameter uses this clock.
     * @param {IBaseFilter} pFilter Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of a filter in the graph. This filter uses the secondary reference clock.
     * @returns {HRESULT} Returns and <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter graph is not stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph3-setsyncsourceex
     */
    SetSyncSourceEx(pClockForMostOfFilterGraph, pClockForFilter, pFilter) {
        result := ComCall(21, this, "ptr", pClockForMostOfFilterGraph, "ptr", pClockForFilter, "ptr", pFilter, "HRESULT")
        return result
    }
}
