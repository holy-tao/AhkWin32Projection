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
     * 
     * @param {Pointer<Int32>} LowOscillator 
     * @returns {HRESULT} 
     */
    get_LowOscillator(LowOscillator) {
        result := ComCall(30, this, "int*", LowOscillator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LowOscillator 
     * @returns {HRESULT} 
     */
    put_LowOscillator(LowOscillator) {
        result := ComCall(31, this, "int", LowOscillator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} HighOscillator 
     * @returns {HRESULT} 
     */
    get_HighOscillator(HighOscillator) {
        result := ComCall(32, this, "int*", HighOscillator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HighOscillator 
     * @returns {HRESULT} 
     */
    put_HighOscillator(HighOscillator) {
        result := ComCall(33, this, "int", HighOscillator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} LNBSwitch 
     * @returns {HRESULT} 
     */
    get_LNBSwitch(LNBSwitch) {
        result := ComCall(34, this, "int*", LNBSwitch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LNBSwitch 
     * @returns {HRESULT} 
     */
    put_LNBSwitch(LNBSwitch) {
        result := ComCall(35, this, "int", LNBSwitch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} InputRange 
     * @returns {HRESULT} 
     */
    get_InputRange(InputRange) {
        result := ComCall(36, this, "ptr", InputRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} InputRange 
     * @returns {HRESULT} 
     */
    put_InputRange(InputRange) {
        InputRange := InputRange is String ? BSTR.Alloc(InputRange).Value : InputRange

        result := ComCall(37, this, "ptr", InputRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} SpectralInversionVal 
     * @returns {HRESULT} 
     */
    get_SpectralInversion(SpectralInversionVal) {
        result := ComCall(38, this, "int*", SpectralInversionVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SpectralInversionVal 
     * @returns {HRESULT} 
     */
    put_SpectralInversion(SpectralInversionVal) {
        result := ComCall(39, this, "int", SpectralInversionVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
