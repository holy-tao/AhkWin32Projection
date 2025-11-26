#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITAgentHandler.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAgentHandlerEvent interface contains methods that retrieve the description of agent handler events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itagenthandlerevent
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
     * The get_AgentHandler method gets the ITAgentHandler interface pointer.
     * @returns {ITAgentHandler} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandler">ITAgentHandler</a> interface on which the event occurred.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagenthandlerevent-get_agenthandler
     */
    get_AgentHandler() {
        result := ComCall(7, this, "ptr*", &ppAgentHandler := 0, "HRESULT")
        return ITAgentHandler(ppAgentHandler)
    }

    /**
     * The get_Event method gets the description for the event that has occurred.
     * @returns {Integer} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agenthandler_event">AGENTHANDLER_EVENT</a> descriptor.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itagenthandlerevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }
}
