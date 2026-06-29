#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITAgent.ahk" { ITAgent }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITACDGroup.ahk" { ITACDGroup }
#Import "..\..\System\Com\CY.ahk" { CY }
#Import ".\ITAddress.ahk" { ITAddress }
#Import ".\AGENT_SESSION_STATE.ahk" { AGENT_SESSION_STATE }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * The ITAgentSession interface (tapi3cc.h) handles agent session, which represent an association between an agent, group, and address.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-itagentsession
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITAgentSession extends IDispatch {
    /**
     * The interface identifier for ITAgentSession
     * @type {Guid}
     */
    static IID := Guid("{5afc3147-4bcc-11d1-bf80-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITAgentSession interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Agent               : IntPtr
        get_Address             : IntPtr
        get_ACDGroup            : IntPtr
        put_State               : IntPtr
        get_State               : IntPtr
        get_SessionStartTime    : IntPtr
        get_SessionDuration     : IntPtr
        get_NumberOfCalls       : IntPtr
        get_TotalTalkTime       : IntPtr
        get_AverageTalkTime     : IntPtr
        get_TotalCallTime       : IntPtr
        get_AverageCallTime     : IntPtr
        get_TotalWrapUpTime     : IntPtr
        get_AverageWrapUpTime   : IntPtr
        get_ACDCallRate         : IntPtr
        get_LongestTimeToAnswer : IntPtr
        get_AverageTimeToAnswer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITAgentSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITAgent} 
     */
    Agent {
        get => this.get_Agent()
    }

    /**
     * @type {ITAddress} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * @type {ITACDGroup} 
     */
    ACDGroup {
        get => this.get_ACDGroup()
    }

    /**
     * @type {AGENT_SESSION_STATE} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * @type {Float} 
     */
    SessionStartTime {
        get => this.get_SessionStartTime()
    }

    /**
     * @type {Integer} 
     */
    SessionDuration {
        get => this.get_SessionDuration()
    }

    /**
     * @type {Integer} 
     */
    NumberOfCalls {
        get => this.get_NumberOfCalls()
    }

    /**
     * @type {Integer} 
     */
    TotalTalkTime {
        get => this.get_TotalTalkTime()
    }

    /**
     * @type {Integer} 
     */
    AverageTalkTime {
        get => this.get_AverageTalkTime()
    }

    /**
     * @type {Integer} 
     */
    TotalCallTime {
        get => this.get_TotalCallTime()
    }

    /**
     * @type {Integer} 
     */
    AverageCallTime {
        get => this.get_AverageCallTime()
    }

    /**
     * @type {Integer} 
     */
    TotalWrapUpTime {
        get => this.get_TotalWrapUpTime()
    }

    /**
     * @type {Integer} 
     */
    AverageWrapUpTime {
        get => this.get_AverageWrapUpTime()
    }

    /**
     * @type {CY} 
     */
    ACDCallRate {
        get => this.get_ACDCallRate()
    }

    /**
     * @type {Integer} 
     */
    LongestTimeToAnswer {
        get => this.get_LongestTimeToAnswer()
    }

    /**
     * @type {Integer} 
     */
    AverageTimeToAnswer {
        get => this.get_AverageTimeToAnswer()
    }

    /**
     * The ITAgentSession::get_Agent method (tapi3cc.h) gets a pointer to the ITAgent interface associated with this session.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface returned by <b>ITAgentSession::get_Agent</b>. The application must call <b>Release</b> on the 
     * <b>ITAgent</b> interface to free resources associated with it.
     * @returns {ITAgent} pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_agent
     */
    get_Agent() {
        result := ComCall(7, this, "ptr*", &ppAgent := 0, "HRESULT")
        return ITAgent(ppAgent)
    }

    /**
     * The ITAgentSession::get_Address method (tapi3cc.h) gets a pointer to the ITAddress interface associated with this session.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface returned by <b>ITAgentSession::get_Address</b>. The application must call <b>Release</b> on the 
     * <b>ITAddress</b> interface to free resources associated with it.
     * @returns {ITAddress} Pointer for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_address
     */
    get_Address() {
        result := ComCall(8, this, "ptr*", &ppAddress := 0, "HRESULT")
        return ITAddress(ppAddress)
    }

    /**
     * The ITAgentSession::get_ACDGroup method (tapi3cc.h) gets the ACD group associated with this session.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface returned by <b>ITAgentSession::get_ACDGroup</b>. The application must call <b>Release</b> on the 
     * <b>ITACDGroup</b> interface to free resources associated with it.
     * @returns {ITACDGroup} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_acdgroup
     */
    get_ACDGroup() {
        result := ComCall(9, this, "ptr*", &ppACDGroup := 0, "HRESULT")
        return ITACDGroup(ppACDGroup)
    }

    /**
     * The ITAgentSession::put_State method (tapi3cc.h) sets the state of the agent session.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentstate">lineSetAgentSessionState</a> function.
     * @param {AGENT_SESSION_STATE} SessionState <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agent_session_state">AGENT_SESSION_STATE</a>.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SessionState</i> parameter is not a valid session state.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentstate">lineSetAgentSessionState</a> for error codes returned from this TAPI 2.1 function.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-put_state
     */
    put_State(SessionState) {
        result := ComCall(10, this, AGENT_SESSION_STATE, SessionState, "HRESULT")
        return result
    }

    /**
     * The ITAgentSession::get_State method (tapi3cc.h) gets the current state of this session.
     * @returns {AGENT_SESSION_STATE} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agent_session_state">AGENT_SESSION_STATE</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_state
     */
    get_State() {
        result := ComCall(11, this, "int*", &pSessionState := 0, "HRESULT")
        return pSessionState
    }

    /**
     * The ITAgentSession::get_SessionStartTime (tapi3cc.h) method gets the time that the session was created.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {Float} Pointer to session start time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_sessionstarttime
     */
    get_SessionStartTime() {
        result := ComCall(12, this, "double*", &pdateSessionStart := 0, "HRESULT")
        return pdateSessionStart
    }

    /**
     * The ITAgentSession::get_SessionDuration method (tapi3cc.h) gets the duration of the Agent session in seconds.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {Integer} Pointer to session duration.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_sessionduration
     */
    get_SessionDuration() {
        result := ComCall(13, this, "int*", &plDuration := 0, "HRESULT")
        return plDuration
    }

    /**
     * The ITAgentSession::get_NumberOfCalls method (tapi3cc.h) gets the number of ACD calls handled by this agent during this session.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {Integer} Pointer to total number of calls.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_numberofcalls
     */
    get_NumberOfCalls() {
        result := ComCall(14, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The ITAgentSession::get_TotalTalkTime method (tapi3cc.h) gets the number of seconds spent by this agent talking in ACD calls during this session.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {Integer} Total talk time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_totaltalktime
     */
    get_TotalTalkTime() {
        result := ComCall(15, this, "int*", &plTalkTime := 0, "HRESULT")
        return plTalkTime
    }

    /**
     * The ITAgentSession::get_AverageTalkTime method (tapi3cc.h) gets the average time (in seconds) spent talking per ACD call during this agent session.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {Integer} Average talk time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagetalktime
     */
    get_AverageTalkTime() {
        result := ComCall(16, this, "int*", &plTalkTime := 0, "HRESULT")
        return plTalkTime
    }

    /**
     * The ITAgentSession::get_TotalCallTime method (tapi3cc.h) gets the number of seconds spent on ACD calls during this agent session (by this agent).
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {Integer} Pointer to total call time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_totalcalltime
     */
    get_TotalCallTime() {
        result := ComCall(17, this, "int*", &plCallTime := 0, "HRESULT")
        return plCallTime
    }

    /**
     * The ITAgentSession::get_AverageCallTime method (tapi3cc.h) gets the average time (in seconds) spent per ACD call during this agent session.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {Integer} Pointer to the average call time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagecalltime
     */
    get_AverageCallTime() {
        result := ComCall(18, this, "int*", &plCallTime := 0, "HRESULT")
        return plCallTime
    }

    /**
     * The ITAgentSession::get_TotalWrapUpTime method (tapi3cc.h) gets the number of seconds spent on ACD call wrap-up (after-call work) during this agent session.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {Integer} Pointer to total wrap-up time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_totalwrapuptime
     */
    get_TotalWrapUpTime() {
        result := ComCall(19, this, "int*", &plWrapUpTime := 0, "HRESULT")
        return plWrapUpTime
    }

    /**
     * The ITAgentSession::get_AverageWrapUpTime method (tapi3cc.h) gets the average time (in seconds) per ACD call spent in wrap-up during this agent session.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {Integer} Pointer to average wrap-up time.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagewrapuptime
     */
    get_AverageWrapUpTime() {
        result := ComCall(20, this, "int*", &plWrapUpTime := 0, "HRESULT")
        return plWrapUpTime
    }

    /**
     * The ITAgentSession::get_ACDCallRate method (tapi3cc.h) gets the all rate per agent session, in calls per hour.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {CY} Pointer to call rate.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_acdcallrate
     */
    get_ACDCallRate() {
        pcyCallrate := CY()
        result := ComCall(21, this, CY.Ptr, pcyCallrate, "HRESULT")
        return pcyCallrate
    }

    /**
     * The ITAgentSession::get_LongestTimeToAnswer method (tapi3cc.h) gets the longest time (in seconds) a call was waiting to be answered.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {Integer} Pointer to longest time to answer a call.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_longesttimetoanswer
     */
    get_LongestTimeToAnswer() {
        result := ComCall(22, this, "int*", &plAnswerTime := 0, "HRESULT")
        return plAnswerTime
    }

    /**
     * The ITAgentSession::get_AverageTimeToAnswer method (tapi3cc.h) gets the average time (in seconds) that calls waited to be answered.
     * @remarks
     * This method wraps the TAPI 2.1 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentsessioninfo">lineGetAgentSessionInfo</a> function.
     * @returns {Integer} Pointer to average time to answer a call.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsession-get_averagetimetoanswer
     */
    get_AverageTimeToAnswer() {
        result := ComCall(23, this, "int*", &plAnswerTime := 0, "HRESULT")
        return plAnswerTime
    }

    Query(iid) {
        if (ITAgentSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Agent := CallbackCreate(GetMethod(implObj, "get_Agent"), flags, 2)
        this.vtbl.get_Address := CallbackCreate(GetMethod(implObj, "get_Address"), flags, 2)
        this.vtbl.get_ACDGroup := CallbackCreate(GetMethod(implObj, "get_ACDGroup"), flags, 2)
        this.vtbl.put_State := CallbackCreate(GetMethod(implObj, "put_State"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_SessionStartTime := CallbackCreate(GetMethod(implObj, "get_SessionStartTime"), flags, 2)
        this.vtbl.get_SessionDuration := CallbackCreate(GetMethod(implObj, "get_SessionDuration"), flags, 2)
        this.vtbl.get_NumberOfCalls := CallbackCreate(GetMethod(implObj, "get_NumberOfCalls"), flags, 2)
        this.vtbl.get_TotalTalkTime := CallbackCreate(GetMethod(implObj, "get_TotalTalkTime"), flags, 2)
        this.vtbl.get_AverageTalkTime := CallbackCreate(GetMethod(implObj, "get_AverageTalkTime"), flags, 2)
        this.vtbl.get_TotalCallTime := CallbackCreate(GetMethod(implObj, "get_TotalCallTime"), flags, 2)
        this.vtbl.get_AverageCallTime := CallbackCreate(GetMethod(implObj, "get_AverageCallTime"), flags, 2)
        this.vtbl.get_TotalWrapUpTime := CallbackCreate(GetMethod(implObj, "get_TotalWrapUpTime"), flags, 2)
        this.vtbl.get_AverageWrapUpTime := CallbackCreate(GetMethod(implObj, "get_AverageWrapUpTime"), flags, 2)
        this.vtbl.get_ACDCallRate := CallbackCreate(GetMethod(implObj, "get_ACDCallRate"), flags, 2)
        this.vtbl.get_LongestTimeToAnswer := CallbackCreate(GetMethod(implObj, "get_LongestTimeToAnswer"), flags, 2)
        this.vtbl.get_AverageTimeToAnswer := CallbackCreate(GetMethod(implObj, "get_AverageTimeToAnswer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Agent)
        CallbackFree(this.vtbl.get_Address)
        CallbackFree(this.vtbl.get_ACDGroup)
        CallbackFree(this.vtbl.put_State)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_SessionStartTime)
        CallbackFree(this.vtbl.get_SessionDuration)
        CallbackFree(this.vtbl.get_NumberOfCalls)
        CallbackFree(this.vtbl.get_TotalTalkTime)
        CallbackFree(this.vtbl.get_AverageTalkTime)
        CallbackFree(this.vtbl.get_TotalCallTime)
        CallbackFree(this.vtbl.get_AverageCallTime)
        CallbackFree(this.vtbl.get_TotalWrapUpTime)
        CallbackFree(this.vtbl.get_AverageWrapUpTime)
        CallbackFree(this.vtbl.get_ACDCallRate)
        CallbackFree(this.vtbl.get_LongestTimeToAnswer)
        CallbackFree(this.vtbl.get_AverageTimeToAnswer)
    }
}
