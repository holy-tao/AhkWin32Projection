#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDVBSLocator.ahk

/**
 * Provides information to enable a tuner to acquire a Digital Video Broadcasting-Satellite (DVB-S) transmission.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBSLocator2)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idvbslocator2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDVBSLocator2 extends IDVBSLocator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDVBSLocator2
     * @type {Guid}
     */
    static IID => Guid("{6044634a-1733-4f99-b982-5fb12afce4f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DiseqLNBSource", "put_DiseqLNBSource", "get_LocalOscillatorOverrideLow", "put_LocalOscillatorOverrideLow", "get_LocalOscillatorOverrideHigh", "put_LocalOscillatorOverrideHigh", "get_LocalLNBSwitchOverride", "put_LocalLNBSwitchOverride", "get_LocalSpectralInversionOverride", "put_LocalSpectralInversionOverride", "get_SignalRollOff", "put_SignalRollOff", "get_SignalPilot", "put_SignalPilot"]

    /**
     * @type {Integer} 
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
     * @type {Integer} 
     */
    LocalSpectralInversionOverride {
        get => this.get_LocalSpectralInversionOverride()
        set => this.put_LocalSpectralInversionOverride(value)
    }

    /**
     * @type {Integer} 
     */
    SignalRollOff {
        get => this.get_SignalRollOff()
        set => this.put_SignalRollOff(value)
    }

    /**
     * @type {Integer} 
     */
    SignalPilot {
        get => this.get_SignalPilot()
        set => this.put_SignalPilot(value)
    }

    /**
     * Specifies the input for a Digital Satellite Equipment Control (DiSEqC) low-noise block converter (LNB).
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-get_diseqlnbsource
     */
    get_DiseqLNBSource() {
        result := ComCall(32, this, "int*", &DiseqLNBSourceVal := 0, "HRESULT")
        return DiseqLNBSourceVal
    }

    /**
     * Specifies the input for a Digital Satellite Equipment Control (DiSEqC) low-noise block converter (LNB).
     * @param {Integer} DiseqLNBSourceVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-put_diseqlnbsource
     */
    put_DiseqLNBSource(DiseqLNBSourceVal) {
        result := ComCall(33, this, "int", DiseqLNBSourceVal, "HRESULT")
        return result
    }

    /**
     * Specifies the low oscillator frequency of a Digital Video Broadcasting (DVB) system, in kHz.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-get_localoscillatoroverridelow
     */
    get_LocalOscillatorOverrideLow() {
        result := ComCall(34, this, "int*", &LocalOscillatorOverrideLowVal := 0, "HRESULT")
        return LocalOscillatorOverrideLowVal
    }

    /**
     * Specifies the low oscillator frequency of a Digital Video Broadcasting (DVB) system, in kHz.
     * @param {Integer} LocalOscillatorOverrideLowVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-put_localoscillatoroverridelow
     */
    put_LocalOscillatorOverrideLow(LocalOscillatorOverrideLowVal) {
        result := ComCall(35, this, "int", LocalOscillatorOverrideLowVal, "HRESULT")
        return result
    }

    /**
     * Specifies the high oscillator frequency of a Digital Video Broadcasting (DVB) system, in kHz.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-get_localoscillatoroverridehigh
     */
    get_LocalOscillatorOverrideHigh() {
        result := ComCall(36, this, "int*", &LocalOscillatorOverrideHighVal := 0, "HRESULT")
        return LocalOscillatorOverrideHighVal
    }

    /**
     * Specifies the high oscillator frequency of a Digital Video Broadcasting (DVB) system, in kHz.
     * @param {Integer} LocalOscillatorOverrideHighVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-put_localoscillatoroverridehigh
     */
    put_LocalOscillatorOverrideHigh(LocalOscillatorOverrideHighVal) {
        result := ComCall(37, this, "int", LocalOscillatorOverrideHighVal, "HRESULT")
        return result
    }

    /**
     * Specifies the switch frequency for the low-noise block converter (LNB) of a Digital Video Broadcasting (DVB) system, in kHz.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-get_locallnbswitchoverride
     */
    get_LocalLNBSwitchOverride() {
        result := ComCall(38, this, "int*", &LocalLNBSwitchOverrideVal := 0, "HRESULT")
        return LocalLNBSwitchOverrideVal
    }

    /**
     * Specifies the switch frequency for the low-noise block converter (LNB) of a Digital Video Broadcasting (DVB) system, in kHz.
     * @param {Integer} LocalLNBSwitchOverrideVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-put_locallnbswitchoverride
     */
    put_LocalLNBSwitchOverride(LocalLNBSwitchOverrideVal) {
        result := ComCall(39, this, "int", LocalLNBSwitchOverrideVal, "HRESULT")
        return result
    }

    /**
     * Specifies the spectral inversion state for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-get_localspectralinversionoverride
     */
    get_LocalSpectralInversionOverride() {
        result := ComCall(40, this, "int*", &LocalSpectralInversionOverrideVal := 0, "HRESULT")
        return LocalSpectralInversionOverrideVal
    }

    /**
     * Specifies the spectral inversion state for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @param {Integer} LocalSpectralInversionOverrideVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-put_localspectralinversionoverride
     */
    put_LocalSpectralInversionOverride(LocalSpectralInversionOverrideVal) {
        result := ComCall(41, this, "int", LocalSpectralInversionOverrideVal, "HRESULT")
        return result
    }

    /**
     * Specifies the roll-off factor for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-get_signalrolloff
     */
    get_SignalRollOff() {
        result := ComCall(42, this, "int*", &RollOffVal := 0, "HRESULT")
        return RollOffVal
    }

    /**
     * Specifies the roll-off factor for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @param {Integer} RollOffVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-put_signalrolloff
     */
    put_SignalRollOff(RollOffVal) {
        result := ComCall(43, this, "int", RollOffVal, "HRESULT")
        return result
    }

    /**
     * Specifies the pilot mode for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-get_signalpilot
     */
    get_SignalPilot() {
        result := ComCall(44, this, "int*", &PilotVal := 0, "HRESULT")
        return PilotVal
    }

    /**
     * Specifies the pilot mode for a Digital Video Broadcasting-Satellite, Second Generation (DVB-S2) signal.
     * @param {Integer} PilotVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator2-put_signalpilot
     */
    put_SignalPilot(PilotVal) {
        result := ComCall(45, this, "int", PilotVal, "HRESULT")
        return result
    }
}
