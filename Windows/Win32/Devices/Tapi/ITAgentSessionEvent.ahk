#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITAgentSession.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAgentSessionEvent interface (tapi3cc.h) contains methods that retrieve the description of agent session events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-itagentsessionevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAgentSessionEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAgentSessionEvent
     * @type {Guid}
     */
    static IID => Guid("{5afc314b-4bcc-11d1-bf80-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_Event"]

    /**
     * @type {ITAgentSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {Integer} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * The ITAgentSessionEvent::get_Session method (tapi3cc.h) method gets a pointer to the ITAgentSession on which the event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentsession">ITAgentSession</a> interface returned by <b>ITAgentSessionEvent::get_Session</b>. The application must call <b>Release</b> on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentsession">ITAgentSession</a> interface to free resources associated with it.
     * @returns {ITAgentSession} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentsession">ITAgentSession</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsessionevent-get_session
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return ITAgentSession(ppSession)
    }

    /**
     * The ITAgentSessionEvent::get_Event method (tapi3cc.h) gets an AGENT_SESSION_EVENT descriptor of the event that occurred.
     * @returns {Integer} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-agent_session_event">AGENT_SESSION_EVENT</a> descriptor of the event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsessionevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }
}
