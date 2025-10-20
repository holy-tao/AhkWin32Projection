#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBDA_DigitalDemodulator.ahk

/**
 * Controls a Broadcast Driver Architecture (BDA) demodulator filter. Demodulation filters for Digital Video Broadcasting-Satellite version 2 (DVB-S2) implement this interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DigitalDemodulator2)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_digitaldemodulator2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_DigitalDemodulator2 extends IBDA_DigitalDemodulator{
    /**
     * The interface identifier for IBDA_DigitalDemodulator2
     * @type {Guid}
     */
    static IID => Guid("{525ed3ee-5cf3-4e1e-9a06-5368a84f9a6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * 
     * @param {Pointer<Int32>} pGuardInterval 
     * @returns {HRESULT} 
     */
    put_GuardInterval(pGuardInterval) {
        result := ComCall(17, this, "int*", pGuardInterval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pGuardInterval 
     * @returns {HRESULT} 
     */
    get_GuardInterval(pGuardInterval) {
        result := ComCall(18, this, "int*", pGuardInterval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTransmissionMode 
     * @returns {HRESULT} 
     */
    put_TransmissionMode(pTransmissionMode) {
        result := ComCall(19, this, "int*", pTransmissionMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTransmissionMode 
     * @returns {HRESULT} 
     */
    get_TransmissionMode(pTransmissionMode) {
        result := ComCall(20, this, "int*", pTransmissionMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRollOff 
     * @returns {HRESULT} 
     */
    put_RollOff(pRollOff) {
        result := ComCall(21, this, "int*", pRollOff, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRollOff 
     * @returns {HRESULT} 
     */
    get_RollOff(pRollOff) {
        result := ComCall(22, this, "int*", pRollOff, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPilot 
     * @returns {HRESULT} 
     */
    put_Pilot(pPilot) {
        result := ComCall(23, this, "int*", pPilot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPilot 
     * @returns {HRESULT} 
     */
    get_Pilot(pPilot) {
        result := ComCall(24, this, "int*", pPilot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
