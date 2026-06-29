#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BDA_SIGNAL_TIMEOUTS.ahk" { BDA_SIGNAL_TIMEOUTS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBDA_DigitalDemodulator2.ahk" { IBDA_DigitalDemodulator2 }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_DigitalDemodulator3 extends IBDA_DigitalDemodulator2 {
    /**
     * The interface identifier for IBDA_DigitalDemodulator3
     * @type {Guid}
     */
    static IID := Guid("{13f19604-7d32-4359-93a2-a05205d90ac9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_DigitalDemodulator3 interfaces
    */
    struct Vtbl extends IBDA_DigitalDemodulator2.Vtbl {
        put_SignalTimeouts : IntPtr
        get_SignalTimeouts : IntPtr
        put_PLPNumber      : IntPtr
        get_PLPNumber      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_DigitalDemodulator3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BDA_SIGNAL_TIMEOUTS} 
     */
    SignalTimeouts {
        get => this.get_SignalTimeouts()
        set => this.put_SignalTimeouts(value)
    }

    /**
     * @type {Integer} 
     */
    PLPNumber {
        get => this.get_PLPNumber()
        set => this.put_PLPNumber(value)
    }

    /**
     * 
     * @param {Pointer<BDA_SIGNAL_TIMEOUTS>} pSignalTimeouts 
     * @returns {HRESULT} 
     */
    put_SignalTimeouts(pSignalTimeouts) {
        result := ComCall(25, this, BDA_SIGNAL_TIMEOUTS.Ptr, pSignalTimeouts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BDA_SIGNAL_TIMEOUTS>} pSignalTimeouts 
     * @returns {HRESULT} 
     */
    get_SignalTimeouts(pSignalTimeouts) {
        result := ComCall(26, this, BDA_SIGNAL_TIMEOUTS.Ptr, pSignalTimeouts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPLPNumber 
     * @returns {HRESULT} 
     */
    put_PLPNumber(pPLPNumber) {
        pPLPNumberMarshal := pPLPNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(27, this, pPLPNumberMarshal, pPLPNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPLPNumber 
     * @returns {HRESULT} 
     */
    get_PLPNumber(pPLPNumber) {
        pPLPNumberMarshal := pPLPNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, pPLPNumberMarshal, pPLPNumber, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_DigitalDemodulator3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_SignalTimeouts := CallbackCreate(GetMethod(implObj, "put_SignalTimeouts"), flags, 2)
        this.vtbl.get_SignalTimeouts := CallbackCreate(GetMethod(implObj, "get_SignalTimeouts"), flags, 2)
        this.vtbl.put_PLPNumber := CallbackCreate(GetMethod(implObj, "put_PLPNumber"), flags, 2)
        this.vtbl.get_PLPNumber := CallbackCreate(GetMethod(implObj, "get_PLPNumber"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_SignalTimeouts)
        CallbackFree(this.vtbl.get_SignalTimeouts)
        CallbackFree(this.vtbl.put_PLPNumber)
        CallbackFree(this.vtbl.get_PLPNumber)
    }
}
