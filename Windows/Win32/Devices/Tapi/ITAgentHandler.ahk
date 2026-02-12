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
 * The ITAgentHandler (tapi3.h) interface provides methods to create Agent objects and enumerate Automatic Call Distribution (ACD) groups.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nn-tapi3-itagenthandler
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
     * The get_Name method (tapi3.h) gets the agent handler name.
     * @remarks
     * The application must free the memory allocated for the <i>ppName</i> parameter through 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when the variable is no longer needed.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of the agent handler name.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itagenthandler-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(7, this, "ptr", ppName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppName
    }

    /**
     * The CreateAgent method (tapi3.h) creates an Agent object.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface returned by <b>ITAgentHandler::CreateAgent</b>. The application must call <b>Release</b> on the 
     * <b>ITAgent</b> interface to free resources associated with it.
     * @returns {ITAgent} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itagenthandler-createagent
     */
    CreateAgent() {
        result := ComCall(8, this, "ptr*", &ppAgent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITAgent(ppAgent)
    }

    /**
     * The CreateAgentWithID method (tapi3.h) creates an Agent object based on an agent identifier.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pID</i> and <i>pPIN</i> parameters, and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variables are no longer needed.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface returned by <b>ITAgentHandler::CreateAgentWithID</b>. The application must call <b>Release</b> on the 
     * <b>ITAgent</b> interface to free resources associated with it.
     * @param {BSTR} pID Pointer to <b>BSTR</b> containing the agent identifier.
     * @param {BSTR} pPIN Pointer to <b>BSTR</b> containing the agent PIN.
     * @returns {ITAgent} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itagenthandler-createagentwithid
     */
    CreateAgentWithID(pID, pPIN) {
        if(pID is String) {
            pin := BSTR.Alloc(pID)
            pID := pin.Value
        }
        if(pPIN is String) {
            pin := BSTR.Alloc(pPIN)
            pPIN := pin.Value
        }

        result := ComCall(9, this, "ptr", pID, "ptr", pPIN, "ptr*", &ppAgent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITAgent(ppAgent)
    }

    /**
     * The EnumerateACDGroups method (tapi3.h) enumerates ACD groups currently associated with the agent handler.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumacdgroup">IEnumACDGroup</a> interface returned by <b>ITAgentHandler::EnumerateACDGroups</b>. The application must call <b>Release</b> on the 
     * <b>IEnumACDGroup</b> interface to free resources associated with it.
     * @returns {IEnumACDGroup} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumacdgroup">IEnumACDGroup</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itagenthandler-enumerateacdgroups
     */
    EnumerateACDGroups() {
        result := ComCall(10, this, "ptr*", &ppEnumACDGroup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumACDGroup(ppEnumACDGroup)
    }

    /**
     * The EnumerateUsableAddresses method (tapi3.h) enumerates addresses available for receiving ACD calls on this agent handler.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumaddress">IEnumAddress</a> interface returned by <b>ITAgentHandler::EnumerateUsableAddresses</b>. The application must call <b>Release</b> on the 
     * <b>IEnumAddress</b> interface to free resources associated with it.
     * @returns {IEnumAddress} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumaddress">IEnumAddress</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itagenthandler-enumerateusableaddresses
     */
    EnumerateUsableAddresses() {
        result := ComCall(11, this, "ptr*", &ppEnumAddress := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumAddress(ppEnumAddress)
    }

    /**
     * The get_ACDGroups method (tapi3.h) creates a collection of ACD groups currently associated with the agent handler.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface returned by <b>ITAgentHandler::get_ACDGroups</b>. The application must call <b>Release</b> on the 
     * <b>ITACDGroup</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface pointers (ACD group objects).
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itagenthandler-get_acdgroups
     */
    get_ACDGroups() {
        pVariant := VARIANT()
        result := ComCall(12, this, "ptr", pVariant, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVariant
    }

    /**
     * The get_UsableAddresses method (tapi3.h) creates a collection of addresses available for receiving ACD calls on this agent handler.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface returned by <b>ITAgentHandler::get_UsableAddresses</b>. The application must call <b>Release</b> on the 
     * <b>ITAddress</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface pointers (address objects).
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itagenthandler-get_usableaddresses
     */
    get_UsableAddresses() {
        pVariant := VARIANT()
        result := ComCall(13, this, "ptr", pVariant, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVariant
    }
}
