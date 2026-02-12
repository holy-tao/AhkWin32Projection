#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITToneDetectionEvent interface exposes methods that allow an application to retrieve information about a tone detection event.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nn-tapi3if-ittonedetectionevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITToneDetectionEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITToneDetectionEvent
     * @type {Guid}
     */
    static IID => Guid("{407e0faf-d047-4753-b0c6-8e060373fecd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_AppSpecific", "get_TickCount", "get_CallbackInstance"]

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {Integer} 
     */
    AppSpecific {
        get => this.get_AppSpecific()
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
     * The get_Call method gets a pointer to the call information interface for the call object on which the tone detection event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface returned by <b>ITToneDetectionEvent::get_Call</b>. The application must call <b>Release</b> on the 
     * <b>ITCallInfo</b> interface to free resources associated with it.
     * @returns {ITCallInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-ittonedetectionevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITCallInfo(ppCallInfo)
    }

    /**
     * The get_AppSpecific method gets the application-defined tag that identifies the tone associated with the tone detection event.
     * @returns {Integer} Pointer to a value to receive the application-specific identifier for the tone, as defined in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itdetecttone">ITDetectTone</a> object or in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linemonitortone">LINEMONITORTONE</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-ittonedetectionevent-get_appspecific
     */
    get_AppSpecific() {
        result := ComCall(8, this, "int*", &plAppSpecific := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plAppSpecific
    }

    /**
     * The get_TickCount method gets the &quot;tick count&quot; (the number of milliseconds since Windows started) at which the tone was detected.
     * @returns {Integer} Pointer to a value to receive the tick count.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-ittonedetectionevent-get_tickcount
     */
    get_TickCount() {
        result := ComCall(9, this, "int*", &plTickCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plTickCount
    }

    /**
     * The get_CallbackInstance method gets a pointer to the application's callback function that will process the event. (ITToneDetectionEvent.get_CallbackInstance)
     * @returns {Integer} Pointer to the callback instance returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-ittonedetectionevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(10, this, "int*", &plCallbackInstance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCallbackInstance
    }
}
