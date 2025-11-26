#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDigitsGatheredEvent interface exposes methods that allow an application to retrieve data when the TAPI Server sends an event indicating that the Server has gathered digits required by the application.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itdigitsgatheredevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDigitsGatheredEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDigitsGatheredEvent
     * @type {Guid}
     */
    static IID => Guid("{e52ec4c1-cba3-441a-9e6a-93cb909e9724}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_Digits", "get_GatherTermination", "get_TickCount", "get_CallbackInstance"]

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {BSTR} 
     */
    Digits {
        get => this.get_Digits()
    }

    /**
     * @type {Integer} 
     */
    GatherTermination {
        get => this.get_GatherTermination()
    }

    /**
     * @type {Integer} 
     */
    TickCount {
        get => this.get_TickCount()
    }

    /**
     * @type {Integer} 
     */
    CallbackInstance {
        get => this.get_CallbackInstance()
    }

    /**
     * The get_Call method gets a pointer to the call information interface for the call object on which the event occurred.
     * @returns {ITCallInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdigitsgatheredevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * The get_Digits method gets the gathered digits for the call.
     * @returns {BSTR} Pointer to a <b>BSTR</b> where the gathered digits are stored.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdigitsgatheredevent-get_digits
     */
    get_Digits() {
        ppDigits := BSTR()
        result := ComCall(8, this, "ptr", ppDigits, "HRESULT")
        return ppDigits
    }

    /**
     * The get_GatherTermination method gets the reason why the TAPI Server terminated the gathering of digits on the call.
     * @returns {Integer} Pointer to a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-tapi_gatherterm">TAPI_GATHERTERM</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdigitsgatheredevent-get_gathertermination
     */
    get_GatherTermination() {
        result := ComCall(9, this, "int*", &pGatherTermination := 0, "HRESULT")
        return pGatherTermination
    }

    /**
     * The get_TickCount method gets the &quot;tick count&quot; (the number of milliseconds since Windows started) at which digit-gathering completed.
     * @returns {Integer} Pointer to a value to receive the tick count.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdigitsgatheredevent-get_tickcount
     */
    get_TickCount() {
        result := ComCall(10, this, "int*", &plTickCount := 0, "HRESULT")
        return plTickCount
    }

    /**
     * The get_CallbackInstance method gets a pointer to the application's callback function that will process the event.
     * @returns {Integer} Pointer to the callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdigitsgatheredevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(11, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }
}
