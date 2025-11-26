#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAuxInTuningSpace.ahk

/**
 * This topic applies to Windows XP Media Center Edition 2004 and later.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAuxInTuningSpace2)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iauxintuningspace2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAuxInTuningSpace2 extends IAuxInTuningSpace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAuxInTuningSpace2
     * @type {Guid}
     */
    static IID => Guid("{b10931ed-8bfe-4ab0-9dce-e469c29a9729}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CountryCode", "put_CountryCode"]

    /**
     * @type {Integer} 
     */
    CountryCode {
        get => this.get_CountryCode()
        set => this.put_CountryCode(value)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iauxintuningspace2-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(26, this, "int*", &CountryCodeVal := 0, "HRESULT")
        return CountryCodeVal
    }

    /**
     * 
     * @param {Integer} NewCountryCodeVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iauxintuningspace2-put_countrycode
     */
    put_CountryCode(NewCountryCodeVal) {
        result := ComCall(27, this, "int", NewCountryCodeVal, "HRESULT")
        return result
    }
}
