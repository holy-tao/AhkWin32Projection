#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IFELanguage interface provides language processing services using the Microsoft IME.
 * @remarks
 * 
  * Create an instance of this interface with the <a href="https://docs.microsoft.com/windows/desktop/api/msime/nf-msime-createifelanguageinstance">CreateIFELanguageInstance</a> function.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msime/nn-msime-ifelanguage
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IFELanguage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFELanguage
     * @type {Guid}
     */
    static IID => Guid("{019f7152-e6db-11d0-83c3-00c04fddb82e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "GetJMorphResult", "GetConversionModeCaps", "GetPhonetic", "GetConversion"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifelanguage-open
     */
    Open() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifelanguage-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRequest 
     * @param {Integer} dwCMode 
     * @param {Integer} cwchInput 
     * @param {PWSTR} pwchInput 
     * @param {Pointer<Integer>} pfCInfo 
     * @param {Pointer<Pointer<MORRSLT>>} ppResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifelanguage-getjmorphresult
     */
    GetJMorphResult(dwRequest, dwCMode, cwchInput, pwchInput, pfCInfo, ppResult) {
        pwchInput := pwchInput is String ? StrPtr(pwchInput) : pwchInput

        pfCInfoMarshal := pfCInfo is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwRequest, "uint", dwCMode, "int", cwchInput, "ptr", pwchInput, pfCInfoMarshal, pfCInfo, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifelanguage-getconversionmodecaps
     */
    GetConversionModeCaps(pdwCaps) {
        pdwCapsMarshal := pdwCaps is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwCapsMarshal, pdwCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} string 
     * @param {Integer} start 
     * @param {Integer} length 
     * @param {Pointer<BSTR>} phonetic 
     * @returns {HRESULT} 
     */
    GetPhonetic(string, start, length, phonetic) {
        string := string is String ? BSTR.Alloc(string).Value : string

        result := ComCall(7, this, "ptr", string, "int", start, "int", length, "ptr", phonetic, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} string 
     * @param {Integer} start 
     * @param {Integer} length 
     * @param {Pointer<BSTR>} result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifelanguage-getconversion
     */
    GetConversion(string, start, length, result) {
        string := string is String ? BSTR.Alloc(string).Value : string

        result := ComCall(8, this, "ptr", string, "int", start, "int", length, "ptr", result, "HRESULT")
        return result
    }
}
