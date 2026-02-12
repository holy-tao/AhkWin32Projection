#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITAgent.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAgentEvent (tapi3.h) interface contains methods that retrieve the description of agent events.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nn-tapi3-itagentevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAgentEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAgentEvent
     * @type {Guid}
     */
    static IID => Guid("{5afc314a-4bcc-11d1-bf80-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Agent", "get_Event"]

    /**
     * @type {ITAgent} 
     */
    Agent {
        get => this.get_Agent()
    }

    /**
     * @type {Integer} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * The ITAgentEvent::get_Agent method (tapi3.h) gets the interface for the agent on which the event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface returned by <b>ITAgentEvent::get_Agent</b>. The application must call <b>Release</b> on the 
     * <b>ITAgent</b> interface to free resources associated with it.
     * @returns {ITAgent} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itagentevent-get_agent
     */
    get_Agent() {
        result := ComCall(7, this, "ptr*", &ppAgent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITAgent(ppAgent)
    }

    /**
     * The ITAgentEvent::get_Event method (tapi3.h) gets an AGENT_EVENT descriptor of the event that occurred.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agent_event">AGENT_EVENT</a> descriptor of event.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itagentevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pEvent
    }
}
