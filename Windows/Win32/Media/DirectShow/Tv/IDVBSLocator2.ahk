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
     * 
     * @param {Pointer<Int32>} DiseqLNBSourceVal 
     * @returns {HRESULT} 
     */
    get_DiseqLNBSource(DiseqLNBSourceVal) {
        result := ComCall(32, this, "int*", DiseqLNBSourceVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DiseqLNBSourceVal 
     * @returns {HRESULT} 
     */
    put_DiseqLNBSource(DiseqLNBSourceVal) {
        result := ComCall(33, this, "int", DiseqLNBSourceVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} LocalOscillatorOverrideLowVal 
     * @returns {HRESULT} 
     */
    get_LocalOscillatorOverrideLow(LocalOscillatorOverrideLowVal) {
        result := ComCall(34, this, "int*", LocalOscillatorOverrideLowVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LocalOscillatorOverrideLowVal 
     * @returns {HRESULT} 
     */
    put_LocalOscillatorOverrideLow(LocalOscillatorOverrideLowVal) {
        result := ComCall(35, this, "int", LocalOscillatorOverrideLowVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} LocalOscillatorOverrideHighVal 
     * @returns {HRESULT} 
     */
    get_LocalOscillatorOverrideHigh(LocalOscillatorOverrideHighVal) {
        result := ComCall(36, this, "int*", LocalOscillatorOverrideHighVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LocalOscillatorOverrideHighVal 
     * @returns {HRESULT} 
     */
    put_LocalOscillatorOverrideHigh(LocalOscillatorOverrideHighVal) {
        result := ComCall(37, this, "int", LocalOscillatorOverrideHighVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} LocalLNBSwitchOverrideVal 
     * @returns {HRESULT} 
     */
    get_LocalLNBSwitchOverride(LocalLNBSwitchOverrideVal) {
        result := ComCall(38, this, "int*", LocalLNBSwitchOverrideVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LocalLNBSwitchOverrideVal 
     * @returns {HRESULT} 
     */
    put_LocalLNBSwitchOverride(LocalLNBSwitchOverrideVal) {
        result := ComCall(39, this, "int", LocalLNBSwitchOverrideVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} LocalSpectralInversionOverrideVal 
     * @returns {HRESULT} 
     */
    get_LocalSpectralInversionOverride(LocalSpectralInversionOverrideVal) {
        result := ComCall(40, this, "int*", LocalSpectralInversionOverrideVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LocalSpectralInversionOverrideVal 
     * @returns {HRESULT} 
     */
    put_LocalSpectralInversionOverride(LocalSpectralInversionOverrideVal) {
        result := ComCall(41, this, "int", LocalSpectralInversionOverrideVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} RollOffVal 
     * @returns {HRESULT} 
     */
    get_SignalRollOff(RollOffVal) {
        result := ComCall(42, this, "int*", RollOffVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RollOffVal 
     * @returns {HRESULT} 
     */
    put_SignalRollOff(RollOffVal) {
        result := ComCall(43, this, "int", RollOffVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} PilotVal 
     * @returns {HRESULT} 
     */
    get_SignalPilot(PilotVal) {
        result := ComCall(44, this, "int*", PilotVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PilotVal 
     * @returns {HRESULT} 
     */
    put_SignalPilot(PilotVal) {
        result := ComCall(45, this, "int", PilotVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
