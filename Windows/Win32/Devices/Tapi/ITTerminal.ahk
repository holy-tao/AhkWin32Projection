#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TERMINAL_STATE.ahk" { TERMINAL_STATE }
#Import ".\TERMINAL_DIRECTION.ahk" { TERMINAL_DIRECTION }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TERMINAL_TYPE.ahk" { TERMINAL_TYPE }

/**
 * The ITTerminal interface is the base interface for a Terminal object.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itterminal
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITTerminal extends IDispatch {
    /**
     * The interface identifier for ITTerminal
     * @type {Guid}
     */
    static IID := Guid("{b1efc38a-9355-11d0-835c-00aa003ccabd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITTerminal interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name          : IntPtr
        get_State         : IntPtr
        get_TerminalType  : IntPtr
        get_TerminalClass : IntPtr
        get_MediaType     : IntPtr
        get_Direction     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITTerminal.Vtbl()
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
     * @type {TERMINAL_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {TERMINAL_TYPE} 
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
     * @type {TERMINAL_DIRECTION} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * The get_Name method gets a descriptive name of the terminal. The name must be usable to the user.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppName</i> parameter.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing the name of the terminal.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_name
     */
    get_Name() {
        ppName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, ppName, "HRESULT")
        return ppName
    }

    /**
     * The get_State method gets the current state of the terminal.
     * @returns {TERMINAL_STATE} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_state">TERMINAL_STATE</a> enum member.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_state
     */
    get_State() {
        result := ComCall(8, this, "int*", &pTerminalState := 0, "HRESULT")
        return pTerminalState
    }

    /**
     * The get_TerminalType method gets the TERMINAL_TYPE of the terminal.
     * @returns {TERMINAL_TYPE} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_type">TERMINAL_TYPE</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_terminaltype
     */
    get_TerminalType() {
        result := ComCall(9, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * The get_TerminalClass method gets the Terminal Class of the terminal.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppTerminalClass</i> parameter.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/terminal-class">Terminal Class</a> of the terminal.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_terminalclass
     */
    get_TerminalClass() {
        ppTerminalClass := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, ppTerminalClass, "HRESULT")
        return ppTerminalClass
    }

    /**
     * The get_MediaType method determines the media that this terminal supports.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_mediatype
     */
    get_MediaType() {
        result := ComCall(11, this, "int*", &plMediaType := 0, "HRESULT")
        return plMediaType
    }

    /**
     * The get_Direction method gets a TERMINAL_DIRECTION descriptor of the media stream direction for the terminal.
     * @returns {TERMINAL_DIRECTION} <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor of the media stream direction for the terminal.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_direction
     */
    get_Direction() {
        result := ComCall(12, this, "int*", &pDirection := 0, "HRESULT")
        return pDirection
    }

    Query(iid) {
        if (ITTerminal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_TerminalType := CallbackCreate(GetMethod(implObj, "get_TerminalType"), flags, 2)
        this.vtbl.get_TerminalClass := CallbackCreate(GetMethod(implObj, "get_TerminalClass"), flags, 2)
        this.vtbl.get_MediaType := CallbackCreate(GetMethod(implObj, "get_MediaType"), flags, 2)
        this.vtbl.get_Direction := CallbackCreate(GetMethod(implObj, "get_Direction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_TerminalType)
        CallbackFree(this.vtbl.get_TerminalClass)
        CallbackFree(this.vtbl.get_MediaType)
        CallbackFree(this.vtbl.get_Direction)
    }
}
