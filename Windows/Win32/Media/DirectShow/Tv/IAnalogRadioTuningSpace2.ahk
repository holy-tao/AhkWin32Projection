#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAnalogRadioTuningSpace.ahk

/**
 * This topic applies to Windows XP Media Center Edition 2004 and later.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAnalogRadioTuningSpace2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ianalogradiotuningspace2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAnalogRadioTuningSpace2 extends IAnalogRadioTuningSpace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnalogRadioTuningSpace2
     * @type {Guid}
     */
    static IID => Guid("{39dd45da-2da8-46ba-8a8a-87e2b73d983a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CountryCode", "put_CountryCode"]

    /**
     * 
     * @param {Pointer<Integer>} CountryCodeVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace2-get_countrycode
     */
    get_CountryCode(CountryCodeVal) {
        CountryCodeValMarshal := CountryCodeVal is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, CountryCodeValMarshal, CountryCodeVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NewCountryCodeVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace2-put_countrycode
     */
    put_CountryCode(NewCountryCodeVal) {
        result := ComCall(33, this, "int", NewCountryCodeVal, "HRESULT")
        return result
    }
}
