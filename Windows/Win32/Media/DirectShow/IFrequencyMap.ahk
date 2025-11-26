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
     * @type {Integer} 
     */
    CountryCode {
        get => this.get_CountryCode()
        set => this.put_CountryCode(value)
    }

    /**
     * The get_FrequencyMapping method returns the Network Provider filter's current frequency table.
     * @param {Pointer<Integer>} ulCount Pointer to a variable that receives the size of the frequency table.
     * @param {Pointer<Pointer<Integer>>} ppulList Pointer to a variable that receives the address of the frequency table. The frequency table is an array of size <i>pulCount</i>, allocated by the method. The caller must free the array by calling <b>CoTaskMemFree</b>.
     * @returns {HRESULT} Each entry in the frequency table is a tuning frequency, in kilohertz (kHz).
     * 
     * If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ifrequencymap-get_frequencymapping
     */
    get_FrequencyMapping(ulCount, ppulList) {
        ulCountMarshal := ulCount is VarRef ? "uint*" : "ptr"
        ppulListMarshal := ppulList is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ulCountMarshal, ulCount, ppulListMarshal, ppulList, "HRESULT")
        return result
    }

    /**
     * The put_FrequencyMapping method sets the frequency table.
     * @param {Integer} ulCount Specifies the size of the array given in <i>pList</i>.
     * @param {Pointer<Integer>} pList Address of an array of size <i>ulCount</i>, allocated by the caller. The array should contain a list of all the frequencies (in kHz) that are valid in the current country/region.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ifrequencymap-put_frequencymapping
     */
    put_FrequencyMapping(ulCount, pList) {
        pListMarshal := pList is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulCount, pListMarshal, pList, "HRESULT")
        return result
    }

    /**
     * The get_CountryCode method returns the country/region code the Network Provider is currently using. The country/region code determines which frequency table the Network Provider loads.
     * @returns {Integer} Pointer to a variable that receives the country/region code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ifrequencymap-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(5, this, "uint*", &pulCountryCode := 0, "HRESULT")
        return pulCountryCode
    }

    /**
     * The put_CountryCode method sets the country/region code on the Network Provider filter.
     * @param {Integer} ulCountryCode Specifies the country/region code.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ifrequencymap-put_countrycode
     */
    put_CountryCode(ulCountryCode) {
        result := ComCall(6, this, "uint", ulCountryCode, "HRESULT")
        return result
    }

    /**
     * The get_DefaultFrequencyMapping method returns the default frequency table for a given country/region code.
     * @param {Integer} ulCountryCode Specifies the country/region code.
     * @param {Pointer<Integer>} pulCount Pointer to a variable that receives the size of the frequency table.
     * @param {Pointer<Pointer<Integer>>} ppulList Pointer to a variable that receives the address of the frequency table. The frequency table is an array of size <i>pulCount</i>, allocated by the method. The caller must free the array by calling <b>CoTaskMemFree</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ifrequencymap-get_defaultfrequencymapping
     */
    get_DefaultFrequencyMapping(ulCountryCode, pulCount, ppulList) {
        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"
        ppulListMarshal := ppulList is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", ulCountryCode, pulCountMarshal, pulCount, ppulListMarshal, ppulList, "HRESULT")
        return result
    }

    /**
     * The get_CountryCodeList method returns a list of all the country/region codes for which the Network Provider has a frequency table.
     * @param {Pointer<Integer>} pulCount Pointer to a variable that receives the number of country/region codes.
     * @param {Pointer<Pointer<Integer>>} ppulList Pointer to a variable that receives the address of an array of size <i>pulCount</i>, allocated by the method. The array contains a list of the country/region codes. The caller must free the array by calling <b>CoTaskMemFree</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ifrequencymap-get_countrycodelist
     */
    get_CountryCodeList(pulCount, ppulList) {
        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"
        ppulListMarshal := ppulList is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, pulCountMarshal, pulCount, ppulListMarshal, ppulList, "HRESULT")
        return result
    }
}
