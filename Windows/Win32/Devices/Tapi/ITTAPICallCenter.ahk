#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumAgentHandler.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITTAPICallCenter interface (tapi3.h) provides an entry point into call center controls.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nn-tapi3-ittapicallcenter
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
     * The ITTAPICallCenter::EnumerateAgentHandlers (tapi3.h) method enumerates agent handlers that are currently associated with the call center.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumagenthandler">IEnumAgentHandler</a> interface returned by <b>tapi3.ittapicallcenter_enumerateagenthandlers</b>. The application must call <b>Release</b> on the 
     * <b>IEnumAgentHandler</b> interface to free resources associated with it.
     * @returns {IEnumAgentHandler} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumagenthandler">IEnumAgentHandler</a> enumerator.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-ittapicallcenter-enumerateagenthandlers
     */
    EnumerateAgentHandlers() {
        result := ComCall(7, this, "ptr*", &ppEnumHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumAgentHandler(ppEnumHandler)
    }

    /**
     * The ITTAPICallCenter::get_AgentHandlers (tapi3.h) method creates a collection of agent handlers that are currently associated with the call center.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandler">ITAgentHandler</a> interface returned by <b>ITTAPICallCenter::get_AgentHandlers</b>. The application must call <b>Release</b> on the 
     * <b>ITAgentHandler</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandler">ITAgentHandler</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-ittapicallcenter-get_agenthandlers
     */
    get_AgentHandlers() {
        pVariant := VARIANT()
        result := ComCall(8, this, "ptr", pVariant, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVariant
    }
}
