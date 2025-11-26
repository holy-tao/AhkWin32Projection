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
     * 
     * @returns {IEnumAgentSession} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-enumerateagentsessions
     */
    EnumerateAgentSessions() {
        result := ComCall(7, this, "ptr*", &ppEnumAgentSession := 0, "HRESULT")
        return IEnumAgentSession(ppEnumAgentSession)
    }

    /**
     * 
     * @param {ITACDGroup} pACDGroup 
     * @param {ITAddress} pAddress 
     * @returns {ITAgentSession} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-createsession
     */
    CreateSession(pACDGroup, pAddress) {
        result := ComCall(8, this, "ptr", pACDGroup, "ptr", pAddress, "ptr*", &ppAgentSession := 0, "HRESULT")
        return ITAgentSession(ppAgentSession)
    }

    /**
     * 
     * @param {ITACDGroup} pACDGroup 
     * @param {ITAddress} pAddress 
     * @param {BSTR} pPIN 
     * @returns {ITAgentSession} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-createsessionwithpin
     */
    CreateSessionWithPIN(pACDGroup, pAddress, pPIN) {
        pPIN := pPIN is String ? BSTR.Alloc(pPIN).Value : pPIN

        result := ComCall(9, this, "ptr", pACDGroup, "ptr", pAddress, "ptr", pPIN, "ptr*", &ppAgentSession := 0, "HRESULT")
        return ITAgentSession(ppAgentSession)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_id
     */
    get_ID() {
        ppID := BSTR()
        result := ComCall(10, this, "ptr", ppID, "HRESULT")
        return ppID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_user
     */
    get_User() {
        ppUser := BSTR()
        result := ComCall(11, this, "ptr", ppUser, "HRESULT")
        return ppUser
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_state
     */
    get_State() {
        result := ComCall(13, this, "int*", &pAgentState := 0, "HRESULT")
        return pAgentState
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_measurementperiod
     */
    get_MeasurementPeriod() {
        result := ComCall(15, this, "int*", &plPeriod := 0, "HRESULT")
        return plPeriod
    }

    /**
     * 
     * @returns {CY} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_overallcallrate
     */
    get_OverallCallRate() {
        pcyCallrate := CY()
        result := ComCall(16, this, "ptr", pcyCallrate, "HRESULT")
        return pcyCallrate
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_numberofacdcalls
     */
    get_NumberOfACDCalls() {
        result := ComCall(17, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_numberofincomingcalls
     */
    get_NumberOfIncomingCalls() {
        result := ComCall(18, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_numberofoutgoingcalls
     */
    get_NumberOfOutgoingCalls() {
        result := ComCall(19, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_totalacdtalktime
     */
    get_TotalACDTalkTime() {
        result := ComCall(20, this, "int*", &plTalkTime := 0, "HRESULT")
        return plTalkTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_totalacdcalltime
     */
    get_TotalACDCallTime() {
        result := ComCall(21, this, "int*", &plCallTime := 0, "HRESULT")
        return plCallTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_totalwrapuptime
     */
    get_TotalWrapUpTime() {
        result := ComCall(22, this, "int*", &plWrapUpTime := 0, "HRESULT")
        return plWrapUpTime
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagent-get_agentsessions
     */
    get_AgentSessions() {
        pVariant := VARIANT()
        result := ComCall(23, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
