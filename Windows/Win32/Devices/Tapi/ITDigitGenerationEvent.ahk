#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }

/**
 * The ITDigitGenerationEvent interface contains methods that describe digit generation events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itdigitgenerationevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITDigitGenerationEvent extends IDispatch {
    /**
     * The interface identifier for ITDigitGenerationEvent
     * @type {Guid}
     */
    static IID := Guid("{80d3bfad-57d9-11d2-a04a-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITDigitGenerationEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Call                  : IntPtr
        get_GenerationTermination : IntPtr
        get_TickCount             : IntPtr
        get_CallbackInstance      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITDigitGenerationEvent.Vtbl()
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitgenerationevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * The get_GenerationTermination method gets the digit or digits that indicate the end of the generated digit series.
     * @returns {Integer} Pointer to digit or digits that indicate the end of the generated digit series.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitgenerationevent-get_generationtermination
     */
    get_GenerationTermination() {
        result := ComCall(8, this, "int*", &plGenerationTermination := 0, "HRESULT")
        return plGenerationTermination
    }

    /**
     * The get_TickCount method gets the &quot;tick count&quot; (number of milliseconds since Windows started) at which the digit generation completed.
     * @returns {Integer} Pointer to tick count.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitgenerationevent-get_tickcount
     */
    get_TickCount() {
        result := ComCall(9, this, "int*", &plTickCount := 0, "HRESULT")
        return plTickCount
    }

    /**
     * The get_CallbackInstance method gets a pointer to the callback instance associated with the event. (ITDigitGenerationEvent.get_CallbackInstance)
     * @returns {Integer} Pointer to the callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitgenerationevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(10, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }

    Query(iid) {
        if (ITDigitGenerationEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_GenerationTermination := CallbackCreate(GetMethod(implObj, "get_GenerationTermination"), flags, 2)
        this.vtbl.get_TickCount := CallbackCreate(GetMethod(implObj, "get_TickCount"), flags, 2)
        this.vtbl.get_CallbackInstance := CallbackCreate(GetMethod(implObj, "get_CallbackInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_GenerationTermination)
        CallbackFree(this.vtbl.get_TickCount)
        CallbackFree(this.vtbl.get_CallbackInstance)
    }
}
