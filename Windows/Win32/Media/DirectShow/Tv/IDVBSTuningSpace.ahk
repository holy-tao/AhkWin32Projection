#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\SpectralInversion.ahk" { SpectralInversion }
#Import ".\IDVBTuningSpace2.ahk" { IDVBTuningSpace2 }

/**
 * The IDVBSTuningSpace interface is implemented on the DVBTuningSpace object and provides methods for working with tuning spaces with a DVBS network type.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBSTuningSpace)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idvbstuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVBSTuningSpace extends IDVBTuningSpace2 {
    /**
     * The interface identifier for IDVBSTuningSpace
     * @type {Guid}
     */
    static IID := Guid("{cdf7be60-d954-42fd-a972-78971958e470}")

    /**
     * The class identifier for DVBSTuningSpace
     * @type {Guid}
     */
    static CLSID := Guid("{b64016f3-c9a2-4066-96f0-bd9563314726}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVBSTuningSpace interfaces
    */
    struct Vtbl extends IDVBTuningSpace2.Vtbl {
        get_LowOscillator     : IntPtr
        put_LowOscillator     : IntPtr
        get_HighOscillator    : IntPtr
        put_HighOscillator    : IntPtr
        get_LNBSwitch         : IntPtr
        put_LNBSwitch         : IntPtr
        get_InputRange        : IntPtr
        put_InputRange        : IntPtr
        get_SpectralInversion : IntPtr
        put_SpectralInversion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVBSTuningSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    LowOscillator {
        get => this.get_LowOscillator()
        set => this.put_LowOscillator(value)
    }

    /**
     * @type {Integer} 
     */
    HighOscillator {
        get => this.get_HighOscillator()
        set => this.put_HighOscillator(value)
    }

    /**
     * @type {Integer} 
     */
    LNBSwitch {
        get => this.get_LNBSwitch()
        set => this.put_LNBSwitch(value)
    }

    /**
     * @type {BSTR} 
     */
    InputRange {
        get => this.get_InputRange()
        set => this.put_InputRange(value)
    }

    /**
     * @type {SpectralInversion} 
     */
    SpectralInversion {
        get => this.get_SpectralInversion()
        set => this.put_SpectralInversion(value)
    }

    /**
     * The get_LowOscillator method retrieves the low oscillator frequency.
     * @returns {Integer} Receives the low oscillator frequency, in kilohertz (kHz).
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-get_lowoscillator
     */
    get_LowOscillator() {
        result := ComCall(30, this, "int*", &LowOscillator := 0, "HRESULT")
        return LowOscillator
    }

    /**
     * The put_LowOscillator method sets the low oscillator frequency.
     * @param {Integer} LowOscillator Specifies the low oscillator frequency, in kilohertz (kHz).
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-put_lowoscillator
     */
    put_LowOscillator(LowOscillator) {
        result := ComCall(31, this, "int", LowOscillator, "HRESULT")
        return result
    }

    /**
     * The get_HighOscillator method retrieves the high oscillator frequency.
     * @returns {Integer} Receives the high oscillator frequency, in kilohertz (kHz).
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-get_highoscillator
     */
    get_HighOscillator() {
        result := ComCall(32, this, "int*", &HighOscillator := 0, "HRESULT")
        return HighOscillator
    }

    /**
     * The put_HighOscillator method sets the high oscillator frequency.
     * @param {Integer} HighOscillator Specifies the high oscillator frequency, in kilohertz (kHz).
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-put_highoscillator
     */
    put_HighOscillator(HighOscillator) {
        result := ComCall(33, this, "int", HighOscillator, "HRESULT")
        return result
    }

    /**
     * The get_LNBSwitch method retrieves the LNB switch.
     * @returns {Integer} Receives the LNB switch frequency, in kilohertz (kHz).
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-get_lnbswitch
     */
    get_LNBSwitch() {
        result := ComCall(34, this, "int*", &LNBSwitch := 0, "HRESULT")
        return LNBSwitch
    }

    /**
     * The put_LNBSwitch method sets the LNB switch frequency.
     * @param {Integer} LNBSwitch Specifies the LNB switch frequency, in kilohertz (kHz).
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-put_lnbswitch
     */
    put_LNBSwitch(LNBSwitch) {
        result := ComCall(35, this, "int", LNBSwitch, "HRESULT")
        return result
    }

    /**
     * The get_InputRange method retrieves an integer indicating which option or switch contains the requested signal source.
     * @returns {BSTR} Receives the input range.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-get_inputrange
     */
    get_InputRange() {
        InputRange := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, InputRange, "HRESULT")
        return InputRange
    }

    /**
     * The put_InputRange method sets a value indicating which option or switch contains the requested signal source.
     * @param {BSTR} InputRange Specifies which option or switch contains the requested signal source.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-put_inputrange
     */
    put_InputRange(InputRange) {
        InputRange := InputRange is String ? BSTR.Alloc(InputRange).Value : InputRange

        result := ComCall(37, this, BSTR, InputRange, "HRESULT")
        return result
    }

    /**
     * The get_SpectralInversion method retrieves an integer indicating the spectral inversion.
     * @returns {SpectralInversion} Receives the spectral inversion.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-get_spectralinversion
     */
    get_SpectralInversion() {
        result := ComCall(38, this, "int*", &SpectralInversionVal := 0, "HRESULT")
        return SpectralInversionVal
    }

    /**
     * The put_SpectralInversion method sets a value indicating the spectral inversion.
     * @param {SpectralInversion} SpectralInversionVal The spectral inversion.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbstuningspace-put_spectralinversion
     */
    put_SpectralInversion(SpectralInversionVal) {
        result := ComCall(39, this, SpectralInversion, SpectralInversionVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDVBSTuningSpace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LowOscillator := CallbackCreate(GetMethod(implObj, "get_LowOscillator"), flags, 2)
        this.vtbl.put_LowOscillator := CallbackCreate(GetMethod(implObj, "put_LowOscillator"), flags, 2)
        this.vtbl.get_HighOscillator := CallbackCreate(GetMethod(implObj, "get_HighOscillator"), flags, 2)
        this.vtbl.put_HighOscillator := CallbackCreate(GetMethod(implObj, "put_HighOscillator"), flags, 2)
        this.vtbl.get_LNBSwitch := CallbackCreate(GetMethod(implObj, "get_LNBSwitch"), flags, 2)
        this.vtbl.put_LNBSwitch := CallbackCreate(GetMethod(implObj, "put_LNBSwitch"), flags, 2)
        this.vtbl.get_InputRange := CallbackCreate(GetMethod(implObj, "get_InputRange"), flags, 2)
        this.vtbl.put_InputRange := CallbackCreate(GetMethod(implObj, "put_InputRange"), flags, 2)
        this.vtbl.get_SpectralInversion := CallbackCreate(GetMethod(implObj, "get_SpectralInversion"), flags, 2)
        this.vtbl.put_SpectralInversion := CallbackCreate(GetMethod(implObj, "put_SpectralInversion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LowOscillator)
        CallbackFree(this.vtbl.put_LowOscillator)
        CallbackFree(this.vtbl.get_HighOscillator)
        CallbackFree(this.vtbl.put_HighOscillator)
        CallbackFree(this.vtbl.get_LNBSwitch)
        CallbackFree(this.vtbl.put_LNBSwitch)
        CallbackFree(this.vtbl.get_InputRange)
        CallbackFree(this.vtbl.put_InputRange)
        CallbackFree(this.vtbl.get_SpectralInversion)
        CallbackFree(this.vtbl.put_SpectralInversion)
    }
}
