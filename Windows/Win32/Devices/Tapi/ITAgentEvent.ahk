#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AGENT_EVENT.ahk" { AGENT_EVENT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITAgent.ahk" { ITAgent }

/**
 * The ITAgentEvent interface (tapi3cc.h) contains methods that retrieve the description of agent events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-itagentevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITAgentEvent extends IDispatch {
    /**
     * The interface identifier for ITAgentEvent
     * @type {Guid}
     */
    static IID := Guid("{5afc314a-4bcc-11d1-bf80-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITAgentEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Agent : IntPtr
        get_Event : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITAgentEvent.Vtbl()
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
     * @type {AGENT_EVENT} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * The ITAgentEvent::get_Agent method (tapi3cc.h) gets the interface for the agent on which the event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface returned by <b>ITAgentEvent::get_Agent</b>. The application must call <b>Release</b> on the 
     * <b>ITAgent</b> interface to free resources associated with it.
     * @returns {ITAgent} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentevent-get_agent
     */
    get_Agent() {
        result := ComCall(7, this, "ptr*", &ppAgent := 0, "HRESULT")
        return ITAgent(ppAgent)
    }

    /**
     * The ITAgentEvent::get_Event method (tapi3cc.h) gets an AGENT_EVENT descriptor of the event that occurred.
     * @returns {AGENT_EVENT} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agent_event">AGENT_EVENT</a> descriptor of event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    Query(iid) {
        if (ITAgentEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Agent := CallbackCreate(GetMethod(implObj, "get_Agent"), flags, 2)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Agent)
        CallbackFree(this.vtbl.get_Event)
    }
}
