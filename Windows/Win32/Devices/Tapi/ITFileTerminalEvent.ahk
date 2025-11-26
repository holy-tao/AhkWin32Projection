#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITTerminal.ahk
#Include .\ITFileTrack.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITFileTerminalEvent interface contains methods that retrieve the description of file terminal events that have occurred.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itfileterminalevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITFileTerminalEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITFileTerminalEvent
     * @type {Guid}
     */
    static IID => Guid("{e4a7fbac-8c17-4427-9f55-9f589ac8af00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Terminal", "get_Track", "get_Call", "get_State", "get_Cause", "get_Error"]

    /**
     * @type {ITTerminal} 
     */
    Terminal {
        get => this.get_Terminal()
    }

    /**
     * @type {ITFileTrack} 
     */
    Track {
        get => this.get_Track()
    }

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
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
    Cause {
        get => this.get_Cause()
    }

    /**
     * @type {HRESULT} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * 
     * @returns {ITTerminal} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_terminal
     */
    get_Terminal() {
        result := ComCall(7, this, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * 
     * @returns {ITFileTrack} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_track
     */
    get_Track() {
        result := ComCall(8, this, "ptr*", &ppTrackTerminal := 0, "HRESULT")
        return ITFileTrack(ppTrackTerminal)
    }

    /**
     * 
     * @returns {ITCallInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_call
     */
    get_Call() {
        result := ComCall(9, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_state
     */
    get_State() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_cause
     */
    get_Cause() {
        result := ComCall(11, this, "int*", &pCause := 0, "HRESULT")
        return pCause
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_error
     */
    get_Error() {
        result := ComCall(12, this, "int*", &phrErrorCode := 0, "HRESULT")
        return phrErrorCode
    }
}
