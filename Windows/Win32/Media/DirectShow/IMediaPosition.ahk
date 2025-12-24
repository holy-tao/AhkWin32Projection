#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMediaPosition interface contains methods for seeking to a position within a stream.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-imediaposition
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaPosition extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPosition
     * @type {Guid}
     */
    static IID => Guid("{56a868b2-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Duration", "put_CurrentPosition", "get_CurrentPosition", "get_StopTime", "put_StopTime", "get_PrerollTime", "put_PrerollTime", "put_Rate", "get_Rate", "CanSeekForward", "CanSeekBackward"]

    /**
     * @type {Float} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * @type {Float} 
     */
    CurrentPosition {
        get => this.get_CurrentPosition()
        set => this.put_CurrentPosition(value)
    }

    /**
     * @type {Float} 
     */
    StopTime {
        get => this.get_StopTime()
        set => this.put_StopTime(value)
    }

    /**
     * @type {Float} 
     */
    PrerollTime {
        get => this.get_PrerollTime()
        set => this.put_PrerollTime(value)
    }

    /**
     * @type {Float} 
     */
    Rate {
        get => this.get_Rate()
        set => this.put_Rate(value)
    }

    /**
     * The get_Duration method retrieves the duration of the stream.
     * @returns {Float} Pointer to a variable that receives the total stream length, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaposition-get_duration
     */
    get_Duration() {
        result := ComCall(7, this, "double*", &plength := 0, "HRESULT")
        return plength
    }

    /**
     * The put_CurrentPosition method sets the current position, relative to the total duration of the stream.
     * @param {Float} llTime New position, in seconds.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
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
     * Graph was paused and is in transition back to a running state.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaposition-put_currentposition
     */
    put_CurrentPosition(llTime) {
        result := ComCall(8, this, "double", llTime, "HRESULT")
        return result
    }

    /**
     * The get_CurrentPosition method retrieves the current position, relative to the total duration of the stream.
     * @returns {Float} Pointer to a variable that receives the current position, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaposition-get_currentposition
     */
    get_CurrentPosition() {
        result := ComCall(9, this, "double*", &pllTime := 0, "HRESULT")
        return pllTime
    }

    /**
     * The get_StopTime method retrieves the time at which the playback will stop, relative to the duration of the stream.
     * @returns {Float} Pointer to a variable that receives the stop time, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaposition-get_stoptime
     */
    get_StopTime() {
        result := ComCall(10, this, "double*", &pllTime := 0, "HRESULT")
        return pllTime
    }

    /**
     * The put_StopTime method sets the time at which the playback will stop, relative to the duration of the stream.
     * @param {Float} llTime Stop time, in seconds.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaposition-put_stoptime
     */
    put_StopTime(llTime) {
        result := ComCall(11, this, "double", llTime, "HRESULT")
        return result
    }

    /**
     * The get_PrerollTime method retrieves the amount of data that will be queued before the start position.
     * @returns {Float} Pointer to a variable that receives the preroll time, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaposition-get_prerolltime
     */
    get_PrerollTime() {
        result := ComCall(12, this, "double*", &pllTime := 0, "HRESULT")
        return pllTime
    }

    /**
     * The put_PrerollTime method sets the amount of data that will be queued before the start position.
     * @param {Float} llTime Preroll time, in seconds.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaposition-put_prerolltime
     */
    put_PrerollTime(llTime) {
        result := ComCall(13, this, "double", llTime, "HRESULT")
        return result
    }

    /**
     * The put_Rate method sets the playback rate.
     * @param {Float} dRate Playback rate. Must not be zero.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaposition-put_rate
     */
    put_Rate(dRate) {
        result := ComCall(14, this, "double", dRate, "HRESULT")
        return result
    }

    /**
     * The get_Rate method retrieves the playback rate.
     * @returns {Float} Pointer to a variable that receives the playback rate.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaposition-get_rate
     */
    get_Rate() {
        result := ComCall(15, this, "double*", &pdRate := 0, "HRESULT")
        return pdRate
    }

    /**
     * The CanSeekForward method determines whether the filter graph can seek forward in the stream.
     * @returns {Integer} Pointer to a variable that receives the value OATRUE if the graph can seek forward, or OAFALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaposition-canseekforward
     */
    CanSeekForward() {
        result := ComCall(16, this, "int*", &pCanSeekForward := 0, "HRESULT")
        return pCanSeekForward
    }

    /**
     * The CanSeekBackward method determines whether the filter graph can seek backward in the stream.
     * @returns {Integer} Pointer to a variable that receives the value OATRUE if the graph can seek backward, or OAFALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaposition-canseekbackward
     */
    CanSeekBackward() {
        result := ComCall(17, this, "int*", &pCanSeekBackward := 0, "HRESULT")
        return pCanSeekBackward
    }
}
