#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\TunerInputType.ahk" { TunerInputType }
#Import ".\ITuningSpace.ahk" { ITuningSpace }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IAnalogTVTuningSpace interface provides methods for getting and setting parameters associated with analog TV tuning spaces. The Video Control uses these methods when building and controlling a WDM Analog TV filter graph.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAnalogTVTuningSpace)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ianalogtvtuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IAnalogTVTuningSpace extends ITuningSpace {
    /**
     * The interface identifier for IAnalogTVTuningSpace
     * @type {Guid}
     */
    static IID := Guid("{2a6e293c-2595-11d3-b64c-00c04f79498e}")

    /**
     * The class identifier for AnalogTVTuningSpace
     * @type {Guid}
     */
    static CLSID := Guid("{8a674b4d-1f63-11d3-b64c-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAnalogTVTuningSpace interfaces
    */
    struct Vtbl extends ITuningSpace.Vtbl {
        get_MinChannel  : IntPtr
        put_MinChannel  : IntPtr
        get_MaxChannel  : IntPtr
        put_MaxChannel  : IntPtr
        get_InputType   : IntPtr
        put_InputType   : IntPtr
        get_CountryCode : IntPtr
        put_CountryCode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAnalogTVTuningSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MinChannel {
        get => this.get_MinChannel()
        set => this.put_MinChannel(value)
    }

    /**
     * @type {Integer} 
     */
    MaxChannel {
        get => this.get_MaxChannel()
        set => this.put_MaxChannel(value)
    }

    /**
     * @type {TunerInputType} 
     */
    InputType {
        get => this.get_InputType()
        set => this.put_InputType(value)
    }

    /**
     * @type {Integer} 
     */
    CountryCode {
        get => this.get_CountryCode()
        set => this.put_CountryCode(value)
    }

    /**
     * The get_MinChannel method gets the lowest channel number for this tuning space.
     * @remarks
     * An NTSC tuning space connected to an antenna will return a value of 2.
     * @returns {Integer} Receives the lowest channel.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-get_minchannel
     */
    get_MinChannel() {
        result := ComCall(26, this, "int*", &MinChannelVal := 0, "HRESULT")
        return MinChannelVal
    }

    /**
     * The put_MinChannel method sets the lowest channel number for this tuning space.
     * @param {Integer} NewMinChannelVal The lowest channel number.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-put_minchannel
     */
    put_MinChannel(NewMinChannelVal) {
        result := ComCall(27, this, "int", NewMinChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_MaxChannel method gets the highest channel number for this tuning space.
     * @remarks
     * For example, an NTSC tuning space connected to an antenna would return 69.
     * @returns {Integer} Receives the highest channel.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-get_maxchannel
     */
    get_MaxChannel() {
        result := ComCall(28, this, "int*", &MaxChannelVal := 0, "HRESULT")
        return MaxChannelVal
    }

    /**
     * The put_MaxChannel method sets the highest channel number for this tuning space.
     * @param {Integer} NewMaxChannelVal The highest channel number.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-put_maxchannel
     */
    put_MaxChannel(NewMaxChannelVal) {
        result := ComCall(29, this, "int", NewMaxChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_InputType method gets the input type (antenna or cable) intended for the tuning space.
     * @returns {TunerInputType} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-tunerinputtype">TunerInputType</a> that receives the input type.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-get_inputtype
     */
    get_InputType() {
        result := ComCall(30, this, "int*", &InputTypeVal := 0, "HRESULT")
        return InputTypeVal
    }

    /**
     * The put_InputType method sets the input type (antenna or cable) intended for the tuning space.
     * @param {TunerInputType} NewInputTypeVal Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-tunerinputtype">TunerInputType</a> that specifies the input type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-put_inputtype
     */
    put_InputType(NewInputTypeVal) {
        result := ComCall(31, this, TunerInputType, NewInputTypeVal, "HRESULT")
        return result
    }

    /**
     * The get_CountryCode method gets the country/region code of the tuning space (based on TAPI country/region codes).
     * @remarks
     * The tuner can use the country/region code to locate a likely channel for frequency mapping.
     * @returns {Integer} Receives the value for the country/region code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(32, this, "int*", &CountryCodeVal := 0, "HRESULT")
        return CountryCodeVal
    }

    /**
     * The put_CountryCode method sets the country/region code of the tuning space (based on TAPI country/region codes).
     * @remarks
     * The tuner can use the country/region code to locate a likely channel for frequency mapping.
     * @param {Integer} NewCountryCodeVal The country/region code.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-put_countrycode
     */
    put_CountryCode(NewCountryCodeVal) {
        result := ComCall(33, this, "int", NewCountryCodeVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAnalogTVTuningSpace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MinChannel := CallbackCreate(GetMethod(implObj, "get_MinChannel"), flags, 2)
        this.vtbl.put_MinChannel := CallbackCreate(GetMethod(implObj, "put_MinChannel"), flags, 2)
        this.vtbl.get_MaxChannel := CallbackCreate(GetMethod(implObj, "get_MaxChannel"), flags, 2)
        this.vtbl.put_MaxChannel := CallbackCreate(GetMethod(implObj, "put_MaxChannel"), flags, 2)
        this.vtbl.get_InputType := CallbackCreate(GetMethod(implObj, "get_InputType"), flags, 2)
        this.vtbl.put_InputType := CallbackCreate(GetMethod(implObj, "put_InputType"), flags, 2)
        this.vtbl.get_CountryCode := CallbackCreate(GetMethod(implObj, "get_CountryCode"), flags, 2)
        this.vtbl.put_CountryCode := CallbackCreate(GetMethod(implObj, "put_CountryCode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MinChannel)
        CallbackFree(this.vtbl.put_MinChannel)
        CallbackFree(this.vtbl.get_MaxChannel)
        CallbackFree(this.vtbl.put_MaxChannel)
        CallbackFree(this.vtbl.get_InputType)
        CallbackFree(this.vtbl.put_InputType)
        CallbackFree(this.vtbl.get_CountryCode)
        CallbackFree(this.vtbl.put_CountryCode)
    }
}
