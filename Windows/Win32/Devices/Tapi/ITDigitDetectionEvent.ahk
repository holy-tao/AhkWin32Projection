#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }

/**
 * The ITDigitDetectionEvent interface contains methods that retrieve the description of DTMF digit events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itdigitdetectionevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITDigitDetectionEvent extends IDispatch {
    /**
     * The interface identifier for ITDigitDetectionEvent
     * @type {Guid}
     */
    static IID := Guid("{80d3bfac-57d9-11d2-a04a-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITDigitDetectionEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Call             : IntPtr
        get_Digit            : IntPtr
        get_DigitMode        : IntPtr
        get_TickCount        : IntPtr
        get_CallbackInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITDigitDetectionEvent.Vtbl()
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
     * @type {Integer} 
     */
    Digit {
        get => this.get_Digit()
    }

    /**
     * @type {Integer} 
     */
    DigitMode {
        get => this.get_DigitMode()
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
     * The get_Call method gets a pointer to the ITCallInfo interface for the call on which the event occurred.
     * @returns {ITCallInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * The get_Digit method retrieves an unsigned char pointer to the digit that was detected.
     * @returns {Integer} Pointer to the digit.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_digit
     */
    get_Digit() {
        result := ComCall(8, this, "char*", &pucDigit := 0, "HRESULT")
        return pucDigit
    }

    /**
     * The get_DigitMode method gets the indicator of the line digit mode, such as LINEDIGITMODE_DTMF.
     * @returns {Integer} Pointer to indicator of digit mode.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_digitmode
     */
    get_DigitMode() {
        result := ComCall(9, this, "int*", &pDigitMode := 0, "HRESULT")
        return pDigitMode
    }

    /**
     * The get_TickCount method gets the &quot;tick count&quot; (number of milliseconds since Windows started) at which the digit gathering completed.
     * @returns {Integer} Pointer to tick count.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_tickcount
     */
    get_TickCount() {
        result := ComCall(10, this, "int*", &plTickCount := 0, "HRESULT")
        return plTickCount
    }

    /**
     * The get_CallbackInstance method gets a pointer to the callback instance associated with the event. (ITDigitDetectionEvent.get_CallbackInstance)
     * @returns {Integer} Pointer to the callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(11, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }

    Query(iid) {
        if (ITDigitDetectionEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_Digit := CallbackCreate(GetMethod(implObj, "get_Digit"), flags, 2)
        this.vtbl.get_DigitMode := CallbackCreate(GetMethod(implObj, "get_DigitMode"), flags, 2)
        this.vtbl.get_TickCount := CallbackCreate(GetMethod(implObj, "get_TickCount"), flags, 2)
        this.vtbl.get_CallbackInstance := CallbackCreate(GetMethod(implObj, "get_CallbackInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_Digit)
        CallbackFree(this.vtbl.get_DigitMode)
        CallbackFree(this.vtbl.get_TickCount)
        CallbackFree(this.vtbl.get_CallbackInstance)
    }
}
