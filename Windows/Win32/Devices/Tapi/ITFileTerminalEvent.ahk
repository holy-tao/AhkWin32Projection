#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TERMINAL_MEDIA_STATE.ahk" { TERMINAL_MEDIA_STATE }
#Import ".\ITFileTrack.ahk" { ITFileTrack }
#Import ".\ITTerminal.ahk" { ITTerminal }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FT_STATE_EVENT_CAUSE.ahk" { FT_STATE_EVENT_CAUSE }
#Import ".\ITCallInfo.ahk" { ITCallInfo }

/**
 * The ITFileTerminalEvent interface contains methods that retrieve the description of file terminal events that have occurred.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itfileterminalevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITFileTerminalEvent extends IDispatch {
    /**
     * The interface identifier for ITFileTerminalEvent
     * @type {Guid}
     */
    static IID := Guid("{e4a7fbac-8c17-4427-9f55-9f589ac8af00}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITFileTerminalEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Terminal : IntPtr
        get_Track    : IntPtr
        get_Call     : IntPtr
        get_State    : IntPtr
        get_Cause    : IntPtr
        get_Error    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITFileTerminalEvent.Vtbl()
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
     * @type {TERMINAL_MEDIA_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {FT_STATE_EVENT_CAUSE} 
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
     * The get_Terminal method returns the file terminal that generated this event.
     * @returns {ITTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_terminal
     */
    get_Terminal() {
        result := ComCall(7, this, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * The get_Track method returns the track terminal that generated this event.
     * @returns {ITFileTrack} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itfiletrack">ITFileTrack</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_track
     */
    get_Track() {
        result := ComCall(8, this, "ptr*", &ppTrackTerminal := 0, "HRESULT")
        return ITFileTrack(ppTrackTerminal)
    }

    /**
     * The get_Call method gets a pointer to the call information interface for the call on which the event has occurred. (ITFileTerminalEvent.get_Call)
     * @remarks
     * When a terminal must generate an event, it requires a selected track in order to pass the event to an MSP which will then pass it to the application through TAPI. The first track that accepts the task of sending the event will be used. If the terminal has more than one track and the tracks are selected onto streams that belong to different calls, the call object pointer eventually returned could be for any of those calls.
     * @returns {ITCallInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_call
     */
    get_Call() {
        result := ComCall(9, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * The get_State method gets information on the new file terminal state.
     * @returns {TERMINAL_MEDIA_STATE} <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_media_state">TERMINAL_MEDIA_STATE</a> descriptor of the new terminal state.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_state
     */
    get_State() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The get_Cause method gets the cause associated with this event. (ITFileTerminalEvent.get_Cause)
     * @returns {FT_STATE_EVENT_CAUSE} <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-ft_state_event_cause">FT_STATE_EVENT_CAUSE</a> descriptor of the cause of this event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_cause
     */
    get_Cause() {
        result := ComCall(11, this, "int*", &pCause := 0, "HRESULT")
        return pCause
    }

    /**
     * The get_Error method gets the error code for the event.
     * @returns {HRESULT} HRESULT cast of error code associated with this event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_error
     */
    get_Error() {
        result := ComCall(12, this, "int*", &phrErrorCode := 0, "HRESULT")
        return phrErrorCode
    }

    Query(iid) {
        if (ITFileTerminalEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Terminal := CallbackCreate(GetMethod(implObj, "get_Terminal"), flags, 2)
        this.vtbl.get_Track := CallbackCreate(GetMethod(implObj, "get_Track"), flags, 2)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_Cause := CallbackCreate(GetMethod(implObj, "get_Cause"), flags, 2)
        this.vtbl.get_Error := CallbackCreate(GetMethod(implObj, "get_Error"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Terminal)
        CallbackFree(this.vtbl.get_Track)
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_Cause)
        CallbackFree(this.vtbl.get_Error)
    }
}
