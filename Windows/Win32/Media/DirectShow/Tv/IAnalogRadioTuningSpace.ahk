#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuningSpace.ahk

/**
 * The IAnalogRadioTuningSpace interface provides methods for getting and setting parameters associated with tuning spaces for analog radio transmissions.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAnalogRadioTuningSpace)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ianalogradiotuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAnalogRadioTuningSpace extends ITuningSpace{
    /**
     * The interface identifier for IAnalogRadioTuningSpace
     * @type {Guid}
     */
    static IID => Guid("{2a6e293b-2595-11d3-b64c-00c04f79498e}")

    /**
     * The class identifier for AnalogRadioTuningSpace
     * @type {Guid}
     */
    static CLSID => Guid("{8a674b4c-1f63-11d3-b64c-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * 
     * @param {Pointer<Int32>} MinFrequencyVal 
     * @returns {HRESULT} 
     */
    get_MinFrequency(MinFrequencyVal) {
        result := ComCall(26, this, "int*", MinFrequencyVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewMinFrequencyVal 
     * @returns {HRESULT} 
     */
    put_MinFrequency(NewMinFrequencyVal) {
        result := ComCall(27, this, "int", NewMinFrequencyVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} MaxFrequencyVal 
     * @returns {HRESULT} 
     */
    get_MaxFrequency(MaxFrequencyVal) {
        result := ComCall(28, this, "int*", MaxFrequencyVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewMaxFrequencyVal 
     * @returns {HRESULT} 
     */
    put_MaxFrequency(NewMaxFrequencyVal) {
        result := ComCall(29, this, "int", NewMaxFrequencyVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} StepVal 
     * @returns {HRESULT} 
     */
    get_Step(StepVal) {
        result := ComCall(30, this, "int*", StepVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewStepVal 
     * @returns {HRESULT} 
     */
    put_Step(NewStepVal) {
        result := ComCall(31, this, "int", NewStepVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
