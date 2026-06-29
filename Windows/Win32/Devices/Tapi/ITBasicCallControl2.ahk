#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TERMINAL_DIRECTION.ahk" { TERMINAL_DIRECTION }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITTerminal.ahk" { ITTerminal }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITBasicCallControl.ahk" { ITBasicCallControl }

/**
 * The ITBasicCallControl2 interface is an extension of the ITBasicCallControl interface.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itbasiccallcontrol2
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITBasicCallControl2 extends ITBasicCallControl {
    /**
     * The interface identifier for ITBasicCallControl2
     * @type {Guid}
     */
    static IID := Guid("{161a4a56-1e99-4b3f-a46a-168f38a5ee4c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITBasicCallControl2 interfaces
    */
    struct Vtbl extends ITBasicCallControl.Vtbl {
        RequestTerminal        : IntPtr
        SelectTerminalOnCall   : IntPtr
        UnselectTerminalOnCall : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITBasicCallControl2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The RequestTerminal method gets a suitable terminal, given the class, media, and direction required.
     * @remarks
     * The <b>AddRef</b> method is automatically called on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface returned by this method. The application must call the <b>Release</b> method on the 
     * <b>ITTerminal</b> interface to free resources associated with it.
     * @param {BSTR} bstrTerminalClassGUID The terminal class required for the call.
     * @param {Integer} lMediaType Bitwise ORed list of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media types</a> required for the call.
     * @param {TERMINAL_DIRECTION} _Direction The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor for the terminal.
     * @returns {ITTerminal} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol2-requestterminal
     */
    RequestTerminal(bstrTerminalClassGUID, lMediaType, _Direction) {
        bstrTerminalClassGUID := bstrTerminalClassGUID is String ? BSTR.Alloc(bstrTerminalClassGUID).Value : bstrTerminalClassGUID

        result := ComCall(25, this, BSTR, bstrTerminalClassGUID, "int", lMediaType, TERMINAL_DIRECTION, _Direction, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * The SelectTerminalOnCall method selects the terminal onto the call.
     * @param {ITTerminal} pTerminal Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol2-selectterminaloncall
     */
    SelectTerminalOnCall(pTerminal) {
        result := ComCall(26, this, "ptr", pTerminal, "HRESULT")
        return result
    }

    /**
     * The UnselectTerminalOnCall method unselects a terminal from the call.
     * @param {ITTerminal} pTerminal Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol2-unselectterminaloncall
     */
    UnselectTerminalOnCall(pTerminal) {
        result := ComCall(27, this, "ptr", pTerminal, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITBasicCallControl2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestTerminal := CallbackCreate(GetMethod(implObj, "RequestTerminal"), flags, 5)
        this.vtbl.SelectTerminalOnCall := CallbackCreate(GetMethod(implObj, "SelectTerminalOnCall"), flags, 2)
        this.vtbl.UnselectTerminalOnCall := CallbackCreate(GetMethod(implObj, "UnselectTerminalOnCall"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestTerminal)
        CallbackFree(this.vtbl.SelectTerminalOnCall)
        CallbackFree(this.vtbl.UnselectTerminalOnCall)
    }
}
