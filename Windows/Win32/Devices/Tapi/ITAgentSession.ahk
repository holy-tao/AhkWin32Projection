#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITAgent.ahk
#Include .\ITAddress.ahk
#Include .\ITACDGroup.ahk
#Include ..\..\System\Com\CY.ahk
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
     * @returns {ITAgent} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_agent
     */
    get_Agent() {
        result := ComCall(7, this, "ptr*", &ppAgent := 0, "HRESULT")
        return ITAgent(ppAgent)
    }

    /**
     * 
     * @returns {ITAddress} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_address
     */
    get_Address() {
        result := ComCall(8, this, "ptr*", &ppAddress := 0, "HRESULT")
        return ITAddress(ppAddress)
    }

    /**
     * 
     * @returns {ITACDGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_acdgroup
     */
    get_ACDGroup() {
        result := ComCall(9, this, "ptr*", &ppACDGroup := 0, "HRESULT")
        return ITACDGroup(ppACDGroup)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_state
     */
    get_State() {
        result := ComCall(11, this, "int*", &pSessionState := 0, "HRESULT")
        return pSessionState
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_sessionstarttime
     */
    get_SessionStartTime() {
        result := ComCall(12, this, "double*", &pdateSessionStart := 0, "HRESULT")
        return pdateSessionStart
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_sessionduration
     */
    get_SessionDuration() {
        result := ComCall(13, this, "int*", &plDuration := 0, "HRESULT")
        return plDuration
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_numberofcalls
     */
    get_NumberOfCalls() {
        result := ComCall(14, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_totaltalktime
     */
    get_TotalTalkTime() {
        result := ComCall(15, this, "int*", &plTalkTime := 0, "HRESULT")
        return plTalkTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagetalktime
     */
    get_AverageTalkTime() {
        result := ComCall(16, this, "int*", &plTalkTime := 0, "HRESULT")
        return plTalkTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_totalcalltime
     */
    get_TotalCallTime() {
        result := ComCall(17, this, "int*", &plCallTime := 0, "HRESULT")
        return plCallTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagecalltime
     */
    get_AverageCallTime() {
        result := ComCall(18, this, "int*", &plCallTime := 0, "HRESULT")
        return plCallTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_totalwrapuptime
     */
    get_TotalWrapUpTime() {
        result := ComCall(19, this, "int*", &plWrapUpTime := 0, "HRESULT")
        return plWrapUpTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagewrapuptime
     */
    get_AverageWrapUpTime() {
        result := ComCall(20, this, "int*", &plWrapUpTime := 0, "HRESULT")
        return plWrapUpTime
    }

    /**
     * 
     * @returns {CY} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_acdcallrate
     */
    get_ACDCallRate() {
        pcyCallrate := CY()
        result := ComCall(21, this, "ptr", pcyCallrate, "HRESULT")
        return pcyCallrate
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_longesttimetoanswer
     */
    get_LongestTimeToAnswer() {
        result := ComCall(22, this, "int*", &plAnswerTime := 0, "HRESULT")
        return plAnswerTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagetimetoanswer
     */
    get_AverageTimeToAnswer() {
        result := ComCall(23, this, "int*", &plAnswerTime := 0, "HRESULT")
        return plAnswerTime
    }
}
