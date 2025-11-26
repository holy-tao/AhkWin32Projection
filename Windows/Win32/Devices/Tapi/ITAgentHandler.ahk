#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITAgent.ahk
#Include .\IEnumACDGroup.ahk
#Include .\IEnumAddress.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {VARIANT} 
     */
    ACDGroups {
        get => this.get_ACDGroups()
    }

    /**
     * @type {VARIANT} 
     */
    UsableAddresses {
        get => this.get_UsableAddresses()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(7, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * 
     * @returns {ITAgent} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-createagent
     */
    CreateAgent() {
        result := ComCall(8, this, "ptr*", &ppAgent := 0, "HRESULT")
        return ITAgent(ppAgent)
    }

    /**
     * 
     * @param {BSTR} pID 
     * @param {BSTR} pPIN 
     * @returns {ITAgent} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-createagentwithid
     */
    CreateAgentWithID(pID, pPIN) {
        pID := pID is String ? BSTR.Alloc(pID).Value : pID
        pPIN := pPIN is String ? BSTR.Alloc(pPIN).Value : pPIN

        result := ComCall(9, this, "ptr", pID, "ptr", pPIN, "ptr*", &ppAgent := 0, "HRESULT")
        return ITAgent(ppAgent)
    }

    /**
     * 
     * @returns {IEnumACDGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-enumerateacdgroups
     */
    EnumerateACDGroups() {
        result := ComCall(10, this, "ptr*", &ppEnumACDGroup := 0, "HRESULT")
        return IEnumACDGroup(ppEnumACDGroup)
    }

    /**
     * 
     * @returns {IEnumAddress} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-enumerateusableaddresses
     */
    EnumerateUsableAddresses() {
        result := ComCall(11, this, "ptr*", &ppEnumAddress := 0, "HRESULT")
        return IEnumAddress(ppEnumAddress)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-get_acdgroups
     */
    get_ACDGroups() {
        pVariant := VARIANT()
        result := ComCall(12, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-get_usableaddresses
     */
    get_UsableAddresses() {
        pVariant := VARIANT()
        result := ComCall(13, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
