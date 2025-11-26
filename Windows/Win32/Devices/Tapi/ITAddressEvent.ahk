#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITAddress.ahk
#Include .\ITTerminal.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAddressEvent interface contains methods that retrieve the description of address events.
 * @remarks
 * 
 * Certain events on PnP devices will not be received until after the first time static terminals are enumerated using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-enumeratestaticterminals">ITTerminalSupport::EnumerateStaticTerminals</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-get_staticterminals">ITTerminalSupport::get_StaticTerminals</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itaddressevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAddressEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAddressEvent
     * @type {Guid}
     */
    static IID => Guid("{831ce2d1-83b5-11d1-bb5c-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Address", "get_Event", "get_Terminal"]

    /**
     * @type {ITAddress} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * @type {Integer} 
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
     * @returns {ITAddress} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddressevent-get_address
     */
    get_Address() {
        result := ComCall(7, this, "ptr*", &ppAddress := 0, "HRESULT")
        return ITAddress(ppAddress)
    }

    /**
     * The get_Event method gets the ADDRESS_EVENT descriptor of an event.
     * @returns {Integer} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-address_event">ADDRESS_EVENT</a> descriptor of an event.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddressevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    /**
     * The get_Terminal method gets a pointer to the ITTerminal interface associated with the event.
     * @returns {ITTerminal} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface, or <b>NULL</b> if the event does not refer to a terminal.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddressevent-get_terminal
     */
    get_Terminal() {
        result := ComCall(9, this, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }
}
