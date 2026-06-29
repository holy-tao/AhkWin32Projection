#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumAgentHandler.ahk" { IEnumAgentHandler }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITTAPICallCenter interface (tapi3cc.h) provides an entry point into call center controls.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-ittapicallcenter
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITTAPICallCenter extends IDispatch {
    /**
     * The interface identifier for ITTAPICallCenter
     * @type {Guid}
     */
    static IID := Guid("{5afc3154-4bcc-11d1-bf80-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITTAPICallCenter interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        EnumerateAgentHandlers : IntPtr
        get_AgentHandlers      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITTAPICallCenter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    AgentHandlers {
        get => this.get_AgentHandlers()
    }

    /**
     * The ITTAPICallCenter::EnumerateAgentHandlers method (tapi3cc.h) enumerates agent handlers that are currently associated with the call center.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumagenthandler">IEnumAgentHandler</a> interface returned by <b>tapi3.ittapicallcenter_enumerateagenthandlers</b>. The application must call <b>Release</b> on the 
     * <b>IEnumAgentHandler</b> interface to free resources associated with it.
     * @returns {IEnumAgentHandler} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumagenthandler">IEnumAgentHandler</a> enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-ittapicallcenter-enumerateagenthandlers
     */
    EnumerateAgentHandlers() {
        result := ComCall(7, this, "ptr*", &ppEnumHandler := 0, "HRESULT")
        return IEnumAgentHandler(ppEnumHandler)
    }

    /**
     * The ITTAPICallCenter::get_AgentHandlers method (tapi3cc.h) creates a collection of agent handlers that are currently associated with the call center.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandler">ITAgentHandler</a> interface returned by <b>ITTAPICallCenter::get_AgentHandlers</b>. The application must call <b>Release</b> on the 
     * <b>ITAgentHandler</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandler">ITAgentHandler</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-ittapicallcenter-get_agenthandlers
     */
    get_AgentHandlers() {
        pVariant := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    Query(iid) {
        if (ITTAPICallCenter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateAgentHandlers := CallbackCreate(GetMethod(implObj, "EnumerateAgentHandlers"), flags, 2)
        this.vtbl.get_AgentHandlers := CallbackCreate(GetMethod(implObj, "get_AgentHandlers"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateAgentHandlers)
        CallbackFree(this.vtbl.get_AgentHandlers)
    }
}
