#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\LNB_Source.ahk" { LNB_Source }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Pilot.ahk" { Pilot }
#Import "..\SpectralInversion.ahk" { SpectralInversion }
#Import ".\IDVBSLocator.ahk" { IDVBSLocator }
#Import "..\RollOff.ahk" { RollOff }

/**
 * Provides information to enable a tuner to acquire a Digital Video Broadcasting-Satellite (DVB-S) transmission.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBSLocator2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idvbslocator2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVBSLocator2 extends IDVBSLocator {
    /**
     * The interface identifier for IDVBSLocator2
     * @type {Guid}
     */
    static IID := Guid("{6044634a-1733-4f99-b982-5fb12afce4f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVBSLocator2 interfaces
    */
    struct Vtbl extends IDVBSLocator.Vtbl {
        get_DiseqLNBSource                 : IntPtr
        put_DiseqLNBSource                 : IntPtr
        get_LocalOscillatorOverrideLow     : IntPtr
        put_LocalOscillatorOverrideLow     : IntPtr
        get_LocalOscillatorOverrideHigh    : IntPtr
        put_LocalOscillatorOverrideHigh    : IntPtr
        get_LocalLNBSwitchOverride         : IntPtr
        put_LocalLNBSwitchOverride         : IntPtr
        get_LocalSpectralInversionOverride : IntPtr
        put_LocalSpectralInversionOverride : IntPtr
        get_SignalRollOff                  : IntPtr
        put_SignalRollOff                  : IntPtr
        get_SignalPilot                    : IntPtr
        put_SignalPilot                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVBSLocator2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {LNB_Source} 
     */
    DiseqLNBSource {
        get => this.get_DiseqLNBSource()
        set => this.put_DiseqLNBSource(value)
    }

    /**
     * @type {Integer} 
     */
    LocalOscillatorOverrideLow {
        get => this.get_LocalOscillatorOverrideLow()
        set => this.put_LocalOscillatorOverrideLow(value)
    }

    /**
     * @type {Integer} 
     */
    LocalOscillatorOverrideHigh {
        get => this.get_LocalOscillatorOverrideHigh()
        set => this.put_LocalOscillatorOverrideHigh(value)
    }

    /**
     * @type {Integer} 
     */
    LocalLNBSwitchOverride {
        get => this.get_LocalLNBSwitchOverride()
        set => this.put_LocalLNBSwitchOverride(value)
    }

    /**
     * @type {SpectralInversion} 
     */
    LocalSpectralInversionOverride {
        get => this.get_LocalSpectralInversionOverride()
        set => this.put_LocalSpectralInversionOverride(value)
    }

    /**
     * @type {RollOff} 
     */
    SignalRollOff {
        get => this.get_SignalRollOff()
        set => this.put_SignalRollOff(value)
    }

    /**
     * @type {Pilot} 
     */
    SignalPilot {
        get => this.get_SignalPilot()
        set => this.put_SignalPilot(value)
    }

    /**
     * Specifies the input for a Digital Satellite Equipment Control (DiSEqC) low-noise block converter (LNB).
     * @returns {LNB_Source} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-get_diseqlnbsource
     */
    get_DiseqLNBSource() {
        result := ComCall(32, this, "int*", &DiseqLNBSourceVal := 0, "HRESULT")
        return DiseqLNBSourceVal
    }

    /**
     * Specifies the input for a Digital Satellite Equipment Control (DiSEqC) low-noise block converter (LNB).
     * @param {LNB_Source} DiseqLNBSourceVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-put_diseqlnbsource
     */
    put_DiseqLNBSource(DiseqLNBSourceVal) {
        result := ComCall(33, this, LNB_Source, DiseqLNBSourceVal, "HRESULT")
        return result
    }

    /**
     * Specifies the low oscillator frequency of a Digital Video Broadcasting (DVB) system, in kHz.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-get_localoscillatoroverridelow
     */
    get_LocalOscillatorOverrideLow() {
        result := ComCall(34, this, "int*", &LocalOscillatorOverrideLowVal := 0, "HRESULT")
        return LocalOscillatorOverrideLowVal
    }

    /**
     * Specifies the low oscillator frequency of a Digital Video Broadcasting (DVB) system, in kHz.
     * @param {Integer} LocalOscillatorOverrideLowVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-put_localoscillatoroverridelow
     */
    put_LocalOscillatorOverrideLow(LocalOscillatorOverrideLowVal) {
        result := ComCall(35, this, "int", LocalOscillatorOverrideLowVal, "HRESULT")
        return result
    }

    /**
     * Specifies the high oscillator frequency of a Digital Video Broadcasting (DVB) system, in kHz.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-get_localoscillatoroverridehigh
     */
    get_LocalOscillatorOverrideHigh() {
        result := ComCall(36, this, "int*", &LocalOscillatorOverrideHighVal := 0, "HRESULT")
        return LocalOscillatorOverrideHighVal
    }

    /**
     * Specifies the high oscillator frequency of a Digital Video Broadcasting (DVB) system, in kHz.
     * @param {Integer} LocalOscillatorOverrideHighVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-put_localoscillatoroverridehigh
     */
    put_LocalOscillatorOverrideHigh(LocalOscillatorOverrideHighVal) {
        result := ComCall(37, this, "int", LocalOscillatorOverrideHighVal, "HRESULT")
        return result
    }

    /**
     * Specifies the switch frequency for the low-noise block converter (LNB) of a Digital Video Broadcasting (DVB) system, in kHz.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-get_locallnbswitchoverride
     */
    get_LocalLNBSwitchOverride() {
        result := ComCall(38, this, "int*", &LocalLNBSwitchOverrideVal := 0, "HRESULT")
        return LocalLNBSwitchOverrideVal
    }

    /**
     * Specifies the switch frequency for the low-noise block converter (LNB) of a Digital Video Broadcasting (DVB) system, in kHz.
     * @param {Integer} LocalLNBSwitchOverrideVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-put_locallnbswitchoverride
     */
    put_LocalLNBSwitchOverride(LocalLNBSwitchOverrideVal) {
        result := ComCall(39, this, "int", LocalLNBSwitchOverrideVal, "HRESULT")
        return result
    }

    /**
     * Specifies the spectral inversion state for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @returns {SpectralInversion} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-get_localspectralinversionoverride
     */
    get_LocalSpectralInversionOverride() {
        result := ComCall(40, this, "int*", &LocalSpectralInversionOverrideVal := 0, "HRESULT")
        return LocalSpectralInversionOverrideVal
    }

    /**
     * Specifies the spectral inversion state for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @param {SpectralInversion} LocalSpectralInversionOverrideVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-put_localspectralinversionoverride
     */
    put_LocalSpectralInversionOverride(LocalSpectralInversionOverrideVal) {
        result := ComCall(41, this, SpectralInversion, LocalSpectralInversionOverrideVal, "HRESULT")
        return result
    }

    /**
     * Specifies the roll-off factor for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @returns {RollOff} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-get_signalrolloff
     */
    get_SignalRollOff() {
        result := ComCall(42, this, "int*", &RollOffVal := 0, "HRESULT")
        return RollOffVal
    }

    /**
     * Specifies the roll-off factor for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @param {RollOff} RollOffVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-put_signalrolloff
     */
    put_SignalRollOff(RollOffVal) {
        result := ComCall(43, this, RollOff, RollOffVal, "HRESULT")
        return result
    }

    /**
     * Specifies the pilot mode for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @returns {Pilot} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-get_signalpilot
     */
    get_SignalPilot() {
        result := ComCall(44, this, "int*", &PilotVal := 0, "HRESULT")
        return PilotVal
    }

    /**
     * Specifies the pilot mode for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @param {Pilot} PilotVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator2-put_signalpilot
     */
    put_SignalPilot(PilotVal) {
        result := ComCall(45, this, Pilot, PilotVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDVBSLocator2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DiseqLNBSource := CallbackCreate(GetMethod(implObj, "get_DiseqLNBSource"), flags, 2)
        this.vtbl.put_DiseqLNBSource := CallbackCreate(GetMethod(implObj, "put_DiseqLNBSource"), flags, 2)
        this.vtbl.get_LocalOscillatorOverrideLow := CallbackCreate(GetMethod(implObj, "get_LocalOscillatorOverrideLow"), flags, 2)
        this.vtbl.put_LocalOscillatorOverrideLow := CallbackCreate(GetMethod(implObj, "put_LocalOscillatorOverrideLow"), flags, 2)
        this.vtbl.get_LocalOscillatorOverrideHigh := CallbackCreate(GetMethod(implObj, "get_LocalOscillatorOverrideHigh"), flags, 2)
        this.vtbl.put_LocalOscillatorOverrideHigh := CallbackCreate(GetMethod(implObj, "put_LocalOscillatorOverrideHigh"), flags, 2)
        this.vtbl.get_LocalLNBSwitchOverride := CallbackCreate(GetMethod(implObj, "get_LocalLNBSwitchOverride"), flags, 2)
        this.vtbl.put_LocalLNBSwitchOverride := CallbackCreate(GetMethod(implObj, "put_LocalLNBSwitchOverride"), flags, 2)
        this.vtbl.get_LocalSpectralInversionOverride := CallbackCreate(GetMethod(implObj, "get_LocalSpectralInversionOverride"), flags, 2)
        this.vtbl.put_LocalSpectralInversionOverride := CallbackCreate(GetMethod(implObj, "put_LocalSpectralInversionOverride"), flags, 2)
        this.vtbl.get_SignalRollOff := CallbackCreate(GetMethod(implObj, "get_SignalRollOff"), flags, 2)
        this.vtbl.put_SignalRollOff := CallbackCreate(GetMethod(implObj, "put_SignalRollOff"), flags, 2)
        this.vtbl.get_SignalPilot := CallbackCreate(GetMethod(implObj, "get_SignalPilot"), flags, 2)
        this.vtbl.put_SignalPilot := CallbackCreate(GetMethod(implObj, "put_SignalPilot"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DiseqLNBSource)
        CallbackFree(this.vtbl.put_DiseqLNBSource)
        CallbackFree(this.vtbl.get_LocalOscillatorOverrideLow)
        CallbackFree(this.vtbl.put_LocalOscillatorOverrideLow)
        CallbackFree(this.vtbl.get_LocalOscillatorOverrideHigh)
        CallbackFree(this.vtbl.put_LocalOscillatorOverrideHigh)
        CallbackFree(this.vtbl.get_LocalLNBSwitchOverride)
        CallbackFree(this.vtbl.put_LocalLNBSwitchOverride)
        CallbackFree(this.vtbl.get_LocalSpectralInversionOverride)
        CallbackFree(this.vtbl.put_LocalSpectralInversionOverride)
        CallbackFree(this.vtbl.get_SignalRollOff)
        CallbackFree(this.vtbl.put_SignalRollOff)
        CallbackFree(this.vtbl.get_SignalPilot)
        CallbackFree(this.vtbl.put_SignalPilot)
    }
}
