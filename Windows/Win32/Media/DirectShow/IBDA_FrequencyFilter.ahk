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
     * 
     * @param {Integer} ulTransponder 
     * @returns {HRESULT} 
     */
    put_Autotune(ulTransponder) {
        result := ComCall(3, this, "uint", ulTransponder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulTransponder 
     * @returns {HRESULT} 
     */
    get_Autotune(pulTransponder) {
        result := ComCall(4, this, "uint*", pulTransponder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFrequency 
     * @returns {HRESULT} 
     */
    put_Frequency(ulFrequency) {
        result := ComCall(5, this, "uint", ulFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulFrequency 
     * @returns {HRESULT} 
     */
    get_Frequency(pulFrequency) {
        result := ComCall(6, this, "uint*", pulFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Polarity 
     * @returns {HRESULT} 
     */
    put_Polarity(Polarity) {
        result := ComCall(7, this, "int", Polarity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPolarity 
     * @returns {HRESULT} 
     */
    get_Polarity(pPolarity) {
        result := ComCall(8, this, "int*", pPolarity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulRange 
     * @returns {HRESULT} 
     */
    put_Range(ulRange) {
        result := ComCall(9, this, "uint", ulRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulRange 
     * @returns {HRESULT} 
     */
    get_Range(pulRange) {
        result := ComCall(10, this, "uint*", pulRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulBandwidth 
     * @returns {HRESULT} 
     */
    put_Bandwidth(ulBandwidth) {
        result := ComCall(11, this, "uint", ulBandwidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulBandwidth 
     * @returns {HRESULT} 
     */
    get_Bandwidth(pulBandwidth) {
        result := ComCall(12, this, "uint*", pulBandwidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulMultiplier 
     * @returns {HRESULT} 
     */
    put_FrequencyMultiplier(ulMultiplier) {
        result := ComCall(13, this, "uint", ulMultiplier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulMultiplier 
     * @returns {HRESULT} 
     */
    get_FrequencyMultiplier(pulMultiplier) {
        result := ComCall(14, this, "uint*", pulMultiplier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
