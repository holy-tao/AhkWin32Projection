#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_LNBInfo interface is implemented on a BDA device filter, specifically an LNB device. The methods are called by the Network Provider to instruct the device on how to acquire the satellite signal.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_LNBInfo)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_lnbinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_LNBInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_LNBInfo
     * @type {Guid}
     */
    static IID => Guid("{992cf102-49f9-4719-a664-c4f23e2408f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_LocalOscilatorFrequencyLowBand", "get_LocalOscilatorFrequencyLowBand", "put_LocalOscilatorFrequencyHighBand", "get_LocalOscilatorFrequencyHighBand", "put_HighLowSwitchFrequency", "get_HighLowSwitchFrequency"]

    /**
     */
    LocalOscilatorFrequencyLowBand {
        get => this.get_LocalOscilatorFrequencyLowBand()
        set => this.put_LocalOscilatorFrequencyLowBand(value)
    }

    /**
     */
    LocalOscilatorFrequencyHighBand {
        get => this.get_LocalOscilatorFrequencyHighBand()
        set => this.put_LocalOscilatorFrequencyHighBand(value)
    }

    /**
     */
    HighLowSwitchFrequency {
        get => this.get_HighLowSwitchFrequency()
        set => this.put_HighLowSwitchFrequency(value)
    }

    /**
     * The put_LocalOscilatorFrequencyLowBand method specifies the frequency of the local oscillator's low band.
     * @param {Integer} ulLOFLow Specifies the low band frequency. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_lnbinfo-put_localoscilatorfrequencylowband
     */
    put_LocalOscilatorFrequencyLowBand(ulLOFLow) {
        result := ComCall(3, this, "uint", ulLOFLow, "HRESULT")
        return result
    }

    /**
     * The get_LocalOscilatorFrequencyLowBand method retrieves the low band of the local oscillator frequency.
     * @param {Pointer<Integer>} pulLOFLow Pointer that receives the low band of the frequency. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_lnbinfo-get_localoscilatorfrequencylowband
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
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_lnbinfo-put_localoscilatorfrequencyhighband
     */
    put_LocalOscilatorFrequencyHighBand(ulLOFHigh) {
        result := ComCall(5, this, "uint", ulLOFHigh, "HRESULT")
        return result
    }

    /**
     * The get_LocalOscilatorFrequencyHighBand method retrieves the high band of the local oscillator frequency.
     * @param {Pointer<Integer>} pulLOFHigh Pointer that receives the high band value. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_lnbinfo-get_localoscilatorfrequencyhighband
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
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_lnbinfo-put_highlowswitchfrequency
     */
    put_HighLowSwitchFrequency(ulSwitchFrequency) {
        result := ComCall(7, this, "uint", ulSwitchFrequency, "HRESULT")
        return result
    }

    /**
     * The get_HighLowSwitchFrequency method retrieves the frequency of the high-low switch.
     * @param {Pointer<Integer>} pulSwitchFrequency Pointer that receives the frequency. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_lnbinfo-get_highlowswitchfrequency
     */
    get_HighLowSwitchFrequency(pulSwitchFrequency) {
        pulSwitchFrequencyMarshal := pulSwitchFrequency is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pulSwitchFrequencyMarshal, pulSwitchFrequency, "HRESULT")
        return result
    }
}
