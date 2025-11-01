#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IDVBTuningSpace2.ahk

/**
 * The IDVBSTuningSpace interface is implemented on the DVBTuningSpace object and provides methods for working with tuning spaces with a DVBS network type.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBSTuningSpace)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idvbstuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDVBSTuningSpace extends IDVBTuningSpace2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDVBSTuningSpace
     * @type {Guid}
     */
    static IID => Guid("{cdf7be60-d954-42fd-a972-78971958e470}")

    /**
     * The class identifier for DVBSTuningSpace
     * @type {Guid}
     */
    static CLSID => Guid("{b64016f3-c9a2-4066-96f0-bd9563314726}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LowOscillator", "put_LowOscillator", "get_HighOscillator", "put_HighOscillator", "get_LNBSwitch", "put_LNBSwitch", "get_InputRange", "put_InputRange", "get_SpectralInversion", "put_SpectralInversion"]

    /**
     * 
     * @param {Pointer<Integer>} LowOscillator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-get_lowoscillator
     */
    get_LowOscillator(LowOscillator) {
        LowOscillatorMarshal := LowOscillator is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, LowOscillatorMarshal, LowOscillator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LowOscillator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-put_lowoscillator
     */
    put_LowOscillator(LowOscillator) {
        result := ComCall(31, this, "int", LowOscillator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} HighOscillator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-get_highoscillator
     */
    get_HighOscillator(HighOscillator) {
        HighOscillatorMarshal := HighOscillator is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, HighOscillatorMarshal, HighOscillator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HighOscillator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-put_highoscillator
     */
    put_HighOscillator(HighOscillator) {
        result := ComCall(33, this, "int", HighOscillator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} LNBSwitch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-get_lnbswitch
     */
    get_LNBSwitch(LNBSwitch) {
        LNBSwitchMarshal := LNBSwitch is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, LNBSwitchMarshal, LNBSwitch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LNBSwitch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-put_lnbswitch
     */
    put_LNBSwitch(LNBSwitch) {
        result := ComCall(35, this, "int", LNBSwitch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} InputRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-get_inputrange
     */
    get_InputRange(InputRange) {
        result := ComCall(36, this, "ptr", InputRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} InputRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-put_inputrange
     */
    put_InputRange(InputRange) {
        InputRange := InputRange is String ? BSTR.Alloc(InputRange).Value : InputRange

        result := ComCall(37, this, "ptr", InputRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SpectralInversionVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-get_spectralinversion
     */
    get_SpectralInversion(SpectralInversionVal) {
        SpectralInversionValMarshal := SpectralInversionVal is VarRef ? "int*" : "ptr"

        result := ComCall(38, this, SpectralInversionValMarshal, SpectralInversionVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SpectralInversionVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-put_spectralinversion
     */
    put_SpectralInversion(SpectralInversionVal) {
        result := ComCall(39, this, "int", SpectralInversionVal, "HRESULT")
        return result
    }
}
