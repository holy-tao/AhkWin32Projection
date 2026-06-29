#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITTerminal.ahk" { ITTerminal }
#Import ".\ITAddress.ahk" { ITAddress }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ADDRESS_EVENT.ahk" { ADDRESS_EVENT }

/**
 * The ITAddressEvent interface contains methods that retrieve the description of address events.
 * @remarks
 * Certain events on PnP devices will not be received until after the first time static terminals are enumerated using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-enumeratestaticterminals">ITTerminalSupport::EnumerateStaticTerminals</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-get_staticterminals">ITTerminalSupport::get_StaticTerminals</a>.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itaddressevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITAddressEvent extends IDispatch {
    /**
     * The interface identifier for ITAddressEvent
     * @type {Guid}
     */
    static IID := Guid("{831ce2d1-83b5-11d1-bb5c-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITAddressEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Address  : IntPtr
        get_Event    : IntPtr
        get_Terminal : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITAddressEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITAddress} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * @type {ADDRESS_EVENT} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {ITTerminal} 
     */
    Terminal {
        get => this.get_Terminal()
    }

    /**
     * The get_Address method gets a pointer to the ITAddress object involved in an event.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface returned by <b>ITAddressEvent::get_Address</b>. The application must call <b>Release</b> on the 
     * <b>ITAddress</b> interface to free resources associated with it.
     * @returns {ITAddress} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressevent-get_address
     */
    get_Address() {
        result := ComCall(7, this, "ptr*", &ppAddress := 0, "HRESULT")
        return ITAddress(ppAddress)
    }

    /**
     * The get_Event method gets the ADDRESS_EVENT descriptor of an event.
     * @remarks
     * Certain events on PnP devices, such as AE_NEWTERMINAL and AE_REMOVETERMINAL, will not be received until after the first time static terminals are enumerated using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-enumeratestaticterminals">ITTerminalSupport::EnumerateStaticTerminals</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-get_staticterminals">ITTerminalSupport::get_StaticTerminals</a>.
     * @returns {ADDRESS_EVENT} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-address_event">ADDRESS_EVENT</a> descriptor of an event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    /**
     * The get_Terminal method gets a pointer to the ITTerminal interface associated with the event.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface returned by <b>ITAddressEvent::get_Terminal</b>. The application must call <b>Release</b> on the 
     * <b>ITTerminal</b> interface to free resources associated with it.
     * @returns {ITTerminal} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface, or <b>NULL</b> if the event does not refer to a terminal.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressevent-get_terminal
     */
    get_Terminal() {
        result := ComCall(9, this, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    Query(iid) {
        if (ITAddressEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Address := CallbackCreate(GetMethod(implObj, "get_Address"), flags, 2)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
        this.vtbl.get_Terminal := CallbackCreate(GetMethod(implObj, "get_Terminal"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Address)
        CallbackFree(this.vtbl.get_Event)
        CallbackFree(this.vtbl.get_Terminal)
    }
}
