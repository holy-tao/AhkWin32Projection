#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\Polarisation.ahk" { Polarisation }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBDA_FrequencyFilter interface is implemented on a BDA tuner device, and is used by the Network Provider to tell the tuner how to set its frequencies.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_FrequencyFilter)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_frequencyfilter
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_FrequencyFilter extends IUnknown {
    /**
     * The interface identifier for IBDA_FrequencyFilter
     * @type {Guid}
     */
    static IID := Guid("{71985f47-1ca1-11d3-9cc8-00c04f7971e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_FrequencyFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_Autotune            : IntPtr
        get_Autotune            : IntPtr
        put_Frequency           : IntPtr
        get_Frequency           : IntPtr
        put_Polarity            : IntPtr
        get_Polarity            : IntPtr
        put_Range               : IntPtr
        get_Range               : IntPtr
        put_Bandwidth           : IntPtr
        get_Bandwidth           : IntPtr
        put_FrequencyMultiplier : IntPtr
        get_FrequencyMultiplier : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_FrequencyFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Autotune {
        get => this.get_Autotune()
        set => this.put_Autotune(value)
    }

    /**
     * @type {Integer} 
     */
    Frequency {
        get => this.get_Frequency()
        set => this.put_Frequency(value)
    }

    /**
     * @type {Polarisation} 
     */
    Polarity {
        get => this.get_Polarity()
        set => this.put_Polarity(value)
    }

    /**
     * @type {Integer} 
     */
    Range {
        get => this.get_Range()
        set => this.put_Range(value)
    }

    /**
     * @type {Integer} 
     */
    Bandwidth {
        get => this.get_Bandwidth()
        set => this.put_Bandwidth(value)
    }

    /**
     * @type {Integer} 
     */
    FrequencyMultiplier {
        get => this.get_FrequencyMultiplier()
        set => this.put_FrequencyMultiplier(value)
    }

    /**
     * The put_Autotune method specifies whether to activate the device's autotune capabilities.
     * @param {Integer} ulTransponder Specifies the transponder frequency.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_autotune
     */
    put_Autotune(ulTransponder) {
        result := ComCall(3, this, "uint", ulTransponder, "HRESULT")
        return result
    }

    /**
     * The get_Autotune method retrieves the autotune frequency.
     * @param {Pointer<Integer>} pulTransponder Specifies the transponder frequency.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_autotune
     */
    get_Autotune(pulTransponder) {
        pulTransponderMarshal := pulTransponder is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulTransponderMarshal, pulTransponder, "HRESULT")
        return result
    }

    /**
     * The put_Frequency method specifies the frequency.
     * @remarks
     * Frequencies for DVB-S, DVB-T, and ATSC should all be expressed in kilohertz and therefore the default frequency multiplier should not be changed.
     * @param {Integer} ulFrequency Specifies the frequency. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_frequency
     */
    put_Frequency(ulFrequency) {
        result := ComCall(5, this, "uint", ulFrequency, "HRESULT")
        return result
    }

    /**
     * The get_Frequency method retrieves the frequency.
     * @remarks
     * Frequencies for DVB-S, DVB-T, and ATSC should all be expressed in kilohertz and therefore the default frequency multiplier should not be changed.
     * @param {Pointer<Integer>} pulFrequency Pointer that receives the frequency. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequency
     */
    get_Frequency(pulFrequency) {
        pulFrequencyMarshal := pulFrequency is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulFrequencyMarshal, pulFrequency, "HRESULT")
        return result
    }

    /**
     * The put_Polarity method specifies the polarity of the signal.
     * @param {Polarisation} Polarity Specifies the polarity as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/polarisation">Polarisation</a> enumerated type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_polarity
     */
    put_Polarity(Polarity) {
        result := ComCall(7, this, Polarisation, Polarity, "HRESULT")
        return result
    }

    /**
     * The get_Polarity method retrieves the polarity.
     * @param {Pointer<Polarisation>} pPolarity Pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/polarisation">Polarisation</a> variable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_polarity
     */
    get_Polarity(pPolarity) {
        pPolarityMarshal := pPolarity is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pPolarityMarshal, pPolarity, "HRESULT")
        return result
    }

    /**
     * The put_Range method specifies the tuner range. The tuner range is the frequency domain on which to find a particular carrier frequency.
     * @param {Integer} ulRange Specifies the tuner range. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz). If you set this parameter value to -1, the tuner range is not set. If you set the parameter value to 0, the tuner range is undefined.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_range
     */
    put_Range(ulRange) {
        result := ComCall(9, this, "uint", ulRange, "HRESULT")
        return result
    }

    /**
     * The get_Range method retrieves the tuner range. The tuner range is the frequency domain on which to find a particular carrier frequency.
     * @param {Pointer<Integer>} pulRange Pointer that receives the tuner range. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz). A value of -1 for this parameter indicates that the tuner range is not set. A value of 0 for this parameter indicates that  the tuner range is undefined.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_range
     */
    get_Range(pulRange) {
        pulRangeMarshal := pulRange is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pulRangeMarshal, pulRange, "HRESULT")
        return result
    }

    /**
     * The put_Bandwidth method specifies the bandwidth.
     * @param {Integer} ulBandwidth Specifies the bandwidth. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_bandwidth
     */
    put_Bandwidth(ulBandwidth) {
        result := ComCall(11, this, "uint", ulBandwidth, "HRESULT")
        return result
    }

    /**
     * The get_Bandwidth method retrieves the bandwidth.
     * @param {Pointer<Integer>} pulBandwidth Pointer that receives the bandwidth. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_bandwidth
     */
    get_Bandwidth(pulBandwidth) {
        pulBandwidthMarshal := pulBandwidth is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pulBandwidthMarshal, pulBandwidth, "HRESULT")
        return result
    }

    /**
     * The put_FrequencyMultiplier method specifies the frequency multiplier. The frequency multiplier determines the frequency units for the methods on this interface. The default value is 1000, meaning that frequencies are expressed in kilohertz (kHz).
     * @remarks
     * Since frequencies for DVB-S, DVB-T, and ATSC should all be expressed in kilohertz, the default frequency multiplier should never be changed.
     * @param {Integer} ulMultiplier Specifies the multiplier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_frequencymultiplier
     */
    put_FrequencyMultiplier(ulMultiplier) {
        result := ComCall(13, this, "uint", ulMultiplier, "HRESULT")
        return result
    }

    /**
     * The get_FrequencyMultiplier method retrieves the frequency multiplier. The frequency multiplier determines the frequency units for the methods on this interface. The default value is 1000, meaning that frequencies are expressed in kilohertz (kHz).
     * @remarks
     * Frequencies for DVB-S, DVB-T, and ATSC should all be expressed in kilohertz and therefore the default frequency multiplier should not be changed.
     * @param {Pointer<Integer>} pulMultiplier Pointer that receives the multiplier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier
     */
    get_FrequencyMultiplier(pulMultiplier) {
        pulMultiplierMarshal := pulMultiplier is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pulMultiplierMarshal, pulMultiplier, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_FrequencyFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_Autotune := CallbackCreate(GetMethod(implObj, "put_Autotune"), flags, 2)
        this.vtbl.get_Autotune := CallbackCreate(GetMethod(implObj, "get_Autotune"), flags, 2)
        this.vtbl.put_Frequency := CallbackCreate(GetMethod(implObj, "put_Frequency"), flags, 2)
        this.vtbl.get_Frequency := CallbackCreate(GetMethod(implObj, "get_Frequency"), flags, 2)
        this.vtbl.put_Polarity := CallbackCreate(GetMethod(implObj, "put_Polarity"), flags, 2)
        this.vtbl.get_Polarity := CallbackCreate(GetMethod(implObj, "get_Polarity"), flags, 2)
        this.vtbl.put_Range := CallbackCreate(GetMethod(implObj, "put_Range"), flags, 2)
        this.vtbl.get_Range := CallbackCreate(GetMethod(implObj, "get_Range"), flags, 2)
        this.vtbl.put_Bandwidth := CallbackCreate(GetMethod(implObj, "put_Bandwidth"), flags, 2)
        this.vtbl.get_Bandwidth := CallbackCreate(GetMethod(implObj, "get_Bandwidth"), flags, 2)
        this.vtbl.put_FrequencyMultiplier := CallbackCreate(GetMethod(implObj, "put_FrequencyMultiplier"), flags, 2)
        this.vtbl.get_FrequencyMultiplier := CallbackCreate(GetMethod(implObj, "get_FrequencyMultiplier"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_Autotune)
        CallbackFree(this.vtbl.get_Autotune)
        CallbackFree(this.vtbl.put_Frequency)
        CallbackFree(this.vtbl.get_Frequency)
        CallbackFree(this.vtbl.put_Polarity)
        CallbackFree(this.vtbl.get_Polarity)
        CallbackFree(this.vtbl.put_Range)
        CallbackFree(this.vtbl.get_Range)
        CallbackFree(this.vtbl.put_Bandwidth)
        CallbackFree(this.vtbl.get_Bandwidth)
        CallbackFree(this.vtbl.put_FrequencyMultiplier)
        CallbackFree(this.vtbl.get_FrequencyMultiplier)
    }
}
