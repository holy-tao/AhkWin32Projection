#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to determine the address translation data.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itaddresstranslationinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAddressTranslationInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAddressTranslationInfo
     * @type {Guid}
     */
    static IID => Guid("{afc15945-8d40-11d1-a09e-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DialableString", "get_DisplayableString", "get_CurrentCountryCode", "get_DestinationCountryCode", "get_TranslationResults"]

    /**
     * @type {BSTR} 
     */
    DialableString {
        get => this.get_DialableString()
    }

    /**
     * @type {BSTR} 
     */
    DisplayableString {
        get => this.get_DisplayableString()
    }

    /**
     * @type {Integer} 
     */
    CurrentCountryCode {
        get => this.get_CurrentCountryCode()
    }

    /**
     * @type {Integer} 
     */
    DestinationCountryCode {
        get => this.get_DestinationCountryCode()
    }

    /**
     * @type {Integer} 
     */
    TranslationResults {
        get => this.get_TranslationResults()
    }

    /**
     * The get_DialableString method gets a string that contains a dialable number. Typically, this number is then used as the pDestAddress argument in ITAddress::CreateCall.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing representation of dialable string.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresstranslationinfo-get_dialablestring
     */
    get_DialableString() {
        ppDialableString := BSTR()
        result := ComCall(7, this, "ptr", ppDialableString, "HRESULT")
        return ppDialableString
    }

    /**
     * The get_DisplayableString method gets a string that contains a displayable version of the dialable number.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing representation of displayable string.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresstranslationinfo-get_displayablestring
     */
    get_DisplayableString() {
        ppDisplayableString := BSTR()
        result := ComCall(8, this, "ptr", ppDisplayableString, "HRESULT")
        return ppDisplayableString
    }

    /**
     * The get_CurrentCountryCode method gets the current country/region code.
     * @returns {Integer} Pointer to the country/region code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresstranslationinfo-get_currentcountrycode
     */
    get_CurrentCountryCode() {
        result := ComCall(9, this, "int*", &CountryCode := 0, "HRESULT")
        return CountryCode
    }

    /**
     * Retrieves the country/region code for the call destination.
     * @returns {Integer} A pointer to destination country/region code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresstranslationinfo-get_destinationcountrycode
     */
    get_DestinationCountryCode() {
        result := ComCall(10, this, "int*", &CountryCode := 0, "HRESULT")
        return CountryCode
    }

    /**
     * The get_TranslationResults method gets the results of a translation operation.
     * @returns {Integer} Indicates the information derived from the translation process, which may assist the application in presenting user-interface elements. This value uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetranslateresult--constants">LINETRANSLATERESULT_ Constants</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresstranslationinfo-get_translationresults
     */
    get_TranslationResults() {
        result := ComCall(11, this, "int*", &plResults := 0, "HRESULT")
        return plResults
    }
}
