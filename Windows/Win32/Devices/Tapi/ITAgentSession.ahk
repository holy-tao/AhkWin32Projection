#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * An agent session represents an association between an agent, group, and address.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itagentsession
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAgentSession extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAgentSession
     * @type {Guid}
     */
    static IID => Guid("{5afc3147-4bcc-11d1-bf80-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Agent", "get_Address", "get_ACDGroup", "put_State", "get_State", "get_SessionStartTime", "get_SessionDuration", "get_NumberOfCalls", "get_TotalTalkTime", "get_AverageTalkTime", "get_TotalCallTime", "get_AverageCallTime", "get_TotalWrapUpTime", "get_AverageWrapUpTime", "get_ACDCallRate", "get_LongestTimeToAnswer", "get_AverageTimeToAnswer"]

    /**
     * 
     * @param {Pointer<ITAgent>} ppAgent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_agent
     */
    get_Agent(ppAgent) {
        result := ComCall(7, this, "ptr*", ppAgent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITAddress>} ppAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_address
     */
    get_Address(ppAddress) {
        result := ComCall(8, this, "ptr*", ppAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITACDGroup>} ppACDGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_acdgroup
     */
    get_ACDGroup(ppACDGroup) {
        result := ComCall(9, this, "ptr*", ppACDGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-put_state
     */
    put_State(SessionState) {
        result := ComCall(10, this, "int", SessionState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSessionState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_state
     */
    get_State(pSessionState) {
        result := ComCall(11, this, "int*", pSessionState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateSessionStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_sessionstarttime
     */
    get_SessionStartTime(pdateSessionStart) {
        result := ComCall(12, this, "double*", pdateSessionStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_sessionduration
     */
    get_SessionDuration(plDuration) {
        result := ComCall(13, this, "int*", plDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCalls 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_numberofcalls
     */
    get_NumberOfCalls(plCalls) {
        result := ComCall(14, this, "int*", plCalls, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plTalkTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_totaltalktime
     */
    get_TotalTalkTime(plTalkTime) {
        result := ComCall(15, this, "int*", plTalkTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plTalkTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagetalktime
     */
    get_AverageTalkTime(plTalkTime) {
        result := ComCall(16, this, "int*", plTalkTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCallTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_totalcalltime
     */
    get_TotalCallTime(plCallTime) {
        result := ComCall(17, this, "int*", plCallTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCallTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagecalltime
     */
    get_AverageCallTime(plCallTime) {
        result := ComCall(18, this, "int*", plCallTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plWrapUpTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_totalwrapuptime
     */
    get_TotalWrapUpTime(plWrapUpTime) {
        result := ComCall(19, this, "int*", plWrapUpTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plWrapUpTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagewrapuptime
     */
    get_AverageWrapUpTime(plWrapUpTime) {
        result := ComCall(20, this, "int*", plWrapUpTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CY>} pcyCallrate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_acdcallrate
     */
    get_ACDCallRate(pcyCallrate) {
        result := ComCall(21, this, "ptr", pcyCallrate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plAnswerTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_longesttimetoanswer
     */
    get_LongestTimeToAnswer(plAnswerTime) {
        result := ComCall(22, this, "int*", plAnswerTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plAnswerTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagetimetoanswer
     */
    get_AverageTimeToAnswer(plAnswerTime) {
        result := ComCall(23, this, "int*", plAnswerTime, "HRESULT")
        return result
    }
}
