#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} lPeriod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-put_measurementperiod
     */
    put_MeasurementPeriod(lPeriod) {
        result := ComCall(7, this, "int", lPeriod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPeriod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_measurementperiod
     */
    get_MeasurementPeriod(plPeriod) {
        plPeriodMarshal := plPeriod is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plPeriodMarshal, plPeriod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCalls 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsqueued
     */
    get_TotalCallsQueued(plCalls) {
        plCallsMarshal := plCalls is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plCallsMarshal, plCalls, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCalls 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_currentcallsqueued
     */
    get_CurrentCallsQueued(plCalls) {
        plCallsMarshal := plCalls is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plCallsMarshal, plCalls, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCalls 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsabandoned
     */
    get_TotalCallsAbandoned(plCalls) {
        plCallsMarshal := plCalls is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plCallsMarshal, plCalls, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCalls 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsflowedin
     */
    get_TotalCallsFlowedIn(plCalls) {
        plCallsMarshal := plCalls is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plCallsMarshal, plCalls, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCalls 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsflowedout
     */
    get_TotalCallsFlowedOut(plCalls) {
        plCallsMarshal := plCalls is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, plCallsMarshal, plCalls, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plWaitTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_longesteverwaittime
     */
    get_LongestEverWaitTime(plWaitTime) {
        plWaitTimeMarshal := plWaitTime is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, plWaitTimeMarshal, plWaitTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plWaitTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_currentlongestwaittime
     */
    get_CurrentLongestWaitTime(plWaitTime) {
        plWaitTimeMarshal := plWaitTime is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, plWaitTimeMarshal, plWaitTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plWaitTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_averagewaittime
     */
    get_AverageWaitTime(plWaitTime) {
        plWaitTimeMarshal := plWaitTime is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, plWaitTimeMarshal, plWaitTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCalls 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_finaldisposition
     */
    get_FinalDisposition(plCalls) {
        plCallsMarshal := plCalls is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, plCallsMarshal, plCalls, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_name
     */
    get_Name(ppName) {
        result := ComCall(18, this, "ptr", ppName, "HRESULT")
        return result
    }
}
