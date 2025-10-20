#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to determine the address translation data.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itaddresstranslationinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAddressTranslationInfo extends IDispatch{
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
     * 
     * @param {Pointer<BSTR>} ppDialableString 
     * @returns {HRESULT} 
     */
    get_DialableString(ppDialableString) {
        result := ComCall(7, this, "ptr", ppDialableString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppDisplayableString 
     * @returns {HRESULT} 
     */
    get_DisplayableString(ppDisplayableString) {
        result := ComCall(8, this, "ptr", ppDisplayableString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CountryCode 
     * @returns {HRESULT} 
     */
    get_CurrentCountryCode(CountryCode) {
        result := ComCall(9, this, "int*", CountryCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CountryCode 
     * @returns {HRESULT} 
     */
    get_DestinationCountryCode(CountryCode) {
        result := ComCall(10, this, "int*", CountryCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plResults 
     * @returns {HRESULT} 
     */
    get_TranslationResults(plResults) {
        result := ComCall(11, this, "int*", plResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
