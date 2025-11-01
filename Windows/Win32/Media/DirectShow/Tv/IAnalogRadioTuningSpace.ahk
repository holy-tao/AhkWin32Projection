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
     * 
     * @param {Pointer<Integer>} MinFrequencyVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-get_minfrequency
     */
    get_MinFrequency(MinFrequencyVal) {
        result := ComCall(26, this, "int*", MinFrequencyVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NewMinFrequencyVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-put_minfrequency
     */
    put_MinFrequency(NewMinFrequencyVal) {
        result := ComCall(27, this, "int", NewMinFrequencyVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MaxFrequencyVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-get_maxfrequency
     */
    get_MaxFrequency(MaxFrequencyVal) {
        result := ComCall(28, this, "int*", MaxFrequencyVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NewMaxFrequencyVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-put_maxfrequency
     */
    put_MaxFrequency(NewMaxFrequencyVal) {
        result := ComCall(29, this, "int", NewMaxFrequencyVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} StepVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-get_step
     */
    get_Step(StepVal) {
        result := ComCall(30, this, "int*", StepVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NewStepVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-put_step
     */
    put_Step(NewStepVal) {
        result := ComCall(31, this, "int", NewStepVal, "HRESULT")
        return result
    }
}
