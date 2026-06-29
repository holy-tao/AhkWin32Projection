#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TransmissionMode.ahk" { TransmissionMode }
#Import ".\IBDA_DigitalDemodulator.ahk" { IBDA_DigitalDemodulator }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GuardInterval.ahk" { GuardInterval }
#Import ".\Pilot.ahk" { Pilot }
#Import ".\RollOff.ahk" { RollOff }

/**
 * Controls a Broadcast Driver Architecture (BDA) demodulator filter. Demodulation filters for Digital Video Broadcasting-Satellite version 2 (DVB-S2) implement this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DigitalDemodulator2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_digitaldemodulator2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_DigitalDemodulator2 extends IBDA_DigitalDemodulator {
    /**
     * The interface identifier for IBDA_DigitalDemodulator2
     * @type {Guid}
     */
    static IID := Guid("{525ed3ee-5cf3-4e1e-9a06-5368a84f9a6e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_DigitalDemodulator2 interfaces
    */
    struct Vtbl extends IBDA_DigitalDemodulator.Vtbl {
        put_GuardInterval    : IntPtr
        get_GuardInterval    : IntPtr
        put_TransmissionMode : IntPtr
        get_TransmissionMode : IntPtr
        put_RollOff          : IntPtr
        get_RollOff          : IntPtr
        put_Pilot            : IntPtr
        get_Pilot            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_DigitalDemodulator2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {GuardInterval} 
     */
    GuardInterval {
        get => this.get_GuardInterval()
        set => this.put_GuardInterval(value)
    }

    /**
     * @type {TransmissionMode} 
     */
    TransmissionMode {
        get => this.get_TransmissionMode()
        set => this.put_TransmissionMode(value)
    }

    /**
     * @type {RollOff} 
     */
    RollOff {
        get => this.get_RollOff()
        set => this.put_RollOff(value)
    }

    /**
     * @type {Pilot} 
     */
    Pilot {
        get => this.get_Pilot()
        set => this.put_Pilot(value)
    }

    /**
     * Sets the demodulator's guard interval.
     * @param {Pointer<GuardInterval>} pGuardInterval Pointer to a variable that contains the guard interval, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/guardinterval">GuardInterval</a> enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-put_guardinterval
     */
    put_GuardInterval(pGuardInterval) {
        pGuardIntervalMarshal := pGuardInterval is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pGuardIntervalMarshal, pGuardInterval, "HRESULT")
        return result
    }

    /**
     * Gets the demodulator's guard interval.
     * @param {Pointer<GuardInterval>} pGuardInterval Receives the guard interval, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/guardinterval">GuardInterval</a> enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-get_guardinterval
     */
    get_GuardInterval(pGuardInterval) {
        pGuardIntervalMarshal := pGuardInterval is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pGuardIntervalMarshal, pGuardInterval, "HRESULT")
        return result
    }

    /**
     * Sets the demodulator's transmission mode.
     * @param {Pointer<TransmissionMode>} pTransmissionMode Pointer to a variable that contains the transmission mode, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/transmissionmode">TransmissionMode</a> enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-put_transmissionmode
     */
    put_TransmissionMode(pTransmissionMode) {
        pTransmissionModeMarshal := pTransmissionMode is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pTransmissionModeMarshal, pTransmissionMode, "HRESULT")
        return result
    }

    /**
     * Gets the demodulator's transmission mode.
     * @param {Pointer<TransmissionMode>} pTransmissionMode Receives the transmission mode, specified as a member of the <b>TransmissionMode</b> enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-get_transmissionmode
     */
    get_TransmissionMode(pTransmissionMode) {
        pTransmissionModeMarshal := pTransmissionMode is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pTransmissionModeMarshal, pTransmissionMode, "HRESULT")
        return result
    }

    /**
     * Sets the demodulator's roll-off factor.
     * @param {Pointer<RollOff>} pRollOff Pointer to a variable that contains the roll-off factor, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/rolloff">RollOff</a> enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-put_rolloff
     */
    put_RollOff(pRollOff) {
        pRollOffMarshal := pRollOff is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pRollOffMarshal, pRollOff, "HRESULT")
        return result
    }

    /**
     * Gets the demodulator's roll-off factor.
     * @param {Pointer<RollOff>} pRollOff Receives the roll-off factor, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/rolloff">RollOff</a> enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-get_rolloff
     */
    get_RollOff(pRollOff) {
        pRollOffMarshal := pRollOff is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pRollOffMarshal, pRollOff, "HRESULT")
        return result
    }

    /**
     * Sets the current pilot mode for Digital Video Broadcasting-S2 (DVB-S2).
     * @param {Pointer<Pilot>} pPilot Pointer to a variable that contains the pilot mode, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/pilot">Pilot</a> enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-put_pilot
     */
    put_Pilot(pPilot) {
        pPilotMarshal := pPilot is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, pPilotMarshal, pPilot, "HRESULT")
        return result
    }

    /**
     * Gets the current pilot mode for Digital Video Broadcasting-S2 (DVB-S2).
     * @param {Pointer<Pilot>} pPilot Receives the pilot mode, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/pilot">Pilot</a> enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator2-get_pilot
     */
    get_Pilot(pPilot) {
        pPilotMarshal := pPilot is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pPilotMarshal, pPilot, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_DigitalDemodulator2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_GuardInterval := CallbackCreate(GetMethod(implObj, "put_GuardInterval"), flags, 2)
        this.vtbl.get_GuardInterval := CallbackCreate(GetMethod(implObj, "get_GuardInterval"), flags, 2)
        this.vtbl.put_TransmissionMode := CallbackCreate(GetMethod(implObj, "put_TransmissionMode"), flags, 2)
        this.vtbl.get_TransmissionMode := CallbackCreate(GetMethod(implObj, "get_TransmissionMode"), flags, 2)
        this.vtbl.put_RollOff := CallbackCreate(GetMethod(implObj, "put_RollOff"), flags, 2)
        this.vtbl.get_RollOff := CallbackCreate(GetMethod(implObj, "get_RollOff"), flags, 2)
        this.vtbl.put_Pilot := CallbackCreate(GetMethod(implObj, "put_Pilot"), flags, 2)
        this.vtbl.get_Pilot := CallbackCreate(GetMethod(implObj, "get_Pilot"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_GuardInterval)
        CallbackFree(this.vtbl.get_GuardInterval)
        CallbackFree(this.vtbl.put_TransmissionMode)
        CallbackFree(this.vtbl.get_TransmissionMode)
        CallbackFree(this.vtbl.put_RollOff)
        CallbackFree(this.vtbl.get_RollOff)
        CallbackFree(this.vtbl.put_Pilot)
        CallbackFree(this.vtbl.get_Pilot)
    }
}
