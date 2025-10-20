#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITTAPICallCenter interface provides an entry point into call center controls.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-ittapicallcenter
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTAPICallCenter extends IDispatch{
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
     * 
     * @param {Pointer<IEnumAgentHandler>} ppEnumHandler 
     * @returns {HRESULT} 
     */
    EnumerateAgentHandlers(ppEnumHandler) {
        result := ComCall(7, this, "ptr", ppEnumHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_AgentHandlers(pVariant) {
        result := ComCall(8, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
