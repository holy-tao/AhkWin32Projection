#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBDA_DigitalDemodulator2.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_DigitalDemodulator3 extends IBDA_DigitalDemodulator2{
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
     * 
     * @param {Pointer<BDA_SIGNAL_TIMEOUTS>} pSignalTimeouts 
     * @returns {HRESULT} 
     */
    put_SignalTimeouts(pSignalTimeouts) {
        result := ComCall(25, this, "ptr", pSignalTimeouts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BDA_SIGNAL_TIMEOUTS>} pSignalTimeouts 
     * @returns {HRESULT} 
     */
    get_SignalTimeouts(pSignalTimeouts) {
        result := ComCall(26, this, "ptr", pSignalTimeouts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pPLPNumber 
     * @returns {HRESULT} 
     */
    put_PLPNumber(pPLPNumber) {
        result := ComCall(27, this, "uint*", pPLPNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pPLPNumber 
     * @returns {HRESULT} 
     */
    get_PLPNumber(pPLPNumber) {
        result := ComCall(28, this, "uint*", pPLPNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
