#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Agents are the heart of a call center.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itagent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAgent extends IDispatch{
    /**
     * The interface identifier for ITAgent
     * @type {Guid}
     */
    static IID => Guid("{5770ece5-4b27-11d1-bf80-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IEnumAgentSession>} ppEnumAgentSession 
     * @returns {HRESULT} 
     */
    EnumerateAgentSessions(ppEnumAgentSession) {
        result := ComCall(7, this, "ptr", ppEnumAgentSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITACDGroup>} pACDGroup 
     * @param {Pointer<ITAddress>} pAddress 
     * @param {Pointer<ITAgentSession>} ppAgentSession 
     * @returns {HRESULT} 
     */
    CreateSession(pACDGroup, pAddress, ppAgentSession) {
        result := ComCall(8, this, "ptr", pACDGroup, "ptr", pAddress, "ptr", ppAgentSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITACDGroup>} pACDGroup 
     * @param {Pointer<ITAddress>} pAddress 
     * @param {BSTR} pPIN 
     * @param {Pointer<ITAgentSession>} ppAgentSession 
     * @returns {HRESULT} 
     */
    CreateSessionWithPIN(pACDGroup, pAddress, pPIN, ppAgentSession) {
        pPIN := pPIN is String ? BSTR.Alloc(pPIN).Value : pPIN

        result := ComCall(9, this, "ptr", pACDGroup, "ptr", pAddress, "ptr", pPIN, "ptr", ppAgentSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppID 
     * @returns {HRESULT} 
     */
    get_ID(ppID) {
        result := ComCall(10, this, "ptr", ppID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppUser 
     * @returns {HRESULT} 
     */
    get_User(ppUser) {
        result := ComCall(11, this, "ptr", ppUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AgentState 
     * @returns {HRESULT} 
     */
    put_State(AgentState) {
        result := ComCall(12, this, "int", AgentState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pAgentState 
     * @returns {HRESULT} 
     */
    get_State(pAgentState) {
        result := ComCall(13, this, "int*", pAgentState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPeriod 
     * @returns {HRESULT} 
     */
    put_MeasurementPeriod(lPeriod) {
        result := ComCall(14, this, "int", lPeriod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPeriod 
     * @returns {HRESULT} 
     */
    get_MeasurementPeriod(plPeriod) {
        result := ComCall(15, this, "int*", plPeriod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CY>} pcyCallrate 
     * @returns {HRESULT} 
     */
    get_OverallCallRate(pcyCallrate) {
        result := ComCall(16, this, "ptr", pcyCallrate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCalls 
     * @returns {HRESULT} 
     */
    get_NumberOfACDCalls(plCalls) {
        result := ComCall(17, this, "int*", plCalls, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCalls 
     * @returns {HRESULT} 
     */
    get_NumberOfIncomingCalls(plCalls) {
        result := ComCall(18, this, "int*", plCalls, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCalls 
     * @returns {HRESULT} 
     */
    get_NumberOfOutgoingCalls(plCalls) {
        result := ComCall(19, this, "int*", plCalls, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plTalkTime 
     * @returns {HRESULT} 
     */
    get_TotalACDTalkTime(plTalkTime) {
        result := ComCall(20, this, "int*", plTalkTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCallTime 
     * @returns {HRESULT} 
     */
    get_TotalACDCallTime(plCallTime) {
        result := ComCall(21, this, "int*", plCallTime, "int")
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
        result := ComCall(22, this, "int*", plWrapUpTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_AgentSessions(pVariant) {
        result := ComCall(23, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
