#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBDA_DigitalDemodulator2.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_DigitalDemodulator3 extends IBDA_DigitalDemodulator2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_DigitalDemodulator3
     * @type {Guid}
     */
    static IID => Guid("{13f19604-7d32-4359-93a2-a05205d90ac9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_SignalTimeouts", "get_SignalTimeouts", "put_PLPNumber", "get_PLPNumber"]

    /**
     */
    SignalTimeouts {
        get => this.get_SignalTimeouts()
        set => this.put_SignalTimeouts(value)
    }

    /**
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
        result := ComCall(25, this, "ptr", pSignalTimeouts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BDA_SIGNAL_TIMEOUTS>} pSignalTimeouts 
     * @returns {HRESULT} 
     */
    get_SignalTimeouts(pSignalTimeouts) {
        result := ComCall(26, this, "ptr", pSignalTimeouts, "HRESULT")
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
}
