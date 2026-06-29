#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITACDGroup.ahk" { ITACDGroup }
#Import "..\..\System\Com\CY.ahk" { CY }
#Import ".\ITAddress.ahk" { ITAddress }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IEnumAgentSession.ahk" { IEnumAgentSession }
#Import ".\AGENT_STATE.ahk" { AGENT_STATE }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ITAgentSession.ahk" { ITAgentSession }

/**
 * The ITAgent interface (tapi3cc.h) handles Agent objects, which receive and process incoming calls and make outgoing calls to customers or prospects.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-itagent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITAgent extends IDispatch {
    /**
     * The interface identifier for ITAgent
     * @type {Guid}
     */
    static IID := Guid("{5770ece5-4b27-11d1-bf80-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITAgent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        EnumerateAgentSessions    : IntPtr
        CreateSession             : IntPtr
        CreateSessionWithPIN      : IntPtr
        get_ID                    : IntPtr
        get_User                  : IntPtr
        put_State                 : IntPtr
        get_State                 : IntPtr
        put_MeasurementPeriod     : IntPtr
        get_MeasurementPeriod     : IntPtr
        get_OverallCallRate       : IntPtr
        get_NumberOfACDCalls      : IntPtr
        get_NumberOfIncomingCalls : IntPtr
        get_NumberOfOutgoingCalls : IntPtr
        get_TotalACDTalkTime      : IntPtr
        get_TotalACDCallTime      : IntPtr
        get_TotalWrapUpTime       : IntPtr
        get_AgentSessions         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITAgent.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {AGENT_STATE} 
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
     * The ITAgent::EnumerateAgentSessions method (tapi3cc.h) enumerates the current agent sessions.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumagentsession">IEnumAgentSession</a> interface returned by <b>ITAgent::EnumerateAgentSessions</b>. The application must call <b>Release</b> on the 
     * <b>IEnumAgentSession</b> interface to free resources associated with it.
     * @returns {IEnumAgentSession} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumagentsession">IEnumAgentSession</a> agent session enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-enumerateagentsessions
     */
    EnumerateAgentSessions() {
        result := ComCall(7, this, "ptr*", &ppEnumAgentSession := 0, "HRESULT")
        return IEnumAgentSession(ppEnumAgentSession)
    }

    /**
     * The ITAgent::CreateSession method (tapi3cc.h) creates a new agent session for the input ACD group and address.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentsession">ITAgentSession</a> interface returned by <b>ITAgent::CreateSession</b>. The application must call <b>Release</b> on the 
     * <b>ITAgentSession</b> interface to free resources associated with it.
     * 
     * Some telephone environments require a personal identification number to open a session. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nf-tapi3-itagent-createsessionwithpin">CreateSessionWithPIN</a>.
     * @param {ITACDGroup} pACDGroup Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface.
     * @param {ITAddress} pAddress Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> object available for receiving ACD calls.
     * @returns {ITAgentSession} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentsession">ITAgentSession</a> interface for object created.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-createsession
     */
    CreateSession(pACDGroup, pAddress) {
        result := ComCall(8, this, "ptr", pACDGroup, "ptr", pAddress, "ptr*", &ppAgentSession := 0, "HRESULT")
        return ITAgentSession(ppAgentSession)
    }

    /**
     * The ITAgent::CreateSessionWithPIN method (tapi3cc.h) creates a new agent session for the input ACD group and address, with Personal Identification Number (PIN).
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for <i>pPIN</i> and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentsession">ITAgentSession</a> interface returned by <b>ITAgent::CreateSessionWithPIN</b>. The application must call <b>Release</b> on the 
     * <b>ITAgentSession</b> interface to free resources associated with it.
     * @param {ITACDGroup} pACDGroup Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface.
     * @param {ITAddress} pAddress Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface for object available for receiving ACD calls.
     * @param {BSTR} pPIN Pointer to a <b>BSTR</b> representation of agent's PIN.
     * @returns {ITAgentSession} Pointer to session created.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-createsessionwithpin
     */
    CreateSessionWithPIN(pACDGroup, pAddress, pPIN) {
        pPIN := pPIN is String ? BSTR.Alloc(pPIN).Value : pPIN

        result := ComCall(9, this, "ptr", pACDGroup, "ptr", pAddress, BSTR, pPIN, "ptr*", &ppAgentSession := 0, "HRESULT")
        return ITAgentSession(ppAgentSession)
    }

    /**
     * The ITAgent::get_ID method (tapi3cc.h) gets an agent's ID.
     * @remarks
     * This method is provided for interfacing with legacy switch solutions.
     * 
     * The application must free the memory allocated for the <i>ppID</i> parameter through 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when the variable is no longer needed.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing agent ID.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_id
     */
    get_ID() {
        ppID := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, ppID, "HRESULT")
        return ppID
    }

    /**
     * The ITAgent::get_User method (tapi3cc.h) gets the agent user name, which is the same as the operating system user login or e-mail name.
     * @remarks
     * The application must free the memory allocated for the <i>ppUser</i> parameter through 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when the variable is no longer needed.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing user name.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_user
     */
    get_User() {
        ppUser := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, ppUser, "HRESULT")
        return ppUser
    }

    /**
     * The ITAgent::put_State method (tapi3cc.h) sets the state of an agent session.
     * @remarks
     * The <b>ITAgent::put_State</b> method is a COM wrapper for the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentstateex">lineSetAgentStateEx</a> function.
     * @param {AGENT_STATE} AgentState <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agent_state">AGENT_STATE</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-put_state
     */
    put_State(AgentState) {
        result := ComCall(12, this, AGENT_STATE, AgentState, "HRESULT")
        return result
    }

    /**
     * The ITAgent::get_State method (tapi3cc.h) gets the state of an agent session.
     * @returns {AGENT_STATE} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agent_state">AGENT_STATE</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_state
     */
    get_State() {
        result := ComCall(13, this, "int*", &pAgentState := 0, "HRESULT")
        return pAgentState
    }

    /**
     * The ITAgent::put_MeasurementPeriod method (tapi3cc.h) sets the period (in seconds) for which the switch and/or implementation stores and calculates information.
     * @remarks
     * The <b>ITAgent::put_MeasurementPeriod</b> method is a COM wrapper for the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentmeasurementperiod">lineSetAgentMeasurementPeriod</a> function.
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
     * <dt><b>LINEERR_</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentmeasurementperiod">lineSetAgentMeasurementPeriod</a> for error codes returned from this TAPI 2.1 function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-put_measurementperiod
     */
    put_MeasurementPeriod(lPeriod) {
        result := ComCall(14, this, "int", lPeriod, "HRESULT")
        return result
    }

    /**
     * The ITAgent::get_MeasurementPeriod method (tapi3cc.h) gets the measurement period for which the switch and/or implementation stores and calculates information.
     * @returns {Integer} Measurement period.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_measurementperiod
     */
    get_MeasurementPeriod() {
        result := ComCall(15, this, "int*", &plPeriod := 0, "HRESULT")
        return plPeriod
    }

    /**
     * The ITAgent::get_OverallCallRate method (tapi3cc.h) gets an agent's call rate across all sessions.
     * @remarks
     * The <b>CURRENCY</b> type is used here instead of <b>FLOAT</b> for Visual Basic and Java compatibility.
     * @returns {CY} Call rate.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_overallcallrate
     */
    get_OverallCallRate() {
        pcyCallrate := CY()
        result := ComCall(16, this, CY.Ptr, pcyCallrate, "HRESULT")
        return pcyCallrate
    }

    /**
     * The ITAgent::get_NumberOfACDCalls method (tapi3cc.h) gets the number of ACD calls handled by this agent across all sessions.
     * @returns {Integer} Total number of calls.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_numberofacdcalls
     */
    get_NumberOfACDCalls() {
        result := ComCall(17, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The ITAgent::get_NumberOfIncomingCalls method (tapi3cc.h) gets the number of incoming non-ACD calls handled by this agent.
     * @returns {Integer} Total number of incoming calls.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_numberofincomingcalls
     */
    get_NumberOfIncomingCalls() {
        result := ComCall(18, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The ITAgent::get_NumberOfOutgoingCalls method (tapi3cc.h) gets the number of outgoing non-ACD calls handled during by this agent.
     * @returns {Integer} Total number of outgoing calls.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_numberofoutgoingcalls
     */
    get_NumberOfOutgoingCalls() {
        result := ComCall(19, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The ITAgent::get_TotalACDTalkTime method (tapi3cc.h) gets the number of seconds spent talking in ACD calls by this agent, across all sessions.
     * @returns {Integer} Total talk time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_totalacdtalktime
     */
    get_TotalACDTalkTime() {
        result := ComCall(20, this, "int*", &plTalkTime := 0, "HRESULT")
        return plTalkTime
    }

    /**
     * The ITAgent::get_TotalACDCallTime method (tapi3cc.h) gets the number of seconds spent on ACD calls by this agent, across all sessions.
     * @returns {Integer} Total call time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_totalacdcalltime
     */
    get_TotalACDCallTime() {
        result := ComCall(21, this, "int*", &plCallTime := 0, "HRESULT")
        return plCallTime
    }

    /**
     * The ITAgent::get_TotalWrapUpTime method (tapi3cc.h) gets the number of seconds spent on ACD call wrap-up by this agent, across all sessions.
     * @returns {Integer} Total wrap-up time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_totalwrapuptime
     */
    get_TotalWrapUpTime() {
        result := ComCall(22, this, "int*", &plWrapUpTime := 0, "HRESULT")
        return plWrapUpTime
    }

    /**
     * The ITAgent::get_AgentSessions method (tapi3cc.h) creates a collection of current agent sessions.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentsession">ITAgentSession</a> interface returned by <b>ITAgent::get_AgentSessions</b>. The application must call <b>Release</b> on the 
     * <b>ITAgentSession</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentsession">ITAgentSession</a> interface pointers (agent session objects).
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_agentsessions
     */
    get_AgentSessions() {
        pVariant := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    Query(iid) {
        if (ITAgent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateAgentSessions := CallbackCreate(GetMethod(implObj, "EnumerateAgentSessions"), flags, 2)
        this.vtbl.CreateSession := CallbackCreate(GetMethod(implObj, "CreateSession"), flags, 4)
        this.vtbl.CreateSessionWithPIN := CallbackCreate(GetMethod(implObj, "CreateSessionWithPIN"), flags, 5)
        this.vtbl.get_ID := CallbackCreate(GetMethod(implObj, "get_ID"), flags, 2)
        this.vtbl.get_User := CallbackCreate(GetMethod(implObj, "get_User"), flags, 2)
        this.vtbl.put_State := CallbackCreate(GetMethod(implObj, "put_State"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.put_MeasurementPeriod := CallbackCreate(GetMethod(implObj, "put_MeasurementPeriod"), flags, 2)
        this.vtbl.get_MeasurementPeriod := CallbackCreate(GetMethod(implObj, "get_MeasurementPeriod"), flags, 2)
        this.vtbl.get_OverallCallRate := CallbackCreate(GetMethod(implObj, "get_OverallCallRate"), flags, 2)
        this.vtbl.get_NumberOfACDCalls := CallbackCreate(GetMethod(implObj, "get_NumberOfACDCalls"), flags, 2)
        this.vtbl.get_NumberOfIncomingCalls := CallbackCreate(GetMethod(implObj, "get_NumberOfIncomingCalls"), flags, 2)
        this.vtbl.get_NumberOfOutgoingCalls := CallbackCreate(GetMethod(implObj, "get_NumberOfOutgoingCalls"), flags, 2)
        this.vtbl.get_TotalACDTalkTime := CallbackCreate(GetMethod(implObj, "get_TotalACDTalkTime"), flags, 2)
        this.vtbl.get_TotalACDCallTime := CallbackCreate(GetMethod(implObj, "get_TotalACDCallTime"), flags, 2)
        this.vtbl.get_TotalWrapUpTime := CallbackCreate(GetMethod(implObj, "get_TotalWrapUpTime"), flags, 2)
        this.vtbl.get_AgentSessions := CallbackCreate(GetMethod(implObj, "get_AgentSessions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateAgentSessions)
        CallbackFree(this.vtbl.CreateSession)
        CallbackFree(this.vtbl.CreateSessionWithPIN)
        CallbackFree(this.vtbl.get_ID)
        CallbackFree(this.vtbl.get_User)
        CallbackFree(this.vtbl.put_State)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.put_MeasurementPeriod)
        CallbackFree(this.vtbl.get_MeasurementPeriod)
        CallbackFree(this.vtbl.get_OverallCallRate)
        CallbackFree(this.vtbl.get_NumberOfACDCalls)
        CallbackFree(this.vtbl.get_NumberOfIncomingCalls)
        CallbackFree(this.vtbl.get_NumberOfOutgoingCalls)
        CallbackFree(this.vtbl.get_TotalACDTalkTime)
        CallbackFree(this.vtbl.get_TotalACDCallTime)
        CallbackFree(this.vtbl.get_TotalWrapUpTime)
        CallbackFree(this.vtbl.get_AgentSessions)
    }
}
