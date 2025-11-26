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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinFrequency", "put_MinFrequency", "get_MaxFrequency", "put_MaxFrequency", "get_Step", "put_Step"]

    /**
     * @type {Integer} 
     */
    MinFrequency {
        get => this.get_MinFrequency()
        set => this.put_MinFrequency(value)
    }

    /**
     * @type {Integer} 
     */
    MaxFrequency {
        get => this.get_MaxFrequency()
        set => this.put_MaxFrequency(value)
    }

    /**
     * @type {Integer} 
     */
    Step {
        get => this.get_Step()
        set => this.put_Step(value)
    }

    /**
     * The get_MinFrequency method retrieves the minimum frequency for this tuning space.
     * @returns {Integer} Pointer to a variable that receives the minimum frequency, in kilohertz (kHz).
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ianalogradiotuningspace-get_minfrequency
     */
    get_MinFrequency() {
        result := ComCall(26, this, "int*", &MinFrequencyVal := 0, "HRESULT")
        return MinFrequencyVal
    }

    /**
     * The put_MinFrequency method sets the minimum frequency for this tuning space.
     * @param {Integer} NewMinFrequencyVal Specifies the minimum frequency, in kilohertz (kHz).
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ianalogradiotuningspace-put_minfrequency
     */
    put_MinFrequency(NewMinFrequencyVal) {
        result := ComCall(27, this, "int", NewMinFrequencyVal, "HRESULT")
        return result
    }

    /**
     * The get_MaxFrequency method retrieves the maximum frequency for this tuning space.
     * @returns {Integer} Pointer to a variable that receives the maximum frequency, in kilohertz (kHz).
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ianalogradiotuningspace-get_maxfrequency
     */
    get_MaxFrequency() {
        result := ComCall(28, this, "int*", &MaxFrequencyVal := 0, "HRESULT")
        return MaxFrequencyVal
    }

    /**
     * The put_MaxFrequency method sets the maximum frequency for this tuning space.
     * @param {Integer} NewMaxFrequencyVal Specifies the maximum frequency, in kilohertz (kHz).
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ianalogradiotuningspace-put_maxfrequency
     */
    put_MaxFrequency(NewMaxFrequencyVal) {
        result := ComCall(29, this, "int", NewMaxFrequencyVal, "HRESULT")
        return result
    }

    /**
     * The get_Step method retrieves the step value to the next frequency.
     * @returns {Integer} Pointer to a variable receives the step value to the next frequency, in kilohertz (kHz).
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ianalogradiotuningspace-get_step
     */
    get_Step() {
        result := ComCall(30, this, "int*", &StepVal := 0, "HRESULT")
        return StepVal
    }

    /**
     * The put_Step method sets the step value to the next frequency.
     * @param {Integer} NewStepVal Specifies the step value to the next frequency, in kilohertz (kHz).
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ianalogradiotuningspace-put_step
     */
    put_Step(NewStepVal) {
        result := ComCall(31, this, "int", NewStepVal, "HRESULT")
        return result
    }
}
