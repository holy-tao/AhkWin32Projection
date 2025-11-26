#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\IReferenceClock.ahk
#Include ..\..\System\Com\IPersist.ahk

/**
 * The IMediaFilter interface controls the streaming state of a filter.All DirectShow filters implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediafilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaFilter extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFilter
     * @type {Guid}
     */
    static IID => Guid("{56a86899-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Stop", "Pause", "Run", "GetState", "SetSyncSource", "GetSyncSource"]

    /**
     * The Stop method stops the filter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transition is not complete.
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
     * Success. Transition is complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediafilter-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses the filter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transition is not complete.
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
     * Success. Transition is complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediafilter-pause
     */
    Pause() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Run method runs the filter.
     * @param {Integer} tStart Reference time corresponding to stream time 0.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transition is not complete.
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
     * Success. Transition is complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediafilter-run
     */
    Run(tStart) {
        result := ComCall(6, this, "int64", tStart, "HRESULT")
        return result
    }

    /**
     * The GetState method retrieves the filters's state (running, stopped, or paused).
     * @param {Integer} dwMilliSecsTimeout Time-out interval, in milliseconds. To block indefinitely, use the value <b>INFINITE</b>.
     * @returns {Integer} Receives a member of the [FILTER_STATE](/windows/desktop/api/strmif/ne-strmif-filter_state) enumerated type, indicating the filter's state.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediafilter-getstate
     */
    GetState(dwMilliSecsTimeout) {
        result := ComCall(7, this, "uint", dwMilliSecsTimeout, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * The SetSyncSource method sets the reference clock.
     * @param {IReferenceClock} pClock Pointer to the clock's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ireferenceclock">IReferenceClock</a> interface, or <b>NULL</b>. If this parameter is <b>NULL</b>, the filter graph does not use a reference clock, and all filters run as quickly as possible.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediafilter-setsyncsource
     */
    SetSyncSource(pClock) {
        result := ComCall(8, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * The GetSyncSource method retrieves the current reference clock.
     * @returns {IReferenceClock} Receives a pointer to the clock's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ireferenceclock">IReferenceClock</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediafilter-getsyncsource
     */
    GetSyncSource() {
        result := ComCall(9, this, "ptr*", &pClock := 0, "HRESULT")
        return IReferenceClock(pClock)
    }
}
