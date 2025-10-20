#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpEnginePronunciation extends IUnknown{
    /**
     * The interface identifier for ISpEnginePronunciation
     * @type {Guid}
     */
    static IID => Guid("{c360ce4b-76d1-4214-ad68-52657d5083da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {PWSTR} pszLeftContext 
     * @param {PWSTR} pszRightContext 
     * @param {Integer} LangID 
     * @param {Pointer<SPNORMALIZATIONLIST>} pNormalizationList 
     * @returns {HRESULT} 
     */
    Normalize(pszWord, pszLeftContext, pszRightContext, LangID, pNormalizationList) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord
        pszLeftContext := pszLeftContext is String ? StrPtr(pszLeftContext) : pszLeftContext
        pszRightContext := pszRightContext is String ? StrPtr(pszRightContext) : pszRightContext

        result := ComCall(3, this, "ptr", pszWord, "ptr", pszLeftContext, "ptr", pszRightContext, "ushort", LangID, "ptr", pNormalizationList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {PWSTR} pszLeftContext 
     * @param {PWSTR} pszRightContext 
     * @param {Integer} LangID 
     * @param {Pointer<SPWORDPRONUNCIATIONLIST>} pEnginePronunciationList 
     * @returns {HRESULT} 
     */
    GetPronunciations(pszWord, pszLeftContext, pszRightContext, LangID, pEnginePronunciationList) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord
        pszLeftContext := pszLeftContext is String ? StrPtr(pszLeftContext) : pszLeftContext
        pszRightContext := pszRightContext is String ? StrPtr(pszRightContext) : pszRightContext

        result := ComCall(4, this, "ptr", pszWord, "ptr", pszLeftContext, "ptr", pszRightContext, "ushort", LangID, "ptr", pEnginePronunciationList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
