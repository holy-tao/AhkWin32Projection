#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallInfoChangeEvent interface contains methods that retrieve the description of call information change events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallinfochangeevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallInfoChangeEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCallInfoChangeEvent
     * @type {Guid}
     */
    static IID => Guid("{5d4b65f9-e51c-11d1-a02f-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_Cause", "get_CallbackInstance"]

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {Integer} 
     */
    Cause {
        get => this.get_Cause()
    }

    /**
     * @type {Integer} 
     */
    CallbackInstance {
        get => this.get_CallbackInstance()
    }

    /**
     * The get_Call method returns the ITCallInfo interface on which call information has changed.
     * @returns {ITCallInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface on which information has changed.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfochangeevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * The get_Cause method gets a CALLINFOCHANGE_CAUSE description of the change.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callinfochange_cause">CALLINFOCHANGE_CAUSE</a> description of the call event that has occurred.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfochangeevent-get_cause
     */
    get_Cause() {
        result := ComCall(8, this, "int*", &pCIC := 0, "HRESULT")
        return pCIC
    }

    /**
     * The get_CallbackInstance method gets a pointer to the callback instance associated with this event.
     * @returns {Integer} Pointer to callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfochangeevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(9, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }
}
