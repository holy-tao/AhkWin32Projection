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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumerateAgentSessions", "CreateSession", "CreateSessionWithPIN", "get_ID", "get_User", "put_State", "get_State", "put_MeasurementPeriod", "get_MeasurementPeriod", "get_OverallCallRate", "get_NumberOfACDCalls", "get_NumberOfIncomingCalls", "get_NumberOfOutgoingCalls", "get_TotalACDTalkTime", "get_TotalACDCallTime", "get_TotalWrapUpTime", "get_AgentSessions"]

    /**
     * 
     * @param {Pointer<IEnumAgentSession>} ppEnumAgentSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-enumerateagentsessions
     */
    EnumerateAgentSessions(ppEnumAgentSession) {
        result := ComCall(7, this, "ptr*", ppEnumAgentSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITACDGroup} pACDGroup 
     * @param {ITAddress} pAddress 
     * @param {Pointer<ITAgentSession>} ppAgentSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-createsession
     */
    CreateSession(pACDGroup, pAddress, ppAgentSession) {
        result := ComCall(8, this, "ptr", pACDGroup, "ptr", pAddress, "ptr*", ppAgentSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITACDGroup} pACDGroup 
     * @param {ITAddress} pAddress 
     * @param {BSTR} pPIN 
     * @param {Pointer<ITAgentSession>} ppAgentSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-createsessionwithpin
     */
    CreateSessionWithPIN(pACDGroup, pAddress, pPIN, ppAgentSession) {
        pPIN := pPIN is String ? BSTR.Alloc(pPIN).Value : pPIN

        result := ComCall(9, this, "ptr", pACDGroup, "ptr", pAddress, "ptr", pPIN, "ptr*", ppAgentSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_id
     */
    get_ID(ppID) {
        result := ComCall(10, this, "ptr", ppID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_user
     */
    get_User(ppUser) {
        result := ComCall(11, this, "ptr", ppUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AgentState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-put_state
     */
    put_State(AgentState) {
        result := ComCall(12, this, "int", AgentState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAgentState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_state
     */
    get_State(pAgentState) {
        pAgentStateMarshal := pAgentState is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pAgentStateMarshal, pAgentState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPeriod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-put_measurementperiod
     */
    put_MeasurementPeriod(lPeriod) {
        result := ComCall(14, this, "int", lPeriod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPeriod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_measurementperiod
     */
    get_MeasurementPeriod(plPeriod) {
        plPeriodMarshal := plPeriod is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, plPeriodMarshal, plPeriod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CY>} pcyCallrate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_overallcallrate
     */
    get_OverallCallRate(pcyCallrate) {
        result := ComCall(16, this, "ptr", pcyCallrate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCalls 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_numberofacdcalls
     */
    get_NumberOfACDCalls(plCalls) {
        plCallsMarshal := plCalls is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, plCallsMarshal, plCalls, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCalls 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_numberofincomingcalls
     */
    get_NumberOfIncomingCalls(plCalls) {
        plCallsMarshal := plCalls is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plCallsMarshal, plCalls, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCalls 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_numberofoutgoingcalls
     */
    get_NumberOfOutgoingCalls(plCalls) {
        plCallsMarshal := plCalls is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, plCallsMarshal, plCalls, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plTalkTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_totalacdtalktime
     */
    get_TotalACDTalkTime(plTalkTime) {
        plTalkTimeMarshal := plTalkTime is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, plTalkTimeMarshal, plTalkTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCallTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_totalacdcalltime
     */
    get_TotalACDCallTime(plCallTime) {
        plCallTimeMarshal := plCallTime is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, plCallTimeMarshal, plCallTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plWrapUpTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_totalwrapuptime
     */
    get_TotalWrapUpTime(plWrapUpTime) {
        plWrapUpTimeMarshal := plWrapUpTime is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, plWrapUpTimeMarshal, plWrapUpTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_agentsessions
     */
    get_AgentSessions(pVariant) {
        result := ComCall(23, this, "ptr", pVariant, "HRESULT")
        return result
    }
}
