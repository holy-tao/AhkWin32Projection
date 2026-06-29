#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuningSpace.ahk" { ITuningSpace }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IAnalogRadioTuningSpace interface provides methods for getting and setting parameters associated with tuning spaces for analog radio transmissions.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAnalogRadioTuningSpace)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ianalogradiotuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IAnalogRadioTuningSpace extends ITuningSpace {
    /**
     * The interface identifier for IAnalogRadioTuningSpace
     * @type {Guid}
     */
    static IID := Guid("{2a6e293b-2595-11d3-b64c-00c04f79498e}")

    /**
     * The class identifier for AnalogRadioTuningSpace
     * @type {Guid}
     */
    static CLSID := Guid("{8a674b4c-1f63-11d3-b64c-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAnalogRadioTuningSpace interfaces
    */
    struct Vtbl extends ITuningSpace.Vtbl {
        get_MinFrequency : IntPtr
        put_MinFrequency : IntPtr
        get_MaxFrequency : IntPtr
        put_MaxFrequency : IntPtr
        get_Step         : IntPtr
        put_Step         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAnalogRadioTuningSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-get_minfrequency
     */
    get_MinFrequency() {
        result := ComCall(26, this, "int*", &MinFrequencyVal := 0, "HRESULT")
        return MinFrequencyVal
    }

    /**
     * The put_MinFrequency method sets the minimum frequency for this tuning space.
     * @param {Integer} NewMinFrequencyVal Specifies the minimum frequency, in kilohertz (kHz).
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-put_minfrequency
     */
    put_MinFrequency(NewMinFrequencyVal) {
        result := ComCall(27, this, "int", NewMinFrequencyVal, "HRESULT")
        return result
    }

    /**
     * The get_MaxFrequency method retrieves the maximum frequency for this tuning space.
     * @returns {Integer} Pointer to a variable that receives the maximum frequency, in kilohertz (kHz).
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-get_maxfrequency
     */
    get_MaxFrequency() {
        result := ComCall(28, this, "int*", &MaxFrequencyVal := 0, "HRESULT")
        return MaxFrequencyVal
    }

    /**
     * The put_MaxFrequency method sets the maximum frequency for this tuning space.
     * @param {Integer} NewMaxFrequencyVal Specifies the maximum frequency, in kilohertz (kHz).
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-put_maxfrequency
     */
    put_MaxFrequency(NewMaxFrequencyVal) {
        result := ComCall(29, this, "int", NewMaxFrequencyVal, "HRESULT")
        return result
    }

    /**
     * The get_Step method retrieves the step value to the next frequency.
     * @returns {Integer} Pointer to a variable receives the step value to the next frequency, in kilohertz (kHz).
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-get_step
     */
    get_Step() {
        result := ComCall(30, this, "int*", &StepVal := 0, "HRESULT")
        return StepVal
    }

    /**
     * The put_Step method sets the step value to the next frequency.
     * @param {Integer} NewStepVal Specifies the step value to the next frequency, in kilohertz (kHz).
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace-put_step
     */
    put_Step(NewStepVal) {
        result := ComCall(31, this, "int", NewStepVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAnalogRadioTuningSpace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MinFrequency := CallbackCreate(GetMethod(implObj, "get_MinFrequency"), flags, 2)
        this.vtbl.put_MinFrequency := CallbackCreate(GetMethod(implObj, "put_MinFrequency"), flags, 2)
        this.vtbl.get_MaxFrequency := CallbackCreate(GetMethod(implObj, "get_MaxFrequency"), flags, 2)
        this.vtbl.put_MaxFrequency := CallbackCreate(GetMethod(implObj, "put_MaxFrequency"), flags, 2)
        this.vtbl.get_Step := CallbackCreate(GetMethod(implObj, "get_Step"), flags, 2)
        this.vtbl.put_Step := CallbackCreate(GetMethod(implObj, "put_Step"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MinFrequency)
        CallbackFree(this.vtbl.put_MinFrequency)
        CallbackFree(this.vtbl.get_MaxFrequency)
        CallbackFree(this.vtbl.put_MaxFrequency)
        CallbackFree(this.vtbl.get_Step)
        CallbackFree(this.vtbl.put_Step)
    }
}
