#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITAgent.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAgentEvent interface contains methods that retrieve the description of agent events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itagentevent
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
     * 
     * @returns {ITAgent} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentevent-get_agent
     */
    get_Agent() {
        result := ComCall(7, this, "ptr*", &ppAgent := 0, "HRESULT")
        return ITAgent(ppAgent)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagentevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }
}
