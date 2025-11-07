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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_GuardInterval", "get_GuardInterval", "put_TransmissionMode", "get_TransmissionMode", "put_RollOff", "get_RollOff", "put_Pilot", "get_Pilot"]

    /**
     * 
     * @param {Pointer<Integer>} pGuardInterval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-put_guardinterval
     */
    put_GuardInterval(pGuardInterval) {
        pGuardIntervalMarshal := pGuardInterval is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pGuardIntervalMarshal, pGuardInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pGuardInterval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-get_guardinterval
     */
    get_GuardInterval(pGuardInterval) {
        pGuardIntervalMarshal := pGuardInterval is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pGuardIntervalMarshal, pGuardInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTransmissionMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-put_transmissionmode
     */
    put_TransmissionMode(pTransmissionMode) {
        pTransmissionModeMarshal := pTransmissionMode is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pTransmissionModeMarshal, pTransmissionMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTransmissionMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-get_transmissionmode
     */
    get_TransmissionMode(pTransmissionMode) {
        pTransmissionModeMarshal := pTransmissionMode is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pTransmissionModeMarshal, pTransmissionMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRollOff 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-put_rolloff
     */
    put_RollOff(pRollOff) {
        pRollOffMarshal := pRollOff is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pRollOffMarshal, pRollOff, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRollOff 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-get_rolloff
     */
    get_RollOff(pRollOff) {
        pRollOffMarshal := pRollOff is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pRollOffMarshal, pRollOff, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPilot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-put_pilot
     */
    put_Pilot(pPilot) {
        pPilotMarshal := pPilot is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, pPilotMarshal, pPilot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPilot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-get_pilot
     */
    get_Pilot(pPilot) {
        pPilotMarshal := pPilot is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pPilotMarshal, pPilot, "HRESULT")
        return result
    }
}
