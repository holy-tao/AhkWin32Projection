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
     * 
     * @param {Integer} ulTransponder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_autotune
     */
    put_Autotune(ulTransponder) {
        result := ComCall(3, this, "uint", ulTransponder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulTransponder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_autotune
     */
    get_Autotune(pulTransponder) {
        pulTransponderMarshal := pulTransponder is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulTransponderMarshal, pulTransponder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFrequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_frequency
     */
    put_Frequency(ulFrequency) {
        result := ComCall(5, this, "uint", ulFrequency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulFrequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequency
     */
    get_Frequency(pulFrequency) {
        pulFrequencyMarshal := pulFrequency is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulFrequencyMarshal, pulFrequency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Polarity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_polarity
     */
    put_Polarity(Polarity) {
        result := ComCall(7, this, "int", Polarity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPolarity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_polarity
     */
    get_Polarity(pPolarity) {
        pPolarityMarshal := pPolarity is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pPolarityMarshal, pPolarity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_range
     */
    put_Range(ulRange) {
        result := ComCall(9, this, "uint", ulRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_range
     */
    get_Range(pulRange) {
        pulRangeMarshal := pulRange is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pulRangeMarshal, pulRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulBandwidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_bandwidth
     */
    put_Bandwidth(ulBandwidth) {
        result := ComCall(11, this, "uint", ulBandwidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulBandwidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_bandwidth
     */
    get_Bandwidth(pulBandwidth) {
        pulBandwidthMarshal := pulBandwidth is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pulBandwidthMarshal, pulBandwidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulMultiplier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-put_frequencymultiplier
     */
    put_FrequencyMultiplier(ulMultiplier) {
        result := ComCall(13, this, "uint", ulMultiplier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulMultiplier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_frequencyfilter-get_frequencymultiplier
     */
    get_FrequencyMultiplier(pulMultiplier) {
        pulMultiplierMarshal := pulMultiplier is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pulMultiplierMarshal, pulMultiplier, "HRESULT")
        return result
    }
}
