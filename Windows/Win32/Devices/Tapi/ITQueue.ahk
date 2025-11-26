#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Gets and sets information concerning a queue. The IEnumQueue::Next and ITACDGroup::get_Queues methods create the ITQueue interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itqueue
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITQueue extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITQueue
     * @type {Guid}
     */
    static IID => Guid("{5afc3149-4bcc-11d1-bf80-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_MeasurementPeriod", "get_MeasurementPeriod", "get_TotalCallsQueued", "get_CurrentCallsQueued", "get_TotalCallsAbandoned", "get_TotalCallsFlowedIn", "get_TotalCallsFlowedOut", "get_LongestEverWaitTime", "get_CurrentLongestWaitTime", "get_AverageWaitTime", "get_FinalDisposition", "get_Name"]

    /**
     * @type {Integer} 
     */
    MeasurementPeriod {
        get => this.get_MeasurementPeriod()
        set => this.put_MeasurementPeriod(value)
    }

    /**
     * @type {Integer} 
     */
    TotalCallsQueued {
        get => this.get_TotalCallsQueued()
    }

    /**
     * @type {Integer} 
     */
    CurrentCallsQueued {
        get => this.get_CurrentCallsQueued()
    }

    /**
     * @type {Integer} 
     */
    TotalCallsAbandoned {
        get => this.get_TotalCallsAbandoned()
    }

    /**
     * @type {Integer} 
     */
    TotalCallsFlowedIn {
        get => this.get_TotalCallsFlowedIn()
    }

    /**
     * @type {Integer} 
     */
    TotalCallsFlowedOut {
        get => this.get_TotalCallsFlowedOut()
    }

    /**
     * @type {Integer} 
     */
    LongestEverWaitTime {
        get => this.get_LongestEverWaitTime()
    }

    /**
     * @type {Integer} 
     */
    CurrentLongestWaitTime {
        get => this.get_CurrentLongestWaitTime()
    }

    /**
     * @type {Integer} 
     */
    AverageWaitTime {
        get => this.get_AverageWaitTime()
    }

    /**
     * @type {Integer} 
     */
    FinalDisposition {
        get => this.get_FinalDisposition()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * The put_MeasurementPeriod method sets the period (in seconds) for which the switch and/or implementation stores and calculates information.
     * @param {Integer} lPeriod Measurement period (in seconds).
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
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
     * Value of <i>lPeriod</i> is zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed because the TAPI 3 DLL timed it out. The timeout interval is two minutes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>LINEERR_</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See 
     * <a href="/windows/desktop/api/tapi/nf-tapi-linesetqueuemeasurementperiod">lineSetQueueMeasurementPeriod</a> for error codes returned from this TAPI 2.1 function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-put_measurementperiod
     */
    put_MeasurementPeriod(lPeriod) {
        result := ComCall(7, this, "int", lPeriod, "HRESULT")
        return result
    }

    /**
     * The get_MeasurementPeriod method gets the measurement period (in seconds) for which the switch and/or implementation stores and calculates information.
     * @returns {Integer} Pointer to the measurement period.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-get_measurementperiod
     */
    get_MeasurementPeriod() {
        result := ComCall(8, this, "int*", &plPeriod := 0, "HRESULT")
        return plPeriod
    }

    /**
     * The get_TotalCallsQueued method gets the total number of incoming calls for this queue during the current measurement period.
     * @returns {Integer} Pointer to the total number of incoming calls.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-get_totalcallsqueued
     */
    get_TotalCallsQueued() {
        result := ComCall(9, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The get_CurrentCallsQueued method gets the number of incoming calls currently waiting.
     * @returns {Integer} Pointer to the number of incoming calls in the queue.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-get_currentcallsqueued
     */
    get_CurrentCallsQueued() {
        result := ComCall(10, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The get_TotalCallsAbandoned method gets the number of abandoned calls during the current measurement period.
     * @returns {Integer} Pointer to the number of calls abandoned.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-get_totalcallsabandoned
     */
    get_TotalCallsAbandoned() {
        result := ComCall(11, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The get_TotalCallsFlowedIn method gets the total number of calls that flowed into this queue (passed down from another queue or ACD group) during the current measurement period.
     * @returns {Integer} Pointer to the number of calls.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-get_totalcallsflowedin
     */
    get_TotalCallsFlowedIn() {
        result := ComCall(12, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The get_TotalCallsFlowedOut method gets the total number of calls that flowed out of this queue (passed down to another queue or ACD group) during the current measurement period.
     * @returns {Integer} Pointer to number of calls.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-get_totalcallsflowedout
     */
    get_TotalCallsFlowedOut() {
        result := ComCall(13, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The get_LongestEverWaitTime method gets the longest time any call waited in the queue (in seconds) during the current measurement period.
     * @returns {Integer} Pointer to the wait time.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-get_longesteverwaittime
     */
    get_LongestEverWaitTime() {
        result := ComCall(14, this, "int*", &plWaitTime := 0, "HRESULT")
        return plWaitTime
    }

    /**
     * The get_CurrentLongestWaitTime method gets the longest time a current call (still in the queue) has been waiting (in seconds) during the current measurement period.
     * @returns {Integer} Pointer to wait time.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-get_currentlongestwaittime
     */
    get_CurrentLongestWaitTime() {
        result := ComCall(15, this, "int*", &plWaitTime := 0, "HRESULT")
        return plWaitTime
    }

    /**
     * The get_AverageWaitTime method gets the average time in the queue (in seconds) for a call during the current measurement period.
     * @returns {Integer} Pointer to the average wait time.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-get_averagewaittime
     */
    get_AverageWaitTime() {
        result := ComCall(16, this, "int*", &plWaitTime := 0, "HRESULT")
        return plWaitTime
    }

    /**
     * The get_FinalDisposition method gets the total number of calls reaching the bottom of a call guide during the current measurement period.
     * @returns {Integer} Pointer to number of calls.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-get_finaldisposition
     */
    get_FinalDisposition() {
        result := ComCall(17, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The get_Name method gets the queue name.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of queue name.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itqueue-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(18, this, "ptr", ppName, "HRESULT")
        return ppName
    }
}
