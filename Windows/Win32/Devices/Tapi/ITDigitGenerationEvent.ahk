#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDigitGenerationEvent interface contains methods that describe digit generation events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itdigitgenerationevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDigitGenerationEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDigitGenerationEvent
     * @type {Guid}
     */
    static IID => Guid("{80d3bfad-57d9-11d2-a04a-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_GenerationTermination", "get_TickCount", "get_CallbackInstance"]

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {Integer} 
     */
    GenerationTermination {
        get => this.get_GenerationTermination()
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
     * The get_Call method returns an ITCallInfo interface pointer for the call on which the event is required.
     * @returns {ITCallInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdigitgenerationevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * The get_GenerationTermination method gets the digit or digits that indicate the end of the generated digit series.
     * @returns {Integer} Pointer to digit or digits that indicate the end of the generated digit series.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdigitgenerationevent-get_generationtermination
     */
    get_GenerationTermination() {
        result := ComCall(8, this, "int*", &plGenerationTermination := 0, "HRESULT")
        return plGenerationTermination
    }

    /**
     * The get_TickCount method gets the &quot;tick count&quot; (number of milliseconds since Windows started) at which the digit generation completed.
     * @returns {Integer} Pointer to tick count.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdigitgenerationevent-get_tickcount
     */
    get_TickCount() {
        result := ComCall(9, this, "int*", &plTickCount := 0, "HRESULT")
        return plTickCount
    }

    /**
     * The get_CallbackInstance method gets a pointer to the callback instance associated with the event.
     * @returns {Integer} Pointer to the callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itdigitgenerationevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(10, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }
}
