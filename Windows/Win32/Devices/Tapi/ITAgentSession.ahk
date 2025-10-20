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
     * 
     * @param {Pointer<ITAgent>} ppAgent 
     * @returns {HRESULT} 
     */
    get_Agent(ppAgent) {
        result := ComCall(7, this, "ptr", ppAgent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITAddress>} ppAddress 
     * @returns {HRESULT} 
     */
    get_Address(ppAddress) {
        result := ComCall(8, this, "ptr", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITACDGroup>} ppACDGroup 
     * @returns {HRESULT} 
     */
    get_ACDGroup(ppACDGroup) {
        result := ComCall(9, this, "ptr", ppACDGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SessionState 
     * @returns {HRESULT} 
     */
    put_State(SessionState) {
        result := ComCall(10, this, "int", SessionState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pSessionState 
     * @returns {HRESULT} 
     */
    get_State(pSessionState) {
        result := ComCall(11, this, "int*", pSessionState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateSessionStart 
     * @returns {HRESULT} 
     */
    get_SessionStartTime(pdateSessionStart) {
        result := ComCall(12, this, "double*", pdateSessionStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDuration 
     * @returns {HRESULT} 
     */
    get_SessionDuration(plDuration) {
        result := ComCall(13, this, "int*", plDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCalls 
     * @returns {HRESULT} 
     */
    get_NumberOfCalls(plCalls) {
        result := ComCall(14, this, "int*", plCalls, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plTalkTime 
     * @returns {HRESULT} 
     */
    get_TotalTalkTime(plTalkTime) {
        result := ComCall(15, this, "int*", plTalkTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plTalkTime 
     * @returns {HRESULT} 
     */
    get_AverageTalkTime(plTalkTime) {
        result := ComCall(16, this, "int*", plTalkTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCallTime 
     * @returns {HRESULT} 
     */
    get_TotalCallTime(plCallTime) {
        result := ComCall(17, this, "int*", plCallTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCallTime 
     * @returns {HRESULT} 
     */
    get_AverageCallTime(plCallTime) {
        result := ComCall(18, this, "int*", plCallTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plWrapUpTime 
     * @returns {HRESULT} 
     */
    get_TotalWrapUpTime(plWrapUpTime) {
        result := ComCall(19, this, "int*", plWrapUpTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plWrapUpTime 
     * @returns {HRESULT} 
     */
    get_AverageWrapUpTime(plWrapUpTime) {
        result := ComCall(20, this, "int*", plWrapUpTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CY>} pcyCallrate 
     * @returns {HRESULT} 
     */
    get_ACDCallRate(pcyCallrate) {
        result := ComCall(21, this, "ptr", pcyCallrate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAnswerTime 
     * @returns {HRESULT} 
     */
    get_LongestTimeToAnswer(plAnswerTime) {
        result := ComCall(22, this, "int*", plAnswerTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAnswerTime 
     * @returns {HRESULT} 
     */
    get_AverageTimeToAnswer(plAnswerTime) {
        result := ComCall(23, this, "int*", plAnswerTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
