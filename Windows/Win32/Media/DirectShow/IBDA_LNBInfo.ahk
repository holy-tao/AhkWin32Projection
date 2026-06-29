#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBDA_LNBInfo interface is implemented on a BDA device filter, specifically an LNB device. The methods are called by the Network Provider to instruct the device on how to acquire the satellite signal.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_LNBInfo)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_lnbinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_LNBInfo extends IUnknown {
    /**
     * The interface identifier for IBDA_LNBInfo
     * @type {Guid}
     */
    static IID := Guid("{992cf102-49f9-4719-a664-c4f23e2408f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_LNBInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_LocalOscilatorFrequencyLowBand  : IntPtr
        get_LocalOscilatorFrequencyLowBand  : IntPtr
        put_LocalOscilatorFrequencyHighBand : IntPtr
        get_LocalOscilatorFrequencyHighBand : IntPtr
        put_HighLowSwitchFrequency          : IntPtr
        get_HighLowSwitchFrequency          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_LNBInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    LocalOscilatorFrequencyLowBand {
        get => this.get_LocalOscilatorFrequencyLowBand()
        set => this.put_LocalOscilatorFrequencyLowBand(value)
    }

    /**
     * @type {Integer} 
     */
    LocalOscilatorFrequencyHighBand {
        get => this.get_LocalOscilatorFrequencyHighBand()
        set => this.put_LocalOscilatorFrequencyHighBand(value)
    }

    /**
     * @type {Integer} 
     */
    HighLowSwitchFrequency {
        get => this.get_HighLowSwitchFrequency()
        set => this.put_HighLowSwitchFrequency(value)
    }

    /**
     * The put_LocalOscilatorFrequencyLowBand method specifies the frequency of the local oscillator's low band.
     * @param {Integer} ulLOFLow Specifies the low band frequency. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-put_localoscilatorfrequencylowband
     */
    put_LocalOscilatorFrequencyLowBand(ulLOFLow) {
        result := ComCall(3, this, "uint", ulLOFLow, "HRESULT")
        return result
    }

    /**
     * The get_LocalOscilatorFrequencyLowBand method retrieves the low band of the local oscillator frequency.
     * @param {Pointer<Integer>} pulLOFLow Pointer that receives the low band of the frequency. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-get_localoscilatorfrequencylowband
     */
    get_LocalOscilatorFrequencyLowBand(pulLOFLow) {
        pulLOFLowMarshal := pulLOFLow is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulLOFLowMarshal, pulLOFLow, "HRESULT")
        return result
    }

    /**
     * The put_LocalOscilatorFrequencyHighBand method specifies the frequency of the local oscillator's high band.
     * @param {Integer} ulLOFHigh Specifies the frequency's high band. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-put_localoscilatorfrequencyhighband
     */
    put_LocalOscilatorFrequencyHighBand(ulLOFHigh) {
        result := ComCall(5, this, "uint", ulLOFHigh, "HRESULT")
        return result
    }

    /**
     * The get_LocalOscilatorFrequencyHighBand method retrieves the high band of the local oscillator frequency.
     * @param {Pointer<Integer>} pulLOFHigh Pointer that receives the high band value. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-get_localoscilatorfrequencyhighband
     */
    get_LocalOscilatorFrequencyHighBand(pulLOFHigh) {
        pulLOFHighMarshal := pulLOFHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulLOFHighMarshal, pulLOFHigh, "HRESULT")
        return result
    }

    /**
     * The put_HighLowSwitchFrequency method specifies the frequency of the high-low switch.
     * @param {Integer} ulSwitchFrequency Specifies the frequency. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-put_highlowswitchfrequency
     */
    put_HighLowSwitchFrequency(ulSwitchFrequency) {
        result := ComCall(7, this, "uint", ulSwitchFrequency, "HRESULT")
        return result
    }

    /**
     * The get_HighLowSwitchFrequency method retrieves the frequency of the high-low switch.
     * @param {Pointer<Integer>} pulSwitchFrequency Pointer that receives the frequency. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_lnbinfo-get_highlowswitchfrequency
     */
    get_HighLowSwitchFrequency(pulSwitchFrequency) {
        pulSwitchFrequencyMarshal := pulSwitchFrequency is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pulSwitchFrequencyMarshal, pulSwitchFrequency, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_LNBInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_LocalOscilatorFrequencyLowBand := CallbackCreate(GetMethod(implObj, "put_LocalOscilatorFrequencyLowBand"), flags, 2)
        this.vtbl.get_LocalOscilatorFrequencyLowBand := CallbackCreate(GetMethod(implObj, "get_LocalOscilatorFrequencyLowBand"), flags, 2)
        this.vtbl.put_LocalOscilatorFrequencyHighBand := CallbackCreate(GetMethod(implObj, "put_LocalOscilatorFrequencyHighBand"), flags, 2)
        this.vtbl.get_LocalOscilatorFrequencyHighBand := CallbackCreate(GetMethod(implObj, "get_LocalOscilatorFrequencyHighBand"), flags, 2)
        this.vtbl.put_HighLowSwitchFrequency := CallbackCreate(GetMethod(implObj, "put_HighLowSwitchFrequency"), flags, 2)
        this.vtbl.get_HighLowSwitchFrequency := CallbackCreate(GetMethod(implObj, "get_HighLowSwitchFrequency"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_LocalOscilatorFrequencyLowBand)
        CallbackFree(this.vtbl.get_LocalOscilatorFrequencyLowBand)
        CallbackFree(this.vtbl.put_LocalOscilatorFrequencyHighBand)
        CallbackFree(this.vtbl.get_LocalOscilatorFrequencyHighBand)
        CallbackFree(this.vtbl.put_HighLowSwitchFrequency)
        CallbackFree(this.vtbl.get_HighLowSwitchFrequency)
    }
}
