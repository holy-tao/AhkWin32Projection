#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITAgentHandler.ahk" { ITAgentHandler }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\AGENTHANDLER_EVENT.ahk" { AGENTHANDLER_EVENT }

/**
 * The ITAgentHandlerEvent interface (tapi3cc.h) contains methods that retrieve the description of agent handler events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-itagenthandlerevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITAgentHandlerEvent extends IDispatch {
    /**
     * The interface identifier for ITAgentHandlerEvent
     * @type {Guid}
     */
    static IID := Guid("{297f3034-bd11-11d1-a0a7-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITAgentHandlerEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AgentHandler : IntPtr
        get_Event        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITAgentHandlerEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITAgentHandler} 
     */
    AgentHandler {
        get => this.get_AgentHandler()
    }

    /**
     * @type {AGENTHANDLER_EVENT} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * The ITAgentHandlerEvent::get_AgentHandler method (tapi3cc.h) gets the ITAgentHandler interface pointer.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandler">ITAgentHandler</a> interface returned by <b>ITAgentHandlerEvent::get_AgentHandler</b>. The application must call <b>Release</b> on the 
     * <b>ITAgentHandler</b> interface to free resources associated with it.
     * @returns {ITAgentHandler} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandler">ITAgentHandler</a> interface on which the event occurred.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandlerevent-get_agenthandler
     */
    get_AgentHandler() {
        result := ComCall(7, this, "ptr*", &ppAgentHandler := 0, "HRESULT")
        return ITAgentHandler(ppAgentHandler)
    }

    /**
     * The ITAgentHandlerEvent::get_Event method (tapi3cc.h) gets the description for the event that has occurred. (ITAgentHandlerEvent.get_Event)
     * @returns {AGENTHANDLER_EVENT} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agenthandler_event">AGENTHANDLER_EVENT</a> descriptor.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandlerevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    Query(iid) {
        if (ITAgentHandlerEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AgentHandler := CallbackCreate(GetMethod(implObj, "get_AgentHandler"), flags, 2)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AgentHandler)
        CallbackFree(this.vtbl.get_Event)
    }
}
