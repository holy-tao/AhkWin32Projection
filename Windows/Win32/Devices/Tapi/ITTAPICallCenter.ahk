#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumAgentHandler.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITTAPICallCenter interface provides an entry point into call center controls.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-ittapicallcenter
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTAPICallCenter extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITTAPICallCenter
     * @type {Guid}
     */
    static IID => Guid("{5afc3154-4bcc-11d1-bf80-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumerateAgentHandlers", "get_AgentHandlers"]

    /**
     * @type {VARIANT} 
     */
    AgentHandlers {
        get => this.get_AgentHandlers()
    }

    /**
     * The EnumerateAgentHandlers method enumerates agent handlers that are currently associated with the call center.
     * @returns {IEnumAgentHandler} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumagenthandler">IEnumAgentHandler</a> enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-ittapicallcenter-enumerateagenthandlers
     */
    EnumerateAgentHandlers() {
        result := ComCall(7, this, "ptr*", &ppEnumHandler := 0, "HRESULT")
        return IEnumAgentHandler(ppEnumHandler)
    }

    /**
     * The get_AgentHandlers method creates a collection of agent handlers that are currently associated with the call center.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandler">ITAgentHandler</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-ittapicallcenter-get_agenthandlers
     */
    get_AgentHandlers() {
        pVariant := VARIANT()
        result := ComCall(8, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
