#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CALLHUB_STATE.ahk" { CALLHUB_STATE }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumCall.ahk" { IEnumCall }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITCallHub interface provides methods to retrieve information concerning a CallHub object. The IEnumCallHub::Next and ITTapi::get_CallHubs methods create the ITCallHub interface.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itcallhub
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITCallHub extends IDispatch {
    /**
     * The interface identifier for ITCallHub
     * @type {Guid}
     */
    static IID := Guid("{a3c1544e-5b92-11d1-8f4e-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITCallHub interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Clear          : IntPtr
        EnumerateCalls : IntPtr
        get_Calls      : IntPtr
        get_NumCalls   : IntPtr
        get_State      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITCallHub.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    Calls {
        get => this.get_Calls()
    }

    /**
     * @type {Integer} 
     */
    NumCalls {
        get => this.get_NumCalls()
    }

    /**
     * @type {CALLHUB_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * The Clear method attempts to remove all calls and participants from CallHub. The application may not have the privileges required to disconnect every call.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhub-clear
     */
    Clear() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The EnumerateCalls method enumerates calls currently associated with the call hub. This method is provided for C and C++ applications. Automation client applications, such as those written in Visual Basic, must use the get_Calls method.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumcall">IEnumCall</a> interface returned by <b>ITCallHub::EnumerateCalls</b>. The application must call <b>Release</b> on the 
     * <b>IEnumCall</b> interface to free resources associated with it.
     * @returns {IEnumCall} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumcall">IEnumCall</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhub-enumeratecalls
     */
    EnumerateCalls() {
        result := ComCall(8, this, "ptr*", &ppEnumCall := 0, "HRESULT")
        return IEnumCall(ppEnumCall)
    }

    /**
     * The get_Calls method creates a collection of calls associated with the current call hub. This method is provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateCalls method.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface returned by <b>ITCallHub::get_Calls</b>. The application must call <b>Release</b> on the 
     * <b>ITCallInfo</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface pointers (call objects).
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhub-get_calls
     */
    get_Calls() {
        pCalls := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, pCalls, "HRESULT")
        return pCalls
    }

    /**
     * The get_NumCalls method gets the number of calls currently in the CallHub.
     * @returns {Integer} Total number of calls in the CallHub.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhub-get_numcalls
     */
    get_NumCalls() {
        result := ComCall(10, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The get_State method gets the current state of the CallHub.
     * @returns {CALLHUB_STATE} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callhub_state">CALLHUB_STATE</a> indicator of state.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhub-get_state
     */
    get_State() {
        result := ComCall(11, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    Query(iid) {
        if (ITCallHub.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.EnumerateCalls := CallbackCreate(GetMethod(implObj, "EnumerateCalls"), flags, 2)
        this.vtbl.get_Calls := CallbackCreate(GetMethod(implObj, "get_Calls"), flags, 2)
        this.vtbl.get_NumCalls := CallbackCreate(GetMethod(implObj, "get_NumCalls"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.EnumerateCalls)
        CallbackFree(this.vtbl.get_Calls)
        CallbackFree(this.vtbl.get_NumCalls)
        CallbackFree(this.vtbl.get_State)
    }
}
