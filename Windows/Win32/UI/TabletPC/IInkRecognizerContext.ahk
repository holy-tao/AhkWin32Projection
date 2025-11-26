#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IInkStrokes.ahk
#Include .\IInkRecognizerGuide.ahk
#Include .\IInkWordList.ahk
#Include .\IInkRecognizer.ahk
#Include .\IInkRecognitionResult.ahk
#Include .\IInkRecognizerContext.ahk
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
     * @type {IInkStrokes} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * @type {Integer} 
     */
    CharacterAutoCompletionMode {
        get => this.get_CharacterAutoCompletionMode()
        set => this.put_CharacterAutoCompletionMode(value)
    }

    /**
     * @type {BSTR} 
     */
    Factoid {
        get => this.get_Factoid()
        set => this.put_Factoid(value)
    }

    /**
     * @type {IInkRecognizerGuide} 
     */
    Guide {
        get => this.get_Guide()
    }

    /**
     * @type {BSTR} 
     */
    PrefixText {
        get => this.get_PrefixText()
        set => this.put_PrefixText(value)
    }

    /**
     * @type {BSTR} 
     */
    SuffixText {
        get => this.get_SuffixText()
        set => this.put_SuffixText(value)
    }

    /**
     * @type {Integer} 
     */
    RecognitionFlags {
        get => this.get_RecognitionFlags()
        set => this.put_RecognitionFlags(value)
    }

    /**
     * @type {IInkWordList} 
     */
    WordList {
        get => this.get_WordList()
    }

    /**
     * @type {IInkRecognizer} 
     */
    Recognizer {
        get => this.get_Recognizer()
    }

    /**
     * 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes
     */
    get_Strokes() {
        result := ComCall(7, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_characterautocompletionmode
     */
    get_CharacterAutoCompletionMode() {
        result := ComCall(9, this, "int*", &Mode := 0, "HRESULT")
        return Mode
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_factoid
     */
    get_Factoid() {
        Factoid := BSTR()
        result := ComCall(11, this, "ptr", Factoid, "HRESULT")
        return Factoid
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
     * @returns {IInkRecognizerGuide} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_guide
     */
    get_Guide() {
        result := ComCall(13, this, "ptr*", &RecognizerGuide := 0, "HRESULT")
        return IInkRecognizerGuide(RecognizerGuide)
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_prefixtext
     */
    get_PrefixText() {
        Prefix := BSTR()
        result := ComCall(15, this, "ptr", Prefix, "HRESULT")
        return Prefix
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_suffixtext
     */
    get_SuffixText() {
        Suffix := BSTR()
        result := ComCall(17, this, "ptr", Suffix, "HRESULT")
        return Suffix
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_recognitionflags
     */
    get_RecognitionFlags() {
        result := ComCall(19, this, "int*", &Modes := 0, "HRESULT")
        return Modes
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
     * @returns {IInkWordList} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_wordlist
     */
    get_WordList() {
        result := ComCall(21, this, "ptr*", &WordList := 0, "HRESULT")
        return IInkWordList(WordList)
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
     * @returns {IInkRecognizer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_recognizer
     */
    get_Recognizer() {
        result := ComCall(23, this, "ptr*", &Recognizer := 0, "HRESULT")
        return IInkRecognizer(Recognizer)
    }

    /**
     * 
     * @param {Pointer<Integer>} RecognitionStatus 
     * @returns {IInkRecognitionResult} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-recognize
     */
    Recognize(RecognitionStatus) {
        RecognitionStatusMarshal := RecognitionStatus is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, RecognitionStatusMarshal, RecognitionStatus, "ptr*", &RecognitionResult := 0, "HRESULT")
        return IInkRecognitionResult(RecognitionResult)
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
     * @returns {IInkRecognizerContext} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-clone
     */
    Clone() {
        result := ComCall(29, this, "ptr*", &RecoContext := 0, "HRESULT")
        return IInkRecognizerContext(RecoContext)
    }

    /**
     * Returns a value that indicates whether a word, date, time, number, or other text that is passed in is contained in the dictionary.The results of this test depend on the factoid setting.
     * @param {BSTR} String 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-isstringsupported
     */
    IsStringSupported(String) {
        String := String is String ? BSTR.Alloc(String).Value : String

        result := ComCall(30, this, "ptr", String, "short*", &Supported := 0, "HRESULT")
        return Supported
    }
}
