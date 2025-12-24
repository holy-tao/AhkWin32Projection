#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITTerminal interface is the base interface for a Terminal object.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itterminal
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTerminal extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITTerminal
     * @type {Guid}
     */
    static IID => Guid("{b1efc38a-9355-11d0-835c-00aa003ccabd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_State", "get_TerminalType", "get_TerminalClass", "get_MediaType", "get_Direction"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {Integer} 
     */
    TerminalType {
        get => this.get_TerminalType()
    }

    /**
     * @type {BSTR} 
     */
    TerminalClass {
        get => this.get_TerminalClass()
    }

    /**
     * @type {Integer} 
     */
    MediaType {
        get => this.get_MediaType()
    }

    /**
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * The get_Name method gets a descriptive name of the terminal. The name must be usable to the user.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing the name of the terminal.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminal-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(7, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * The get_State method gets the current state of the terminal.
     * @returns {Integer} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_state">TERMINAL_STATE</a> enum member.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminal-get_state
     */
    get_State() {
        result := ComCall(8, this, "int*", &pTerminalState := 0, "HRESULT")
        return pTerminalState
    }

    /**
     * The get_TerminalType method gets the TERMINAL_TYPE of the terminal.
     * @returns {Integer} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_type">TERMINAL_TYPE</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminal-get_terminaltype
     */
    get_TerminalType() {
        result := ComCall(9, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * The get_TerminalClass method gets the Terminal Class of the terminal.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/terminal-class">Terminal Class</a> of the terminal.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminal-get_terminalclass
     */
    get_TerminalClass() {
        ppTerminalClass := BSTR()
        result := ComCall(10, this, "ptr", ppTerminalClass, "HRESULT")
        return ppTerminalClass
    }

    /**
     * The get_MediaType method determines the media that this terminal supports.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminal-get_mediatype
     */
    get_MediaType() {
        result := ComCall(11, this, "int*", &plMediaType := 0, "HRESULT")
        return plMediaType
    }

    /**
     * The get_Direction method gets a TERMINAL_DIRECTION descriptor of the media stream direction for the terminal.
     * @returns {Integer} <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor of the media stream direction for the terminal.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminal-get_direction
     */
    get_Direction() {
        result := ComCall(12, this, "int*", &pDirection := 0, "HRESULT")
        return pDirection
    }
}
