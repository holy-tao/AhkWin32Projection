#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognizercontext
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognizerContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRecognizerContext
     * @type {Guid}
     */
    static IID => Guid("{c68f52f9-32a3-4625-906c-44fc23b40958}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Strokes", "putref_Strokes", "get_CharacterAutoCompletionMode", "put_CharacterAutoCompletionMode", "get_Factoid", "put_Factoid", "get_Guide", "putref_Guide", "get_PrefixText", "put_PrefixText", "get_SuffixText", "put_SuffixText", "get_RecognitionFlags", "put_RecognitionFlags", "get_WordList", "putref_WordList", "get_Recognizer", "Recognize", "StopBackgroundRecognition", "EndInkInput", "BackgroundRecognize", "BackgroundRecognizeWithAlternates", "Clone", "IsStringSupported"]

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes
     */
    get_Strokes(Strokes) {
        result := ComCall(7, this, "ptr*", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokes} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-putref_strokes
     */
    putref_Strokes(Strokes) {
        result := ComCall(8, this, "ptr", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_characterautocompletionmode
     */
    get_CharacterAutoCompletionMode(Mode) {
        result := ComCall(9, this, "int*", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-put_characterautocompletionmode
     */
    put_CharacterAutoCompletionMode(Mode) {
        result := ComCall(10, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Factoid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_factoid
     */
    get_Factoid(Factoid) {
        result := ComCall(11, this, "ptr", Factoid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} factoid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-put_factoid
     */
    put_Factoid(factoid) {
        factoid := factoid is String ? BSTR.Alloc(factoid).Value : factoid

        result := ComCall(12, this, "ptr", factoid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizerGuide>} RecognizerGuide 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_guide
     */
    get_Guide(RecognizerGuide) {
        result := ComCall(13, this, "ptr*", RecognizerGuide, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRecognizerGuide} RecognizerGuide 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-putref_guide
     */
    putref_Guide(RecognizerGuide) {
        result := ComCall(14, this, "ptr", RecognizerGuide, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Prefix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_prefixtext
     */
    get_PrefixText(Prefix) {
        result := ComCall(15, this, "ptr", Prefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Prefix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-put_prefixtext
     */
    put_PrefixText(Prefix) {
        Prefix := Prefix is String ? BSTR.Alloc(Prefix).Value : Prefix

        result := ComCall(16, this, "ptr", Prefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Suffix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_suffixtext
     */
    get_SuffixText(Suffix) {
        result := ComCall(17, this, "ptr", Suffix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Suffix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-put_suffixtext
     */
    put_SuffixText(Suffix) {
        Suffix := Suffix is String ? BSTR.Alloc(Suffix).Value : Suffix

        result := ComCall(18, this, "ptr", Suffix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Modes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_recognitionflags
     */
    get_RecognitionFlags(Modes) {
        result := ComCall(19, this, "int*", Modes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Modes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-put_recognitionflags
     */
    put_RecognitionFlags(Modes) {
        result := ComCall(20, this, "int", Modes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkWordList>} WordList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_wordlist
     */
    get_WordList(WordList) {
        result := ComCall(21, this, "ptr*", WordList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkWordList} WordList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-putref_wordlist
     */
    putref_WordList(WordList) {
        result := ComCall(22, this, "ptr", WordList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizer>} Recognizer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_recognizer
     */
    get_Recognizer(Recognizer) {
        result := ComCall(23, this, "ptr*", Recognizer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} RecognitionStatus 
     * @param {Pointer<IInkRecognitionResult>} RecognitionResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-recognize
     */
    Recognize(RecognitionStatus, RecognitionResult) {
        result := ComCall(24, this, "int*", RecognitionStatus, "ptr*", RecognitionResult, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-stopbackgroundrecognition
     */
    StopBackgroundRecognition() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * Indicates that no more ink will be added to the context.You cannot add strokes to the context after calling this function.
     * @returns {HRESULT} This function can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer context handle is invalid or null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-endinkinput
     */
    EndInkInput() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} CustomData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-backgroundrecognize
     */
    BackgroundRecognize(CustomData) {
        result := ComCall(27, this, "ptr", CustomData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} CustomData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-backgroundrecognizewithalternates
     */
    BackgroundRecognizeWithAlternates(CustomData) {
        result := ComCall(28, this, "ptr", CustomData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizerContext>} RecoContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-clone
     */
    Clone(RecoContext) {
        result := ComCall(29, this, "ptr*", RecoContext, "HRESULT")
        return result
    }

    /**
     * Returns a value that indicates whether a word, date, time, number, or other text that is passed in is contained in the dictionary.The results of this test depend on the factoid setting.
     * @param {BSTR} String 
     * @param {Pointer<VARIANT_BOOL>} Supported 
     * @returns {HRESULT} This function can return one of these values.
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
     * Success.
     * 
     * This function also returns S_OK if the recognizer does not support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to complete the operation.
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
     * The string is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-isstringsupported
     */
    IsStringSupported(String, Supported) {
        String := String is String ? BSTR.Alloc(String).Value : String

        result := ComCall(30, this, "ptr", String, "ptr", Supported, "HRESULT")
        return result
    }
}
