#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumAgentSession.ahk
#Include .\ITAgentSession.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {BSTR} 
     */
    ID {
        get => this.get_ID()
    }

    /**
     * @type {BSTR} 
     */
    User {
        get => this.get_User()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * @type {Integer} 
     */
    MeasurementPeriod {
        get => this.get_MeasurementPeriod()
        set => this.put_MeasurementPeriod(value)
    }

    /**
     * @type {CY} 
     */
    OverallCallRate {
        get => this.get_OverallCallRate()
    }

    /**
     * @type {Integer} 
     */
    NumberOfACDCalls {
        get => this.get_NumberOfACDCalls()
    }

    /**
     * @type {Integer} 
     */
    NumberOfIncomingCalls {
        get => this.get_NumberOfIncomingCalls()
    }

    /**
     * @type {Integer} 
     */
    NumberOfOutgoingCalls {
        get => this.get_NumberOfOutgoingCalls()
    }

    /**
     * @type {Integer} 
     */
    TotalACDTalkTime {
        get => this.get_TotalACDTalkTime()
    }

    /**
     * @type {Integer} 
     */
    TotalACDCallTime {
        get => this.get_TotalACDCallTime()
    }

    /**
     * @type {Integer} 
     */
    TotalWrapUpTime {
        get => this.get_TotalWrapUpTime()
    }

    /**
     * @type {VARIANT} 
     */
    AgentSessions {
        get => this.get_AgentSessions()
    }

    /**
     * The EnumerateAgentSessions method enumerates the current agent sessions. This method is provided for C and C++ applications. Automation client applications, such as those written in Visual Basic, must use the get_AgentSessions method.
     * @returns {IEnumAgentSession} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumagentsession">IEnumAgentSession</a> agent session enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-enumerateagentsessions
     */
    EnumerateAgentSessions() {
        result := ComCall(7, this, "ptr*", &ppEnumAgentSession := 0, "HRESULT")
        return IEnumAgentSession(ppEnumAgentSession)
    }

    /**
     * The CreateSession method creates a new agent session for the input ACD group and address.
     * @param {ITACDGroup} pACDGroup Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface.
     * @param {ITAddress} pAddress Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> object available for receiving ACD calls.
     * @returns {ITAgentSession} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentsession">ITAgentSession</a> interface for object created.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-createsession
     */
    CreateSession(pACDGroup, pAddress) {
        result := ComCall(8, this, "ptr", pACDGroup, "ptr", pAddress, "ptr*", &ppAgentSession := 0, "HRESULT")
        return ITAgentSession(ppAgentSession)
    }

    /**
     * The CreateSessionWithPIN method creates a new agent session for the input ACD group and address, with Personal Identification Number (PIN).
     * @param {ITACDGroup} pACDGroup Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface.
     * @param {ITAddress} pAddress Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface for object available for receiving ACD calls.
     * @param {BSTR} pPIN Pointer to a <b>BSTR</b> representation of agent's PIN.
     * @returns {ITAgentSession} Pointer to session created.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-createsessionwithpin
     */
    CreateSessionWithPIN(pACDGroup, pAddress, pPIN) {
        pPIN := pPIN is String ? BSTR.Alloc(pPIN).Value : pPIN

        result := ComCall(9, this, "ptr", pACDGroup, "ptr", pAddress, "ptr", pPIN, "ptr*", &ppAgentSession := 0, "HRESULT")
        return ITAgentSession(ppAgentSession)
    }

    /**
     * The get_ID method gets an agent's ID.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing agent ID.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_id
     */
    get_ID() {
        ppID := BSTR()
        result := ComCall(10, this, "ptr", ppID, "HRESULT")
        return ppID
    }

    /**
     * The get_User method gets the agent user name, which is the same as the operating system user login or e-mail name.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing user name.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_user
     */
    get_User() {
        ppUser := BSTR()
        result := ComCall(11, this, "ptr", ppUser, "HRESULT")
        return ppUser
    }

    /**
     * The put_State method sets the state of an agent session.
     * @param {Integer} AgentState <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agent_state">AGENT_STATE</a>.
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
     * Agent session state is incorrect.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-put_state
     */
    put_State(AgentState) {
        result := ComCall(12, this, "int", AgentState, "HRESULT")
        return result
    }

    /**
     * The get_State method gets the state of an agent session.
     * @returns {Integer} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agent_state">AGENT_STATE</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_state
     */
    get_State() {
        result := ComCall(13, this, "int*", &pAgentState := 0, "HRESULT")
        return pAgentState
    }

    /**
     * The put_MeasurementPeriod method sets the period (in seconds) for which the switch and/or implementation stores and calculates information. This also resets any cumulative counts to zero.
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
     * <dt><b>LINEERR_</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See 
     * <a href="/windows/desktop/api/tapi/nf-tapi-linesetagentmeasurementperiod">lineSetAgentMeasurementPeriod</a> for error codes returned from this TAPI 2.1 function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-put_measurementperiod
     */
    put_MeasurementPeriod(lPeriod) {
        result := ComCall(14, this, "int", lPeriod, "HRESULT")
        return result
    }

    /**
     * The get_MeasurementPeriod method gets the measurement period (in seconds) for which the switch and/or implementation stores and calculates information.
     * @returns {Integer} Measurement period.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_measurementperiod
     */
    get_MeasurementPeriod() {
        result := ComCall(15, this, "int*", &plPeriod := 0, "HRESULT")
        return plPeriod
    }

    /**
     * The get_OverallCallRate method gets an agent's call rate across all sessions. 10 *Calls per agent hour (where agent hour represents the time that an agent was active in one or more agent sessions).
     * @returns {CY} Call rate.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_overallcallrate
     */
    get_OverallCallRate() {
        pcyCallrate := CY()
        result := ComCall(16, this, "ptr", pcyCallrate, "HRESULT")
        return pcyCallrate
    }

    /**
     * The get_NumberOfACDCalls method gets the number of ACD calls handled by this agent across all sessions.
     * @returns {Integer} Total number of calls.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_numberofacdcalls
     */
    get_NumberOfACDCalls() {
        result := ComCall(17, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The get_NumberOfIncomingCalls method gets the number of incoming non-ACD calls handled by this agent.
     * @returns {Integer} Total number of incoming calls.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_numberofincomingcalls
     */
    get_NumberOfIncomingCalls() {
        result := ComCall(18, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The get_NumberOfOutgoingCalls method gets the number of outgoing non-ACD calls handled during by this agent.
     * @returns {Integer} Total number of outgoing calls.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_numberofoutgoingcalls
     */
    get_NumberOfOutgoingCalls() {
        result := ComCall(19, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The get_TotalACDTalkTime gets the number of seconds spent talking in ACD calls by this agent (across all sessions).
     * @returns {Integer} Total talk time.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_totalacdtalktime
     */
    get_TotalACDTalkTime() {
        result := ComCall(20, this, "int*", &plTalkTime := 0, "HRESULT")
        return plTalkTime
    }

    /**
     * The get_TotalACDCallTime gets the number of seconds spent on ACD calls by this agent (across all sessions). This value includes the time spent on the phone plus wrap-up time.
     * @returns {Integer} Total call time.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_totalacdcalltime
     */
    get_TotalACDCallTime() {
        result := ComCall(21, this, "int*", &plCallTime := 0, "HRESULT")
        return plCallTime
    }

    /**
     * The get_TotalWrapUpTime method gets the number of seconds spent on ACD call wrap-up (after-call work) by this agent (across all sessions).
     * @returns {Integer} Total wrap-up time.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_totalwrapuptime
     */
    get_TotalWrapUpTime() {
        result := ComCall(22, this, "int*", &plWrapUpTime := 0, "HRESULT")
        return plWrapUpTime
    }

    /**
     * The get_AgentSessions method creates a collection of current agent sessions. This method is provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateAgentSessions method.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentsession">ITAgentSession</a> interface pointers (agent session objects).
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagent-get_agentsessions
     */
    get_AgentSessions() {
        pVariant := VARIANT()
        result := ComCall(23, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
