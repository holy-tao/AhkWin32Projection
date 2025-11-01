#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<ITAgentHandler>} ppAgentHandler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandlerevent-get_agenthandler
     */
    get_AgentHandler(ppAgentHandler) {
        result := ComCall(7, this, "ptr*", ppAgentHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandlerevent-get_event
     */
    get_Event(pEvent) {
        pEventMarshal := pEvent is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pEventMarshal, pEvent, "HRESULT")
        return result
    }
}
