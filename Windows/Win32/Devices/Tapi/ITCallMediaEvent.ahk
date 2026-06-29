#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITTerminal.ahk" { ITTerminal }
#Import ".\CALL_MEDIA_EVENT.ahk" { CALL_MEDIA_EVENT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CALL_MEDIA_EVENT_CAUSE.ahk" { CALL_MEDIA_EVENT_CAUSE }
#Import ".\ITStream.ahk" { ITStream }
#Import ".\ITCallInfo.ahk" { ITCallInfo }

/**
 * The ITCallMediaEvent interface contains methods that retrieve the description of media events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itcallmediaevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITCallMediaEvent extends IDispatch {
    /**
     * The interface identifier for ITCallMediaEvent
     * @type {Guid}
     */
    static IID := Guid("{ff36b87f-ec3a-11d0-8ee4-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITCallMediaEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Call     : IntPtr
        get_Event    : IntPtr
        get_Error    : IntPtr
        get_Terminal : IntPtr
        get_Stream   : IntPtr
        get_Cause    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITCallMediaEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {CALL_MEDIA_EVENT} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {HRESULT} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * @type {ITTerminal} 
     */
    Terminal {
        get => this.get_Terminal()
    }

    /**
     * @type {ITStream} 
     */
    Stream {
        get => this.get_Stream()
    }

    /**
     * @type {CALL_MEDIA_EVENT_CAUSE} 
     */
    Cause {
        get => this.get_Cause()
    }

    /**
     * The get_Call method gets an ITCallInfo interface pointer for the call object associated with this event.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface returned by <b>ITCallMediaEvent::get_Call</b>. The application must call <b>Release</b> on 
     * <b>ITCallInfo</b> to free resources associated with it.
     * @returns {ITCallInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * The get_Event method gets the call media event indicator.
     * @remarks
     * Call media events are a crucial indicator of whether certain operations can be performed. For example, when 
     * <b>IVideoWindow</b> is exposed on the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/terminal-object">Terminal object</a>, until the CME_STREAM_ACTIVE is received only the 
     * <b>put_Visible</b> method will succeed. For more information about <b>IVideoWindow</b> and <b>put_Visible</b>, see the DirectX documentation.
     * @returns {CALL_MEDIA_EVENT} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event">CALL_MEDIA_EVENT</a> indicator.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pCallMediaEvent := 0, "HRESULT")
        return pCallMediaEvent
    }

    /**
     * The get_Error method gets the error associated with the media event, if any.
     * @returns {HRESULT} Pointer to error.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_error
     */
    get_Error() {
        result := ComCall(9, this, "int*", &phrError := 0, "HRESULT")
        return phrError
    }

    /**
     * The get_Terminal method gets the terminal associated with the event.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface returned by <b>ITCallMediaEvent::get_Terminal</b>. The application must call <b>Release</b> on 
     * <b>ITTerminal</b> to free resources associated with it.
     * @returns {ITTerminal} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_terminal
     */
    get_Terminal() {
        result := ComCall(10, this, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * The get_Stream method gets a pointer to the ITStream interface associated with the call media event.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface returned by <b>ITCallMediaEvent::get_Stream</b>. The application must call <b>Release</b> on 
     * <b>ITStream</b> to free resources associated with it.
     * @returns {ITStream} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_stream
     */
    get_Stream() {
        result := ComCall(11, this, "ptr*", &ppStream := 0, "HRESULT")
        return ITStream(ppStream)
    }

    /**
     * The get_Cause method gets the cause of the call media event, such as a timeout on the renderer device.
     * @returns {CALL_MEDIA_EVENT_CAUSE} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event_cause">CALL_MEDIA_EVENT_CAUSE</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_cause
     */
    get_Cause() {
        result := ComCall(12, this, "int*", &pCause := 0, "HRESULT")
        return pCause
    }

    Query(iid) {
        if (ITCallMediaEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
        this.vtbl.get_Error := CallbackCreate(GetMethod(implObj, "get_Error"), flags, 2)
        this.vtbl.get_Terminal := CallbackCreate(GetMethod(implObj, "get_Terminal"), flags, 2)
        this.vtbl.get_Stream := CallbackCreate(GetMethod(implObj, "get_Stream"), flags, 2)
        this.vtbl.get_Cause := CallbackCreate(GetMethod(implObj, "get_Cause"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_Event)
        CallbackFree(this.vtbl.get_Error)
        CallbackFree(this.vtbl.get_Terminal)
        CallbackFree(this.vtbl.get_Stream)
        CallbackFree(this.vtbl.get_Cause)
    }
}
