#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITTerminal.ahk" { ITTerminal }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }

/**
 * The ITASRTerminalEvent interface contains methods that retrieve the description of Automatic Speech Recognition terminal events that have occurred.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itasrterminalevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITASRTerminalEvent extends IDispatch {
    /**
     * The interface identifier for ITASRTerminalEvent
     * @type {Guid}
     */
    static IID := Guid("{ee016a02-4fa9-467c-933f-5a15b12377d7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITASRTerminalEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Terminal : IntPtr
        get_Call     : IntPtr
        get_Error    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITASRTerminalEvent.Vtbl()
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
     * The get_Terminal method returns a pointer to the ITTerminal interface for the terminal on which the event occurred.
     * @returns {ITTerminal} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itasrterminalevent-get_terminal
     */
    get_Terminal() {
        result := ComCall(7, this, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * The get_Call method returns a pointer to the ITCallInfo interface for the call object involved in the terminal event.
     * @returns {ITCallInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itasrterminalevent-get_call
     */
    get_Call() {
        result := ComCall(8, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * The get_Error method returns an HRESULT cast of the error associated with the terminal event.
     * @returns {HRESULT} Pointer to error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itasrterminalevent-get_error
     */
    get_Error() {
        result := ComCall(9, this, "int*", &phrErrorCode := 0, "HRESULT")
        return phrErrorCode
    }

    Query(iid) {
        if (ITASRTerminalEvent.IID.Equals(iid)) {
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
