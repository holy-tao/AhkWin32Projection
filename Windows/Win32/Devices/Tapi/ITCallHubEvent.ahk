#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallHub.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallHubEvent interface contains methods that retrieve the description of CallHub events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallhubevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallHubEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCallHubEvent
     * @type {Guid}
     */
    static IID => Guid("{a3c15451-5b92-11d1-8f4e-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Event", "get_CallHub", "get_Call"]

    /**
     * @type {Integer} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {ITCallHub} 
     */
    CallHub {
        get => this.get_CallHub()
    }

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * The get_Event method returns a pointer to a CALLHUB_EVENT enum description of the event that occurred.
     * @returns {Integer} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callhub_event">CALLHUB_EVENT</a> enum description of the event.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallhubevent-get_event
     */
    get_Event() {
        result := ComCall(7, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    /**
     * The get_CallHub method returns a pointer to the ITCallHub interface on which the event occurred.
     * @returns {ITCallHub} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallhub">ITCallHub</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallhubevent-get_callhub
     */
    get_CallHub() {
        result := ComCall(8, this, "ptr*", &ppCallHub := 0, "HRESULT")
        return ITCallHub(ppCallHub)
    }

    /**
     * The get_Call method returns a pointer to the ITCallInfo interface of the call on which the event occurred.
     * @returns {ITCallInfo} <b>ITCallInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallhubevent-get_call
     */
    get_Call() {
        result := ComCall(9, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }
}
