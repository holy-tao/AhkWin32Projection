#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFrequencyMap interface sets the frequency table used by the BDA Network Provider filter.A frequency table is a list of broadcast or cable frequencies for a given country/region.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IFrequencyMap)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ifrequencymap
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFrequencyMap extends IUnknown{
    /**
     * The interface identifier for IFrequencyMap
     * @type {Guid}
     */
    static IID => Guid("{06fb45c1-693c-4ea7-b79f-7a6a54d8def2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} ulCount 
     * @param {Pointer<UInt32>} ppulList 
     * @returns {HRESULT} 
     */
    get_FrequencyMapping(ulCount, ppulList) {
        result := ComCall(3, this, "uint*", ulCount, "uint*", ppulList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<UInt32>} pList 
     * @returns {HRESULT} 
     */
    put_FrequencyMapping(ulCount, pList) {
        result := ComCall(4, this, "uint", ulCount, "uint*", pList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulCountryCode 
     * @returns {HRESULT} 
     */
    get_CountryCode(pulCountryCode) {
        result := ComCall(5, this, "uint*", pulCountryCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCountryCode 
     * @returns {HRESULT} 
     */
    put_CountryCode(ulCountryCode) {
        result := ComCall(6, this, "uint", ulCountryCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCountryCode 
     * @param {Pointer<UInt32>} pulCount 
     * @param {Pointer<UInt32>} ppulList 
     * @returns {HRESULT} 
     */
    get_DefaultFrequencyMapping(ulCountryCode, pulCount, ppulList) {
        result := ComCall(7, this, "uint", ulCountryCode, "uint*", pulCount, "uint*", ppulList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulCount 
     * @param {Pointer<UInt32>} ppulList 
     * @returns {HRESULT} 
     */
    get_CountryCodeList(pulCount, ppulList) {
        result := ComCall(8, this, "uint*", pulCount, "uint*", ppulList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
