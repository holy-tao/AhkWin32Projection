#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITTerminal.ahk" { ITTerminal }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }

/**
 * The ITTTSTerminalEvent interface contains methods that retrieve the description of Text-to-Speech (TTS) terminal events that have occurred.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itttsterminalevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITTTSTerminalEvent extends IDispatch {
    /**
     * The interface identifier for ITTTSTerminalEvent
     * @type {Guid}
     */
    static IID := Guid("{d964788f-95a5-461d-ab0c-b9900a6c2713}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITTTSTerminalEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Terminal : IntPtr
        get_Call     : IntPtr
        get_Error    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITTTSTerminalEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITTerminal} 
     */
    Terminal {
        get => this.get_Terminal()
    }

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {HRESULT} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * The get_Terminal method gets an ITTerminal interface pointer for the terminal object involved in the event.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface returned by <b>ITTTSTerminalEvent::get_Terminal</b>. The application must call <b>Release</b> on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface to free resources associated with it.
     * @returns {ITTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itttsterminalevent-get_terminal
     */
    get_Terminal() {
        result := ComCall(7, this, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * The get_Call method returns an ITCallInfo interface pointer for the call involved in the terminal event.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface returned by <b>ITTTSTerminalEvent::get_Call</b>. The application must call <b>Release</b> on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface to free resources associated with it.
     * @returns {ITCallInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itttsterminalevent-get_call
     */
    get_Call() {
        result := ComCall(8, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * The get_Error method gets an HRESULT cast of the error code involved in the terminal event.
     * @returns {HRESULT} Pointer to the <b>HRESULT</b> cast of the error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itttsterminalevent-get_error
     */
    get_Error() {
        result := ComCall(9, this, "int*", &phrErrorCode := 0, "HRESULT")
        return phrErrorCode
    }

    Query(iid) {
        if (ITTTSTerminalEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Terminal := CallbackCreate(GetMethod(implObj, "get_Terminal"), flags, 2)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_Error := CallbackCreate(GetMethod(implObj, "get_Error"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Terminal)
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_Error)
    }
}
