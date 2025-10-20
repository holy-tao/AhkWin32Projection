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
     * 
     * @param {Pointer<ITAgentHandler>} ppAgentHandler 
     * @returns {HRESULT} 
     */
    get_AgentHandler(ppAgentHandler) {
        result := ComCall(7, this, "ptr", ppAgentHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pEvent 
     * @returns {HRESULT} 
     */
    get_Event(pEvent) {
        result := ComCall(8, this, "int*", pEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
