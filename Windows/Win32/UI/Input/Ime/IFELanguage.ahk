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
     * 
     * @returns {HRESULT} 
     */
    Open() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRequest 
     * @param {Integer} dwCMode 
     * @param {Integer} cwchInput 
     * @param {PWSTR} pwchInput 
     * @param {Pointer<UInt32>} pfCInfo 
     * @param {Pointer<MORRSLT>} ppResult 
     * @returns {HRESULT} 
     */
    GetJMorphResult(dwRequest, dwCMode, cwchInput, pwchInput, pfCInfo, ppResult) {
        pwchInput := pwchInput is String ? StrPtr(pwchInput) : pwchInput

        result := ComCall(5, this, "uint", dwRequest, "uint", dwCMode, "int", cwchInput, "ptr", pwchInput, "uint*", pfCInfo, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCaps 
     * @returns {HRESULT} 
     */
    GetConversionModeCaps(pdwCaps) {
        result := ComCall(6, this, "uint*", pdwCaps, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(7, this, "ptr", string, "int", start, "int", length, "ptr", phonetic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} string 
     * @param {Integer} start 
     * @param {Integer} length 
     * @param {Pointer<BSTR>} result 
     * @returns {HRESULT} 
     */
    GetConversion(string, start, length, result) {
        string := string is String ? BSTR.Alloc(string).Value : string

        result := ComCall(8, this, "ptr", string, "int", start, "int", length, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
