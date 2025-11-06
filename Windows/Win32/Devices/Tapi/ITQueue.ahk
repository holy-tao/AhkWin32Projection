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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_measurementperiod
     */
    get_MeasurementPeriod() {
        result := ComCall(8, this, "int*", &plPeriod := 0, "HRESULT")
        return plPeriod
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsqueued
     */
    get_TotalCallsQueued() {
        result := ComCall(9, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_currentcallsqueued
     */
    get_CurrentCallsQueued() {
        result := ComCall(10, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsabandoned
     */
    get_TotalCallsAbandoned() {
        result := ComCall(11, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsflowedin
     */
    get_TotalCallsFlowedIn() {
        result := ComCall(12, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_totalcallsflowedout
     */
    get_TotalCallsFlowedOut() {
        result := ComCall(13, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_longesteverwaittime
     */
    get_LongestEverWaitTime() {
        result := ComCall(14, this, "int*", &plWaitTime := 0, "HRESULT")
        return plWaitTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_currentlongestwaittime
     */
    get_CurrentLongestWaitTime() {
        result := ComCall(15, this, "int*", &plWaitTime := 0, "HRESULT")
        return plWaitTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_averagewaittime
     */
    get_AverageWaitTime() {
        result := ComCall(16, this, "int*", &plWaitTime := 0, "HRESULT")
        return plWaitTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_finaldisposition
     */
    get_FinalDisposition() {
        result := ComCall(17, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueue-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(18, this, "ptr", ppName, "HRESULT")
        return ppName
    }
}
