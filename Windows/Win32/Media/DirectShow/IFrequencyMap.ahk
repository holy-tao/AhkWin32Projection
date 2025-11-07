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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrequencyMapping", "put_FrequencyMapping", "get_CountryCode", "put_CountryCode", "get_DefaultFrequencyMapping", "get_CountryCodeList"]

    /**
     * 
     * @param {Pointer<Integer>} ulCount 
     * @param {Pointer<Pointer<Integer>>} ppulList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ifrequencymap-get_frequencymapping
     */
    get_FrequencyMapping(ulCount, ppulList) {
        ulCountMarshal := ulCount is VarRef ? "uint*" : "ptr"
        ppulListMarshal := ppulList is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ulCountMarshal, ulCount, ppulListMarshal, ppulList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<Integer>} pList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ifrequencymap-put_frequencymapping
     */
    put_FrequencyMapping(ulCount, pList) {
        pListMarshal := pList is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulCount, pListMarshal, pList, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ifrequencymap-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(5, this, "uint*", &pulCountryCode := 0, "HRESULT")
        return pulCountryCode
    }

    /**
     * 
     * @param {Integer} ulCountryCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ifrequencymap-put_countrycode
     */
    put_CountryCode(ulCountryCode) {
        result := ComCall(6, this, "uint", ulCountryCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCountryCode 
     * @param {Pointer<Integer>} pulCount 
     * @param {Pointer<Pointer<Integer>>} ppulList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ifrequencymap-get_defaultfrequencymapping
     */
    get_DefaultFrequencyMapping(ulCountryCode, pulCount, ppulList) {
        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"
        ppulListMarshal := ppulList is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", ulCountryCode, pulCountMarshal, pulCount, ppulListMarshal, ppulList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulCount 
     * @param {Pointer<Pointer<Integer>>} ppulList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ifrequencymap-get_countrycodelist
     */
    get_CountryCodeList(pulCount, ppulList) {
        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"
        ppulListMarshal := ppulList is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, pulCountMarshal, pulCount, ppulListMarshal, ppulList, "HRESULT")
        return result
    }
}
