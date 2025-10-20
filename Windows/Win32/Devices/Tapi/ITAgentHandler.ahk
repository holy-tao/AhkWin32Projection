#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAgentHandler interface provides methods to create Agent objects and enumerate Automatic Call Distribution (ACD) groups. The IEnumAgentHandler::Next and ITTapiCallCenter::get_AgentHandlers methods create the ITAgentHandler interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itagenthandler
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAgentHandler extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAgentHandler
     * @type {Guid}
     */
    static IID => Guid("{587e8c22-9802-11d1-a0a4-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "CreateAgent", "CreateAgentWithID", "EnumerateACDGroups", "EnumerateUsableAddresses", "get_ACDGroups", "get_UsableAddresses"]

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-get_name
     */
    get_Name(ppName) {
        result := ComCall(7, this, "ptr", ppName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITAgent>} ppAgent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-createagent
     */
    CreateAgent(ppAgent) {
        result := ComCall(8, this, "ptr*", ppAgent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pID 
     * @param {BSTR} pPIN 
     * @param {Pointer<ITAgent>} ppAgent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-createagentwithid
     */
    CreateAgentWithID(pID, pPIN, ppAgent) {
        pID := pID is String ? BSTR.Alloc(pID).Value : pID
        pPIN := pPIN is String ? BSTR.Alloc(pPIN).Value : pPIN

        result := ComCall(9, this, "ptr", pID, "ptr", pPIN, "ptr*", ppAgent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumACDGroup>} ppEnumACDGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-enumerateacdgroups
     */
    EnumerateACDGroups(ppEnumACDGroup) {
        result := ComCall(10, this, "ptr*", ppEnumACDGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumAddress>} ppEnumAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-enumerateusableaddresses
     */
    EnumerateUsableAddresses(ppEnumAddress) {
        result := ComCall(11, this, "ptr*", ppEnumAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-get_acdgroups
     */
    get_ACDGroups(pVariant) {
        result := ComCall(12, this, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-get_usableaddresses
     */
    get_UsableAddresses(pVariant) {
        result := ComCall(13, this, "ptr", pVariant, "HRESULT")
        return result
    }
}
