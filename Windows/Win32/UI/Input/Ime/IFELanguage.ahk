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
     * Initializes the IFELanguage object.
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifelanguage-open
     */
    Open() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Terminates the IFELanguage object.
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifelanguage-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Gets morphological analysis results.
     * @param {Integer} dwRequest 
     * @param {Integer} dwCMode Specifies the conversion output characters and conversion options. This value is a combination of one or more of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_MONORUBY"></a><a id="felang_cmode_monoruby"></a><dl>
     * <dt><b>FELANG_CMODE_MONORUBY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Mono-ruby.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_NOPRUNING"></a><a id="felang_cmode_nopruning"></a><dl>
     * <dt><b>FELANG_CMODE_NOPRUNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No pruning.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_KATAKANAOUT"></a><a id="felang_cmode_katakanaout"></a><dl>
     * <dt><b>FELANG_CMODE_KATAKANAOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Katakana output.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_HIRAGANAOUT"></a><a id="felang_cmode_hiraganaout"></a><dl>
     * <dt><b>FELANG_CMODE_HIRAGANAOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default output.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_HALFWIDTHOUT"></a><a id="felang_cmode_halfwidthout"></a><dl>
     * <dt><b>FELANG_CMODE_HALFWIDTHOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Half-width output.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_FULLWIDTHOUT"></a><a id="felang_cmode_fullwidthout"></a><dl>
     * <dt><b>FELANG_CMODE_FULLWIDTHOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Full-width output.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_BOPOMOFO"></a><a id="felang_cmode_bopomofo"></a><dl>
     * <dt><b>FELANG_CMODE_BOPOMOFO</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_HANGUL"></a><a id="felang_cmode_hangul"></a><dl>
     * <dt><b>FELANG_CMODE_HANGUL</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_PINYIN"></a><a id="felang_cmode_pinyin"></a><dl>
     * <dt><b>FELANG_CMODE_PINYIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_PRECONV"></a><a id="felang_cmode_preconv"></a><dl>
     * <dt><b>FELANG_CMODE_PRECONV</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do conversion as follows:
     * 
     * <ul>
     * <li>Roma-ji to kana.</li>
     * <li>Autocorrect before conversion.</li>
     * <li>Periods, comma, and brackets.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_RADICAL"></a><a id="felang_cmode_radical"></a><dl>
     * <dt><b>FELANG_CMODE_RADICAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_UNKNOWNREADING"></a><a id="felang_cmode_unknownreading"></a><dl>
     * <dt><b>FELANG_CMODE_UNKNOWNREADING</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_MERGECAND"></a><a id="felang_cmode_mergecand"></a><dl>
     * <dt><b>FELANG_CMODE_MERGECAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merge display with the same candidate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_ROMAN"></a><a id="felang_cmode_roman"></a><dl>
     * <dt><b>FELANG_CMODE_ROMAN</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_BESTFIRST"></a><a id="felang_cmode_bestfirst"></a><dl>
     * <dt><b>FELANG_CMODE_BESTFIRST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Make only the first best.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_USENOREVWORDS"></a><a id="felang_cmode_usenorevwords"></a><dl>
     * <dt><b>FELANG_CMODE_USENOREVWORDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use invalid revword on REV/RECONV.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_NONE"></a><a id="felang_cmode_none"></a><dl>
     * <dt><b>FELANG_CMODE_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_NONE</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_PLAURALCLAUSE"></a><a id="felang_cmode_plauralclause"></a><dl>
     * <dt><b>FELANG_CMODE_PLAURALCLAUSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_PLAURALCLAUSE</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_SINGLECONVERT"></a><a id="felang_cmode_singleconvert"></a><dl>
     * <dt><b>FELANG_CMODE_SINGLECONVERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_SINGLECONVERT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_AUTOMATIC"></a><a id="felang_cmode_automatic"></a><dl>
     * <dt><b>FELANG_CMODE_AUTOMATIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_AUTOMATIC</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_PHRASEPREDICT"></a><a id="felang_cmode_phrasepredict"></a><dl>
     * <dt><b>FELANG_CMODE_PHRASEPREDICT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_PHRASEPREDICT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_CONVERSATION"></a><a id="felang_cmode_conversation"></a><dl>
     * <dt><b>FELANG_CMODE_CONVERSATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_CONVERSATION</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_NAME"></a><a id="felang_cmode_name"></a><dl>
     * <dt><b>FELANG_CMODE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Name mode (MSKKIME).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_NOINVISIBLECHAR"></a><a id="felang_cmode_noinvisiblechar"></a><dl>
     * <dt><b>FELANG_CMODE_NOINVISIBLECHAR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remove invisible chars (for example, the tone mark).
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} cwchInput The number of characters in <i>pwchInput</i>.
     * @param {PWSTR} pwchInput Input characters to be converted by the morphology engine. This must be a UNICODE string.
     * 
     * Set this parameter to <b>NULL</b> to get the next entry for the previously input string, with the next rank. The order in which next entries are returned is defined by the implementation.
     * @param {Pointer<Integer>} pfCInfo The information for each column, where  each <i>pfCInfo[x]</i> corresponds to <i>pwchInput[x]</i>. Each  <b>DWORD</b> can be a combination of the flags below:
     * 
     * <a id="FELANG_CLMN_WBREAK"></a>
     * <a id="felang_clmn_wbreak"></a>
     * @param {Pointer<Pointer<MORRSLT>>} ppResult The address of a MORRSLT structure that receives the morphology result data.
     * 
     * <b>GetJMorphResult</b> allocates memory using the OLE task allocator for the returned data, and sets the <i>pResult</i> to point to the memory.
     * The application must free the memory pointed to by <i>pResult</i>, by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More candidates exist. If you call this function again with <i>pwchInput</i> equal to <b>NULL</b>, it will get the next best candidate for the previous <i>pwchInput</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No result.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOCAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more candidates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_LARGEINPUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * input too large.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Mutex timeout is occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifelanguage-getjmorphresult
     */
    GetJMorphResult(dwRequest, dwCMode, cwchInput, pwchInput, pfCInfo, ppResult) {
        pwchInput := pwchInput is String ? StrPtr(pwchInput) : pwchInput

        pfCInfoMarshal := pfCInfo is VarRef ? "uint*" : "ptr"
        ppResultMarshal := ppResult is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", dwRequest, "uint", dwCMode, "int", cwchInput, "ptr", pwchInput, pfCInfoMarshal, pfCInfo, ppResultMarshal, ppResult, "HRESULT")
        return result
    }

    /**
     * Gets the conversion mode capability of the IFELanguage object.
     * @param {Pointer<Integer>} pdwCaps The capabilities, represented as a combination of one or more of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_MONORUBY"></a><a id="felang_cmode_monoruby"></a><dl>
     * <dt><b>FELANG_CMODE_MONORUBY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Mono-ruby.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_NOPRUNING"></a><a id="felang_cmode_nopruning"></a><dl>
     * <dt><b>FELANG_CMODE_NOPRUNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No pruning.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_KATAKANAOUT"></a><a id="felang_cmode_katakanaout"></a><dl>
     * <dt><b>FELANG_CMODE_KATAKANAOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Katakana output.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_HIRAGANAOUT"></a><a id="felang_cmode_hiraganaout"></a><dl>
     * <dt><b>FELANG_CMODE_HIRAGANAOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default output.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_HALFWIDTHOUT"></a><a id="felang_cmode_halfwidthout"></a><dl>
     * <dt><b>FELANG_CMODE_HALFWIDTHOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Half-width output.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_FULLWIDTHOUT"></a><a id="felang_cmode_fullwidthout"></a><dl>
     * <dt><b>FELANG_CMODE_FULLWIDTHOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Full-width output.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_BOPOMOFO"></a><a id="felang_cmode_bopomofo"></a><dl>
     * <dt><b>FELANG_CMODE_BOPOMOFO</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_HANGUL"></a><a id="felang_cmode_hangul"></a><dl>
     * <dt><b>FELANG_CMODE_HANGUL</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_PINYIN"></a><a id="felang_cmode_pinyin"></a><dl>
     * <dt><b>FELANG_CMODE_PINYIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_PRECONV"></a><a id="felang_cmode_preconv"></a><dl>
     * <dt><b>FELANG_CMODE_PRECONV</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do conversion as follows:
     * 
     * <ul>
     * <li>Roma-ji to kana.</li>
     * <li>Autocorrect before conversion.</li>
     * <li>Periods, comma, and brackets.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_RADICAL"></a><a id="felang_cmode_radical"></a><dl>
     * <dt><b>FELANG_CMODE_RADICAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_UNKNOWNREADING"></a><a id="felang_cmode_unknownreading"></a><dl>
     * <dt><b>FELANG_CMODE_UNKNOWNREADING</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_MERGECAND"></a><a id="felang_cmode_mergecand"></a><dl>
     * <dt><b>FELANG_CMODE_MERGECAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merge display with the same candidate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_ROMAN"></a><a id="felang_cmode_roman"></a><dl>
     * <dt><b>FELANG_CMODE_ROMAN</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_BESTFIRST"></a><a id="felang_cmode_bestfirst"></a><dl>
     * <dt><b>FELANG_CMODE_BESTFIRST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Make only the first best.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_USENOREVWORDS"></a><a id="felang_cmode_usenorevwords"></a><dl>
     * <dt><b>FELANG_CMODE_USENOREVWORDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use invalid revword on REV/RECONV.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_NONE"></a><a id="felang_cmode_none"></a><dl>
     * <dt><b>FELANG_CMODE_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_NONE</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_PLAURALCLAUSE"></a><a id="felang_cmode_plauralclause"></a><dl>
     * <dt><b>FELANG_CMODE_PLAURALCLAUSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_PLAURALCLAUSE</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_SINGLECONVERT"></a><a id="felang_cmode_singleconvert"></a><dl>
     * <dt><b>FELANG_CMODE_SINGLECONVERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_SINGLECONVERT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_AUTOMATIC"></a><a id="felang_cmode_automatic"></a><dl>
     * <dt><b>FELANG_CMODE_AUTOMATIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_AUTOMATIC</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_PHRASEPREDICT"></a><a id="felang_cmode_phrasepredict"></a><dl>
     * <dt><b>FELANG_CMODE_PHRASEPREDICT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_PHRASEPREDICT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_CONVERSATION"></a><a id="felang_cmode_conversation"></a><dl>
     * <dt><b>FELANG_CMODE_CONVERSATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME_SMODE_CONVERSATION</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_NAME"></a><a id="felang_cmode_name"></a><dl>
     * <dt><b>FELANG_CMODE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Name mode (MSKKIME).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FELANG_CMODE_NOINVISIBLECHAR"></a><a id="felang_cmode_noinvisiblechar"></a><dl>
     * <dt><b>FELANG_CMODE_NOINVISIBLECHAR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remove invisible chars (for example, the tone mark).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifelanguage-getconversionmodecaps
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
     * Converts the input string (which usually contains the Hiragana character) to converted strings.
     * @param {BSTR} string A string of phonetic characters to convert.
     * @param {Integer} start The starting character from which <a href="https://docs.microsoft.com/windows/desktop/api/msime/nn-msime-ifelanguage">IFELanguage</a> begins conversion. The first character of <i>string</i> is represented by 1 (not 0).
     * @param {Integer} length The number of characters to convert. If this value is -1, all of the remaining characters from <i>start</i>  are converted.
     * @param {Pointer<BSTR>} result The converted string. This string is allocated by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstringlen">SysAllocStringLen</a> and must be freed by the client.
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifelanguage-getconversion
     */
    GetConversion(string, start, length, result) {
        string := string is String ? BSTR.Alloc(string).Value : string

        result := ComCall(8, this, "ptr", string, "int", start, "int", length, "ptr", result, "HRESULT")
        return result
    }
}
