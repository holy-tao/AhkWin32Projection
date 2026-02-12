#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITAgentHandler.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAgentHandlerEvent (tapi3.h) interface contains methods that retrieve the description of agent handler events.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nn-tapi3-itagenthandlerevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAgentHandlerEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAgentHandlerEvent
     * @type {Guid}
     */
    static IID => Guid("{297f3034-bd11-11d1-a0a7-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AgentHandler", "get_Event"]

    /**
     * @type {ITAgentHandler} 
     */
    AgentHandler {
        get => this.get_AgentHandler()
    }

    /**
     * @type {Integer} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * The get_AgentHandler method (tapi3.h) gets the ITAgentHandler interface pointer.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandler">ITAgentHandler</a> interface returned by <b>ITAgentHandlerEvent::get_AgentHandler</b>. The application must call <b>Release</b> on the 
     * <b>ITAgentHandler</b> interface to free resources associated with it.
     * @returns {ITAgentHandler} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandler">ITAgentHandler</a> interface on which the event occurred.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itagenthandlerevent-get_agenthandler
     */
    get_AgentHandler() {
        result := ComCall(7, this, "ptr*", &ppAgentHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITAgentHandler(ppAgentHandler)
    }

    /**
     * The get_Event method (tapi3.h) gets the description for the event that has occurred.
     * @returns {Integer} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agenthandler_event">AGENTHANDLER_EVENT</a> descriptor.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itagenthandlerevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pEvent
    }
}
