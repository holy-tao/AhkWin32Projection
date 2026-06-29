#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITQueue interface (tapi3cc.h) gets and sets information concerning a queue.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-itqueue
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITQueue extends IDispatch {
    /**
     * The interface identifier for ITQueue
     * @type {Guid}
     */
    static IID := Guid("{5afc3149-4bcc-11d1-bf80-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITQueue interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_MeasurementPeriod      : IntPtr
        get_MeasurementPeriod      : IntPtr
        get_TotalCallsQueued       : IntPtr
        get_CurrentCallsQueued     : IntPtr
        get_TotalCallsAbandoned    : IntPtr
        get_TotalCallsFlowedIn     : IntPtr
        get_TotalCallsFlowedOut    : IntPtr
        get_LongestEverWaitTime    : IntPtr
        get_CurrentLongestWaitTime : IntPtr
        get_AverageWaitTime        : IntPtr
        get_FinalDisposition       : IntPtr
        get_Name                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The ITQueue::put_MeasurementPeriod method (tapi3cc.h) sets the period (in seconds) for which the switch and/or implementation stores and calculates information.
     * @remarks
     * The <b>ITQueue::put_MeasurementPeriod</b> method is a COM wrapper for the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetqueuemeasurementperiod">lineSetQueueMeasurementPeriod</a> function.
     * 
     * This method will accept negative values for the measurement period, but this will normally result in unreliable statistics.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetqueuemeasurementperiod">lineSetQueueMeasurementPeriod</a> for error codes returned from this TAPI 2.1 function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-put_measurementperiod
     */
    put_MeasurementPeriod(lPeriod) {
        result := ComCall(7, this, "int", lPeriod, "HRESULT")
        return result
    }

    /**
     * The ITQueue::get_MeasurementPeriod method (tapi3cc.h) gets the measurement period for which the switch and/or implementation stores and calculates information.
     * @returns {Integer} Pointer to the measurement period.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_measurementperiod
     */
    get_MeasurementPeriod() {
        result := ComCall(8, this, "int*", &plPeriod := 0, "HRESULT")
        return plPeriod
    }

    /**
     * The ITQueue::get_TotalCallsQueued method (tapi3cc.h) gets the total number of incoming calls for this queue during the current measurement period.
     * @returns {Integer} Pointer to the total number of incoming calls.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsqueued
     */
    get_TotalCallsQueued() {
        result := ComCall(9, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The ITQueue::get_CurrentCallsQueued method (tapi3cc.h) gets the number of incoming calls currently waiting.
     * @returns {Integer} Pointer to the number of incoming calls in the queue.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_currentcallsqueued
     */
    get_CurrentCallsQueued() {
        result := ComCall(10, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The ITQueue::get_TotalCallsAbandoned method (tapi3cc.h) gets the number of abandoned calls during the current measurement period.
     * @returns {Integer} Pointer to the number of calls abandoned.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsabandoned
     */
    get_TotalCallsAbandoned() {
        result := ComCall(11, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The ITQueue::get_TotalCallsFlowedIn method (tapi3cc.h) gets the total number of calls that flowed into this queue during the current measurement period.
     * @returns {Integer} Pointer to the number of calls.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsflowedin
     */
    get_TotalCallsFlowedIn() {
        result := ComCall(12, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The ITQueue::get_TotalCallsFlowedOut method (tapi3cc.h) gets the total number of calls that flowed out of this queue during the current measurement period.
     * @returns {Integer} Pointer to number of calls.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsflowedout
     */
    get_TotalCallsFlowedOut() {
        result := ComCall(13, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The ITQueue::get_LongestEverWaitTime method (tapi3cc.h) gets the longest time any call waited in the queue (in seconds) during the current measurement period.
     * @returns {Integer} Pointer to the wait time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_longesteverwaittime
     */
    get_LongestEverWaitTime() {
        result := ComCall(14, this, "int*", &plWaitTime := 0, "HRESULT")
        return plWaitTime
    }

    /**
     * The ITQueue::get_CurrentLongestWaitTime method (tapi3cc.h) gets the longest time a current call has been waiting in queue during the current measurement period.
     * @returns {Integer} Pointer to wait time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_currentlongestwaittime
     */
    get_CurrentLongestWaitTime() {
        result := ComCall(15, this, "int*", &plWaitTime := 0, "HRESULT")
        return plWaitTime
    }

    /**
     * The ITQueue::get_AverageWaitTime method (tapi3cc.h) gets the average time in the queue (in seconds) for a call during the current measurement period.
     * @returns {Integer} Pointer to the average wait time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_averagewaittime
     */
    get_AverageWaitTime() {
        result := ComCall(16, this, "int*", &plWaitTime := 0, "HRESULT")
        return plWaitTime
    }

    /**
     * The ITQueue::get_FinalDisposition method (tapi3cc.h) gets the total number of calls reaching the bottom of a call guide during the current measurement period.
     * @remarks
     * Measurement period for this information is switch and/or implementation specific (see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nf-tapi3-itqueue-get_measurementperiod">get_MeasurementPeriod</a>).
     * @returns {Integer} Pointer to number of calls.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_finaldisposition
     */
    get_FinalDisposition() {
        result := ComCall(17, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The ITQueue::get_Name method (tapi3cc.h) gets the queue name.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppName</i> parameter.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of queue name.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_name
     */
    get_Name() {
        ppName := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, ppName, "HRESULT")
        return ppName
    }

    Query(iid) {
        if (ITQueue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_MeasurementPeriod := CallbackCreate(GetMethod(implObj, "put_MeasurementPeriod"), flags, 2)
        this.vtbl.get_MeasurementPeriod := CallbackCreate(GetMethod(implObj, "get_MeasurementPeriod"), flags, 2)
        this.vtbl.get_TotalCallsQueued := CallbackCreate(GetMethod(implObj, "get_TotalCallsQueued"), flags, 2)
        this.vtbl.get_CurrentCallsQueued := CallbackCreate(GetMethod(implObj, "get_CurrentCallsQueued"), flags, 2)
        this.vtbl.get_TotalCallsAbandoned := CallbackCreate(GetMethod(implObj, "get_TotalCallsAbandoned"), flags, 2)
        this.vtbl.get_TotalCallsFlowedIn := CallbackCreate(GetMethod(implObj, "get_TotalCallsFlowedIn"), flags, 2)
        this.vtbl.get_TotalCallsFlowedOut := CallbackCreate(GetMethod(implObj, "get_TotalCallsFlowedOut"), flags, 2)
        this.vtbl.get_LongestEverWaitTime := CallbackCreate(GetMethod(implObj, "get_LongestEverWaitTime"), flags, 2)
        this.vtbl.get_CurrentLongestWaitTime := CallbackCreate(GetMethod(implObj, "get_CurrentLongestWaitTime"), flags, 2)
        this.vtbl.get_AverageWaitTime := CallbackCreate(GetMethod(implObj, "get_AverageWaitTime"), flags, 2)
        this.vtbl.get_FinalDisposition := CallbackCreate(GetMethod(implObj, "get_FinalDisposition"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_MeasurementPeriod)
        CallbackFree(this.vtbl.get_MeasurementPeriod)
        CallbackFree(this.vtbl.get_TotalCallsQueued)
        CallbackFree(this.vtbl.get_CurrentCallsQueued)
        CallbackFree(this.vtbl.get_TotalCallsAbandoned)
        CallbackFree(this.vtbl.get_TotalCallsFlowedIn)
        CallbackFree(this.vtbl.get_TotalCallsFlowedOut)
        CallbackFree(this.vtbl.get_LongestEverWaitTime)
        CallbackFree(this.vtbl.get_CurrentLongestWaitTime)
        CallbackFree(this.vtbl.get_AverageWaitTime)
        CallbackFree(this.vtbl.get_FinalDisposition)
        CallbackFree(this.vtbl.get_Name)
    }
}
