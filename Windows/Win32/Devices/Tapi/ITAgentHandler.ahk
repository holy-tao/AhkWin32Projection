#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IEnumAddress.ahk" { IEnumAddress }
#Import ".\IEnumACDGroup.ahk" { IEnumACDGroup }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITAgent.ahk" { ITAgent }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITAgentHandler interface (tapi3cc.h) provides methods to create Agent objects and enumerate Automatic Call Distribution (ACD) groups.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-itagenthandler
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITAgentHandler extends IDispatch {
    /**
     * The interface identifier for ITAgentHandler
     * @type {Guid}
     */
    static IID := Guid("{587e8c22-9802-11d1-a0a4-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITAgentHandler interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name                 : IntPtr
        CreateAgent              : IntPtr
        CreateAgentWithID        : IntPtr
        EnumerateACDGroups       : IntPtr
        EnumerateUsableAddresses : IntPtr
        get_ACDGroups            : IntPtr
        get_UsableAddresses      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITAgentHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The ITAgentHandler::get_Name method (tapi3cc.h) gets the agent handler name.
     * @remarks
     * The application must free the memory allocated for the <i>ppName</i> parameter through 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when the variable is no longer needed.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of the agent handler name.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-get_name
     */
    get_Name() {
        ppName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, ppName, "HRESULT")
        return ppName
    }

    /**
     * The ITAgentHandler::CreateAgent method (tapi3cc.h) creates an Agent object.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface returned by <b>ITAgentHandler::CreateAgent</b>. The application must call <b>Release</b> on the 
     * <b>ITAgent</b> interface to free resources associated with it.
     * @returns {ITAgent} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagent">ITAgent</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-createagent
     */
    CreateAgent() {
        result := ComCall(8, this, "ptr*", &ppAgent := 0, "HRESULT")
        return ITAgent(ppAgent)
    }

    /**
     * The ITAgentHandler::CreateAgentWithID method (tapi3cc.h) creates an Agent object based on an agent identifier.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-createagentwithid
     */
    CreateAgentWithID(pID, pPIN) {
        pID := pID is String ? BSTR.Alloc(pID).Value : pID
        pPIN := pPIN is String ? BSTR.Alloc(pPIN).Value : pPIN

        result := ComCall(9, this, BSTR, pID, BSTR, pPIN, "ptr*", &ppAgent := 0, "HRESULT")
        return ITAgent(ppAgent)
    }

    /**
     * The ITAgentHandler::EnumerateACDGroups method (tapi3cc.h) enumerates ACD groups currently associated with the agent handler.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumacdgroup">IEnumACDGroup</a> interface returned by <b>ITAgentHandler::EnumerateACDGroups</b>. The application must call <b>Release</b> on the 
     * <b>IEnumACDGroup</b> interface to free resources associated with it.
     * @returns {IEnumACDGroup} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumacdgroup">IEnumACDGroup</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-enumerateacdgroups
     */
    EnumerateACDGroups() {
        result := ComCall(10, this, "ptr*", &ppEnumACDGroup := 0, "HRESULT")
        return IEnumACDGroup(ppEnumACDGroup)
    }

    /**
     * The ITAgentHandler::EnumerateUsableAddresses method (tapi3cc.h) enumerates addresses available for receiving ACD calls on this agent handler.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumaddress">IEnumAddress</a> interface returned by <b>ITAgentHandler::EnumerateUsableAddresses</b>. The application must call <b>Release</b> on the 
     * <b>IEnumAddress</b> interface to free resources associated with it.
     * @returns {IEnumAddress} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumaddress">IEnumAddress</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-enumerateusableaddresses
     */
    EnumerateUsableAddresses() {
        result := ComCall(11, this, "ptr*", &ppEnumAddress := 0, "HRESULT")
        return IEnumAddress(ppEnumAddress)
    }

    /**
     * The ITAgentHandler::get_ACDGroups method (tapi3cc.h) creates a collection of ACD groups currently associated with the agent handler.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface returned by <b>ITAgentHandler::get_ACDGroups</b>. The application must call <b>Release</b> on the 
     * <b>ITACDGroup</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface pointers (ACD group objects).
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-get_acdgroups
     */
    get_ACDGroups() {
        pVariant := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The ITAgentHandler::get_UsableAddresses method (tapi3cc.h) creates a collection of addresses available for receiving ACD calls on this agent handler.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface returned by <b>ITAgentHandler::get_UsableAddresses</b>. The application must call <b>Release</b> on the 
     * <b>ITAddress</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface pointers (address objects).
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itagenthandler-get_usableaddresses
     */
    get_UsableAddresses() {
        pVariant := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    Query(iid) {
        if (ITAgentHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.CreateAgent := CallbackCreate(GetMethod(implObj, "CreateAgent"), flags, 2)
        this.vtbl.CreateAgentWithID := CallbackCreate(GetMethod(implObj, "CreateAgentWithID"), flags, 4)
        this.vtbl.EnumerateACDGroups := CallbackCreate(GetMethod(implObj, "EnumerateACDGroups"), flags, 2)
        this.vtbl.EnumerateUsableAddresses := CallbackCreate(GetMethod(implObj, "EnumerateUsableAddresses"), flags, 2)
        this.vtbl.get_ACDGroups := CallbackCreate(GetMethod(implObj, "get_ACDGroups"), flags, 2)
        this.vtbl.get_UsableAddresses := CallbackCreate(GetMethod(implObj, "get_UsableAddresses"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.CreateAgent)
        CallbackFree(this.vtbl.CreateAgentWithID)
        CallbackFree(this.vtbl.EnumerateACDGroups)
        CallbackFree(this.vtbl.EnumerateUsableAddresses)
        CallbackFree(this.vtbl.get_ACDGroups)
        CallbackFree(this.vtbl.get_UsableAddresses)
    }
}
