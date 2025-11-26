#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITAgentSession.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAgentSessionEvent interface contains methods that retrieve the description of agent session events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itagentsessionevent
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
     * 
     * @returns {ITAgentSession} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsessionevent-get_session
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return ITAgentSession(ppSession)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentsessionevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }
}
