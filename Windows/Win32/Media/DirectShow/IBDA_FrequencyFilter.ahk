#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_FrequencyFilter interface is implemented on a BDA tuner device, and is used by the Network Provider to tell the tuner how to set its frequencies.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_FrequencyFilter)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_frequencyfilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_FrequencyFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_FrequencyFilter
     * @type {Guid}
     */
    static IID => Guid("{71985f47-1ca1-11d3-9cc8-00c04f7971e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Autotune", "get_Autotune", "put_Frequency", "get_Frequency", "put_Polarity", "get_Polarity", "put_Range", "get_Range", "put_Bandwidth", "get_Bandwidth", "put_FrequencyMultiplier", "get_FrequencyMultiplier"]

    /**
     */
    Autotune {
        get => this.get_Autotune()
        set => this.put_Autotune(value)
    }

    /**
     */
    Frequency {
        get => this.get_Frequency()
        set => this.put_Frequency(value)
    }

    /**
     */
    Polarity {
        get => this.get_Polarity()
        set => this.put_Polarity(value)
    }

    /**
     */
    Range {
        get => this.get_Range()
        set => this.put_Range(value)
    }

    /**
     */
    Bandwidth {
        get => this.get_Bandwidth()
        set => this.put_Bandwidth(value)
    }

    /**
     */
    FrequencyMultiplier {
        get => this.get_FrequencyMultiplier()
        set => this.put_FrequencyMultiplier(value)
    }

    /**
     * The put_Autotune method specifies whether to activate the device's autotune capabilities.
     * @param {Integer} ulTransponder Specifies the transponder frequency.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-put_autotune
     */
    put_Autotune(ulTransponder) {
        result := ComCall(3, this, "uint", ulTransponder, "HRESULT")
        return result
    }

    /**
     * The get_Autotune method retrieves the autotune frequency.
     * @param {Pointer<Integer>} pulTransponder Specifies the transponder frequency.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-get_autotune
     */
    get_Autotune(pulTransponder) {
        pulTransponderMarshal := pulTransponder is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulTransponderMarshal, pulTransponder, "HRESULT")
        return result
    }

    /**
     * The put_Frequency method specifies the frequency.
     * @param {Integer} ulFrequency Specifies the frequency. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-put_frequency
     */
    put_Frequency(ulFrequency) {
        result := ComCall(5, this, "uint", ulFrequency, "HRESULT")
        return result
    }

    /**
     * The get_Frequency method retrieves the frequency.
     * @param {Pointer<Integer>} pulFrequency Pointer that receives the frequency. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequency
     */
    get_Frequency(pulFrequency) {
        pulFrequencyMarshal := pulFrequency is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulFrequencyMarshal, pulFrequency, "HRESULT")
        return result
    }

    /**
     * The put_Polarity method specifies the polarity of the signal.
     * @param {Integer} Polarity Specifies the polarity as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/polarisation">Polarisation</a> enumerated type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-put_polarity
     */
    put_Polarity(Polarity) {
        result := ComCall(7, this, "int", Polarity, "HRESULT")
        return result
    }

    /**
     * The get_Polarity method retrieves the polarity.
     * @param {Pointer<Integer>} pPolarity Pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/polarisation">Polarisation</a> variable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-get_polarity
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
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-put_range
     */
    put_Range(ulRange) {
        result := ComCall(9, this, "uint", ulRange, "HRESULT")
        return result
    }

    /**
     * The get_Range method retrieves the tuner range. The tuner range is the frequency domain on which to find a particular carrier frequency.
     * @param {Pointer<Integer>} pulRange Pointer that receives the tuner range. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz). A value of -1 for this parameter indicates that the tuner range is not set. A value of 0 for this parameter indicates that  the tuner range is undefined.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-get_range
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
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-put_bandwidth
     */
    put_Bandwidth(ulBandwidth) {
        result := ComCall(11, this, "uint", ulBandwidth, "HRESULT")
        return result
    }

    /**
     * The get_Bandwidth method retrieves the bandwidth.
     * @param {Pointer<Integer>} pulBandwidth Pointer that receives the bandwidth. The units are 1 Hz x the frequency multiplier, where the <i>frequency multiplier</i> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier">IBDA_FrequencyFilter::get_FrequencyMultiplier</a> method. The default frequency multiplier is 1000, so the default units are kilohertz (kHz).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-get_bandwidth
     */
    get_Bandwidth(pulBandwidth) {
        pulBandwidthMarshal := pulBandwidth is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pulBandwidthMarshal, pulBandwidth, "HRESULT")
        return result
    }

    /**
     * The put_FrequencyMultiplier method specifies the frequency multiplier. The frequency multiplier determines the frequency units for the methods on this interface. The default value is 1000, meaning that frequencies are expressed in kilohertz (kHz).
     * @param {Integer} ulMultiplier Specifies the multiplier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-put_frequencymultiplier
     */
    put_FrequencyMultiplier(ulMultiplier) {
        result := ComCall(13, this, "uint", ulMultiplier, "HRESULT")
        return result
    }

    /**
     * The get_FrequencyMultiplier method retrieves the frequency multiplier. The frequency multiplier determines the frequency units for the methods on this interface. The default value is 1000, meaning that frequencies are expressed in kilohertz (kHz).
     * @param {Pointer<Integer>} pulMultiplier Pointer that receives the multiplier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier
     */
    get_FrequencyMultiplier(pulMultiplier) {
        pulMultiplierMarshal := pulMultiplier is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pulMultiplierMarshal, pulMultiplier, "HRESULT")
        return result
    }
}
