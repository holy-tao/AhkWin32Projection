#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include .\ITTerminal.ahk
#Include .\ITStream.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallMediaEvent interface contains methods that retrieve the description of media events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallmediaevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallMediaEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCallMediaEvent
     * @type {Guid}
     */
    static IID => Guid("{ff36b87f-ec3a-11d0-8ee4-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_Event", "get_Error", "get_Terminal", "get_Stream", "get_Cause"]

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {Integer} 
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
     * @type {Integer} 
     */
    Cause {
        get => this.get_Cause()
    }

    /**
     * The get_Call method gets an ITCallInfo interface pointer for the call object associated with this event.
     * @returns {ITCallInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallmediaevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * The get_Event method gets the call media event indicator.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event">CALL_MEDIA_EVENT</a> indicator.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallmediaevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pCallMediaEvent := 0, "HRESULT")
        return pCallMediaEvent
    }

    /**
     * The get_Error method gets the error associated with the media event, if any.
     * @returns {HRESULT} Pointer to error.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallmediaevent-get_error
     */
    get_Error() {
        result := ComCall(9, this, "int*", &phrError := 0, "HRESULT")
        return phrError
    }

    /**
     * The get_Terminal method gets the terminal associated with the event.
     * @returns {ITTerminal} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallmediaevent-get_terminal
     */
    get_Terminal() {
        result := ComCall(10, this, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * The get_Stream method gets a pointer to the ITStream interface associated with the call media event.
     * @returns {ITStream} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallmediaevent-get_stream
     */
    get_Stream() {
        result := ComCall(11, this, "ptr*", &ppStream := 0, "HRESULT")
        return ITStream(ppStream)
    }

    /**
     * The get_Cause method gets the cause of the call media event, such as a timeout on the renderer device.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_media_event_cause">CALL_MEDIA_EVENT_CAUSE</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallmediaevent-get_cause
     */
    get_Cause() {
        result := ComCall(12, this, "int*", &pCause := 0, "HRESULT")
        return pCause
    }
}
