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
     * Gets or sets the InkStrokes collection associated with the InkRecognizerContext object.
     * @remarks
     * 
     * You can set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection more than once. Each time you set the InkStrokes collection, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object is reset-any ink or results are removed and any prior calls to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-endinkinput">EndInkInput Method</a> method are disregarded-and then the new strokes are added.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection can also be set to <b>NULL</b>, which also resets the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object. When the <b>InkRecognizerContext</b> is reset, it keeps any guides, factoids, and other properties which previously had been set on it.
     * 
     * When the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object is reset, any recognition taking place on the background thread is canceled.
     * 
     * To keep the <b>Strokes</b> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object synchronized with an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object, use the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-inkadded">InkAdded</a> and <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-inkdeleted">InkDeleted</a> events of the <b>InkDisp</b> object to listen for strokes that should be added or removed from the <b>InkRecognizerContext</b> object. This covers cases where strokes are added to, deleted from, clipped, or split within the <b>InkDisp</b> object.
     * 
     * <div class="alert"><b>Note</b>  Moving, scaling, or other transformations on strokes in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object do not generate <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-inkadded">InkAdded</a> or <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-inkdeleted">InkDeleted</a> events. Perform the same transformations on the strokes in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object to keep the <b>Strokes</b> property of the <b>InkRecognizerContext</b> object synchronized.</div>
     * <div> </div>
     * 
     * 
     * @returns {IInkStrokes} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes
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
     * Gets or sets the character Autocomplete mode, which determines when characters or words are recognized.
     * @remarks
     * 
     * Recognition can occur in <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognizercharacterautocompletionmode">Full</a> mode (all strokes have been inputted), <b>Partial</b> mode (partial input in specific order), or <b>Random</b> mode (partial input in random order).
     * 
     * For a list of the character Autocomplete mode values that you can use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognizercharacterautocompletionmode">InkRecognizerCharacterAutoCompletionMode</a> enumeration type.
     * 
     * You cannot turn character Autocomplete off after it is set.
     * 
     * You must set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_guide">Guide</a> property before using this property.
     * 
     * Some recognizers do not support character Autocomplete. The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognizercapabilities">InkRecognizerCapabilities</a> enumeration contains flags for features a recognizer can support. You can determine if the recognizer supports character Autocomplete by checking the value of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizer-get_capabilities">Capabilities</a> property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-get_characterautocompletionmode
     */
    get_CharacterAutoCompletionMode() {
        result := ComCall(9, this, "int*", &Mode := 0, "HRESULT")
        return Mode
    }

    /**
     * Gets or sets the character Autocomplete mode, which determines when characters or words are recognized.
     * @remarks
     * 
     * Recognition can occur in <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognizercharacterautocompletionmode">Full</a> mode (all strokes have been inputted), <b>Partial</b> mode (partial input in specific order), or <b>Random</b> mode (partial input in random order).
     * 
     * For a list of the character Autocomplete mode values that you can use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognizercharacterautocompletionmode">InkRecognizerCharacterAutoCompletionMode</a> enumeration type.
     * 
     * You cannot turn character Autocomplete off after it is set.
     * 
     * You must set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_guide">Guide</a> property before using this property.
     * 
     * Some recognizers do not support character Autocomplete. The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognizercapabilities">InkRecognizerCapabilities</a> enumeration contains flags for features a recognizer can support. You can determine if the recognizer supports character Autocomplete by checking the value of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizer-get_capabilities">Capabilities</a> property.
     * 
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-put_characterautocompletionmode
     */
    put_CharacterAutoCompletionMode(Mode) {
        result := ComCall(10, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * Gets or sets the factoid that a recognizer uses to constrain its search for the recognition result.
     * @remarks
     * 
     * A factoid provides recognizer context for recognized ink in the context of a particular field. You specify a factoid if an input field is of a known type, for example, if the input field contains a date.
     * 
     * For more information about factoids and how to use them, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-context-to-improve-accuracy">Improving Tablet PC Recognition Accuracy by Setting Context</a>.
     * 
     * Setting the <b>Factoid</b> succeeds only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection is <b>NULL</b>. You must set the <b>Factoid</b> before you attach the InkStrokes collection to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> or you must set the Strokes collection to <b>NULL</b> and then set the <b>Factoid</b> (and possibly reattach the InkStrokes collection).
     * 
     * To ensure that ink is recognized in the correct field context, set this property before processing the ink for the first time, such as before calling the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-recognize">Recognize</a> method.
     * 
     * <div class="alert"><b>Note</b>  All factoids are case sensitive.</div>
     * <div> </div>
     * This property takes or returns a string parameter and not a class object of the <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">Factoid</a> class. The members of this class are of type <b>string</b>.
     * 
     * For the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control, this property should only be changed if the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_status">Status</a> property returns <a href="https://docs.microsoft.com/windows/desktop/api/inked/ne-inked-inkeditstatus">IES_Idle</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-get_factoid
     */
    get_Factoid() {
        Factoid := BSTR()
        result := ComCall(11, this, "ptr", Factoid, "HRESULT")
        return Factoid
    }

    /**
     * Gets or sets the factoid that a recognizer uses to constrain its search for the recognition result.
     * @remarks
     * 
     * A factoid provides recognizer context for recognized ink in the context of a particular field. You specify a factoid if an input field is of a known type, for example, if the input field contains a date.
     * 
     * For more information about factoids and how to use them, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-context-to-improve-accuracy">Improving Tablet PC Recognition Accuracy by Setting Context</a>.
     * 
     * Setting the <b>Factoid</b> succeeds only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection is <b>NULL</b>. You must set the <b>Factoid</b> before you attach the InkStrokes collection to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> or you must set the Strokes collection to <b>NULL</b> and then set the <b>Factoid</b> (and possibly reattach the InkStrokes collection).
     * 
     * To ensure that ink is recognized in the correct field context, set this property before processing the ink for the first time, such as before calling the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-recognize">Recognize</a> method.
     * 
     * <div class="alert"><b>Note</b>  All factoids are case sensitive.</div>
     * <div> </div>
     * This property takes or returns a string parameter and not a class object of the <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">Factoid</a> class. The members of this class are of type <b>string</b>.
     * 
     * For the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control, this property should only be changed if the <a href="https://docs.microsoft.com/windows/desktop/api/inked/nf-inked-iinkedit-get_status">Status</a> property returns <a href="https://docs.microsoft.com/windows/desktop/api/inked/ne-inked-inkeditstatus">IES_Idle</a>.
     * 
     * 
     * @param {BSTR} factoid 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-put_factoid
     */
    put_Factoid(factoid) {
        factoid := factoid is String ? BSTR.Alloc(factoid).Value : factoid

        result := ComCall(12, this, "ptr", factoid, "HRESULT")
        return result
    }

    /**
     * Gets or sets the InkRecognizerGuide to use for ink input.
     * @remarks
     * 
     * Setting the <b>Guide</b> property succeeds only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection is <b>NULL</b>. You must set the <b>Guide</b> property before you attach the InkStrokes collection to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> or you must set the InkStrokes collection to <b>NULL</b> and then set the <b>Guide</b> (and possible reattach the InkStrokes collection).
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognizercapabilities">InkRecognizerCapabilities</a> enumeration contains the <b>IRC_FreeInput</b>, <b>IRC_LinedInput</b>, and <b>IRC_BoxedInput</b> flags. These flags specify the capabilities of a recognizer, but because they are read only, there is no way to set any of these directly on a <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a> or <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object. The only way to put a recognizer into a specific mode is to set the guide using the <b>Guide</b> property. If you do not set the <b>Guide</b> property, the recognizer defaults to <b>FreeInput</b> mode (if the recognizer is capable of this). Another way to set the recognizer into <b>FreeInput</b> mode is to set the <b>Guide</b> property to a <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizerguide-class">InkRecognizerGuide</a> object that has its <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_columns">Columns</a> property set to zero and its <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_rows">Rows</a> property set to zero.
     * 
     * If you set the <b>Guide</b> property to a <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizerguide-class">InkRecognizerGuide</a> object that has its <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_columns">Columns</a> property set to zero and its <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_rows">Rows</a> property set to 1 or more, the recognizer is in <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognizercapabilities">IRC_LinedInput</a> mode (if the recognizer is capable of this). The recognizer uses the <b>Rows</b> property to control the number of lines.
     * 
     * If you set the <b>Guide</b> property to a <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizerguide-class">InkRecognizerGuide</a> object that has its <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_rows">Rows</a> property set to zero and its <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_columns">Columns</a> property set to 1 or more, the recognizer is in <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognizercapabilities">IRC_LinedInput</a> mode (if the recognizer is capable of this) for vertical writing. The recognizer uses the <b>Columns</b> property to control the number of vertical lines. If the recognizer is capable of this, the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizer-get_capabilities">Capabilities</a> property returns either <b>IRC_DownAndLeft</b> or <b>IRC_DownAndRight</b>, or both.
     * 
     * If you set the <b>Guide</b> property to a <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizerguide-class">InkRecognizerGuide</a> object that has its <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_columns">Columns</a> property set to 1 or more and its <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_rows">Rows</a> property set to 1 or more, the recognizer is in <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognizercapabilities">IRC_BoxedInput</a> mode (if the recognizer is capable of this).
     * 
     * If you set the mode to one that is not available from this recognizer, an error is returned.
     * 
     * For information about how to query which capabilities, or modes, are available from a specific recognizer, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizer-get_capabilities">Capabilities</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a> object. In general, recognizers of Latin script support free input and horizontal lined input, recognizers of East Asian characters support free input and boxed input, and the gesture recognizer only supports free input.
     * 
     * 
     * @returns {IInkRecognizerGuide} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-get_guide
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
     * Gets or sets the characters that come before the InkStrokes collection in the InkRecognizerContext object.
     * @remarks
     * 
     * The prefix helps improve recognition results by supplying the recognizer with more context about the handwriting.
     * 
     * Setting the <b>PrefixText</b> property succeeds only if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes">Strokes</a> property is <b>NULL</b>. You must set the <b>PrefixText</b> property before you attach a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection to the <b>Strokes</b> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a>, or you must set the <b>Strokes</b> property to <b>NULL</b> and then set the <b>PrefixText</b> property.
     * 
     * <div class="alert"><b>Note</b>  If you use the latter method, you may need to reattach the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes">Strokes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object.</div>
     * <div> </div>
     * Setting the <b>PrefixText</b> property to <b>NULL</b> removes any prefix text from the recognizer context.
     * 
     * The prefix text is ignored unless you have set both the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognitionmodes">IRM_Coerce</a> and <b>IRM_WordMode</b><b>InkRecognitionModes</b> flags in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_recognitionflags">RecognitionFlags</a> property.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_suffixtext">SuffixText</a> property gets or sets the characters that come after the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object and also helps improve the recognition result.
     * 
     * If your application provides a correction interface when converting ink to text, the application may allow the user to select characters within a word and use the stylus to generate replacement characters. Your application can use the <b>PrefixText</b> and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_suffixtext">SuffixText</a> properties to improve recognition of the new ink.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-get_prefixtext
     */
    get_PrefixText() {
        Prefix := BSTR()
        result := ComCall(15, this, "ptr", Prefix, "HRESULT")
        return Prefix
    }

    /**
     * Gets or sets the characters that come before the InkStrokes collection in the InkRecognizerContext object.
     * @remarks
     * 
     * The prefix helps improve recognition results by supplying the recognizer with more context about the handwriting.
     * 
     * Setting the <b>PrefixText</b> property succeeds only if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes">Strokes</a> property is <b>NULL</b>. You must set the <b>PrefixText</b> property before you attach a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection to the <b>Strokes</b> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a>, or you must set the <b>Strokes</b> property to <b>NULL</b> and then set the <b>PrefixText</b> property.
     * 
     * <div class="alert"><b>Note</b>  If you use the latter method, you may need to reattach the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes">Strokes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object.</div>
     * <div> </div>
     * Setting the <b>PrefixText</b> property to <b>NULL</b> removes any prefix text from the recognizer context.
     * 
     * The prefix text is ignored unless you have set both the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognitionmodes">IRM_Coerce</a> and <b>IRM_WordMode</b><b>InkRecognitionModes</b> flags in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_recognitionflags">RecognitionFlags</a> property.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_suffixtext">SuffixText</a> property gets or sets the characters that come after the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object and also helps improve the recognition result.
     * 
     * If your application provides a correction interface when converting ink to text, the application may allow the user to select characters within a word and use the stylus to generate replacement characters. Your application can use the <b>PrefixText</b> and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_suffixtext">SuffixText</a> properties to improve recognition of the new ink.
     * 
     * 
     * @param {BSTR} Prefix 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-put_prefixtext
     */
    put_PrefixText(Prefix) {
        Prefix := Prefix is String ? BSTR.Alloc(Prefix).Value : Prefix

        result := ComCall(16, this, "ptr", Prefix, "HRESULT")
        return result
    }

    /**
     * Gets or sets the characters that come after the InkStrokes collection in the InkRecognizerContext object.
     * @remarks
     * 
     * The suffix helps improve recognition results by supplying the recognizer with more context about the handwriting.
     * 
     * Setting the <b>SuffixText</b> property succeeds only if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes">Strokes</a> property is <b>NULL</b>. You must set the <b>SuffixText</b> property before you attach an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection to the <b>Strokes</b> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a>, or you must set the <b>Strokes</b> property to <b>NULL</b> and then set the <b>SuffixText</b> property.
     * 
     * <div class="alert"><b>Note</b>  If you use the latter method, you may need to reattach the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes">Strokes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object.</div>
     * <div> </div>
     * Setting the <b>SuffixText</b> property to <b>NULL</b> removes any suffix text from the recognizer context.
     * 
     * The suffix text is ignored unless you have set both the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognitionmodes">Coerce</a> and <b>WordMode</b><b>InkRecognitionModes</b> flags in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_recognitionflags">RecognitionFlags</a> property.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_prefixtext">PrefixText</a> property gets or sets the characters that come before the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object and also helps improve the recognition result.
     * 
     * If your application provides a correction interface when converting ink to text, the application may allow the user to select characters within a word and use the stylus to generate replacement characters. Your application can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_prefixtext">PrefixText</a> and <b>SuffixText</b> properties to improve recognition of the new ink.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-get_suffixtext
     */
    get_SuffixText() {
        Suffix := BSTR()
        result := ComCall(17, this, "ptr", Suffix, "HRESULT")
        return Suffix
    }

    /**
     * Gets or sets the characters that come after the InkStrokes collection in the InkRecognizerContext object.
     * @remarks
     * 
     * The suffix helps improve recognition results by supplying the recognizer with more context about the handwriting.
     * 
     * Setting the <b>SuffixText</b> property succeeds only if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes">Strokes</a> property is <b>NULL</b>. You must set the <b>SuffixText</b> property before you attach an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection to the <b>Strokes</b> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a>, or you must set the <b>Strokes</b> property to <b>NULL</b> and then set the <b>SuffixText</b> property.
     * 
     * <div class="alert"><b>Note</b>  If you use the latter method, you may need to reattach the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes">Strokes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object.</div>
     * <div> </div>
     * Setting the <b>SuffixText</b> property to <b>NULL</b> removes any suffix text from the recognizer context.
     * 
     * The suffix text is ignored unless you have set both the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognitionmodes">Coerce</a> and <b>WordMode</b><b>InkRecognitionModes</b> flags in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_recognitionflags">RecognitionFlags</a> property.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_prefixtext">PrefixText</a> property gets or sets the characters that come before the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object and also helps improve the recognition result.
     * 
     * If your application provides a correction interface when converting ink to text, the application may allow the user to select characters within a word and use the stylus to generate replacement characters. Your application can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_prefixtext">PrefixText</a> and <b>SuffixText</b> properties to improve recognition of the new ink.
     * 
     * 
     * @param {BSTR} Suffix 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-put_suffixtext
     */
    put_SuffixText(Suffix) {
        Suffix := Suffix is String ? BSTR.Alloc(Suffix).Value : Suffix

        result := ComCall(18, this, "ptr", Suffix, "HRESULT")
        return result
    }

    /**
     * Gets or sets the flags that specify how the recognizer interprets the ink and determines the result string.
     * @remarks
     * 
     * The <b>RecognitionFlags</b> property gets or sets flags that specify things such as whether the recognizer treats all ink as a single word or whether the recognizer coerces the result based on the factoid that you specified for the context.
     * 
     * Setting the <b>RecognitionFlags</b> property succeeds only if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes">Strokes</a> property is <b>NULL</b>.
     * 
     * For a list of modes that you can use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognitionmodes">InkRecognitionModes</a> enumeration type.
     * 
     * <div class="alert"><b>Note</b>  You can combine modes using the bitwise <b>OR</b> operator.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-get_recognitionflags
     */
    get_RecognitionFlags() {
        result := ComCall(19, this, "int*", &Modes := 0, "HRESULT")
        return Modes
    }

    /**
     * Gets or sets the flags that specify how the recognizer interprets the ink and determines the result string.
     * @remarks
     * 
     * The <b>RecognitionFlags</b> property gets or sets flags that specify things such as whether the recognizer treats all ink as a single word or whether the recognizer coerces the result based on the factoid that you specified for the context.
     * 
     * Setting the <b>RecognitionFlags</b> property succeeds only if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes">Strokes</a> property is <b>NULL</b>.
     * 
     * For a list of modes that you can use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognitionmodes">InkRecognitionModes</a> enumeration type.
     * 
     * <div class="alert"><b>Note</b>  You can combine modes using the bitwise <b>OR</b> operator.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} Modes 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-put_recognitionflags
     */
    put_RecognitionFlags(Modes) {
        result := ComCall(20, this, "int", Modes, "HRESULT")
        return result
    }

    /**
     * Gets or sets the word list that is used in the recognition process to improve the recognition results.
     * @remarks
     * 
     * Setting this property succeeds only if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes">Strokes</a> property is <b>NULL</b>. You must set the <b>WordList</b> property before you attach an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection to the <b>Strokes</b> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> or you must set the <b>Strokes</b> property to <b>NULL</b> and then set the <b>WordList</b> property (and possibly reattach the InkStrokes collection).
     * 
     * To remove the current word list and use the user dictionary, set this property to <b>NULL</b>. Any subsequent modification of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkwordlist-class">InkWordList</a> object does not modify the recognition outcome. If you want to change the word list, first set this property to <b>NULL</b>, modify the InkWordList, and then re-attach it to the InkRecognizerContext by assigning it to the <b>WordList</b> property.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_factoid">Factoid</a> property to limit the search to the word list that is associated with the context. You may also need to set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_recognitionflags">RecognitionFlags</a> property to improve the results.
     * 
     * Wordlist cannot be set after a factoid is set. This prevents a factoid from referring to a possibly non existent wordlist. Attempting to do so will result in an E_FAIL HRESULT value.
     * 
     * If a string is added to a word list, its capitalized versions are also implicitly added. For instance, adding "hello" implicitly adds "Hello" and "HELLO".
     * 
     * Using words longer than 256 characters will result in an E_POINTER exception when assigning the <b>WordList</b> property to <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a>.
     * 
     * 
     * @returns {IInkWordList} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-get_wordlist
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
     * Gets the IInkRecognizer object used by the InkRecognizerContext object.
     * @returns {IInkRecognizer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-get_recognizer
     */
    get_Recognizer() {
        result := ComCall(23, this, "ptr*", &Recognizer := 0, "HRESULT")
        return IInkRecognizer(Recognizer)
    }

    /**
     * Performs recognition on an InkStrokes collection and returns recognition results.
     * @param {Pointer<Integer>} RecognitionStatus The most recent <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognitionstatus">InkRecognitionStatus</a> value.
     * @returns {IInkRecognitionResult} When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionresult">IInkRecognitionResult</a> results of a recognized collection of strokes, or else <b>NULL</b> if the recognizer could not compute a result for the ink.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-recognize
     */
    Recognize(RecognitionStatus) {
        RecognitionStatusMarshal := RecognitionStatus is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, RecognitionStatusMarshal, RecognitionStatus, "ptr*", &RecognitionResult := 0, "HRESULT")
        return IInkRecognitionResult(RecognitionResult)
    }

    /**
     * Ends background recognition that was started with a call to BackgroundRecognize or BackgroundRecognizeWithAlternates.
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
     * Success.
     * 
     * This method also returns S_OK if the recognizer does not support this method.
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
     * Cannot allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-stopbackgroundrecognition
     */
    StopBackgroundRecognition() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * EndInkInput is no longer available for use for recognizers of western languages as of Windows Vista.
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
     * Success.
     *               
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
     * Cannot allocate memory to complete the operation.
     *               
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-endinkinput
     */
    EndInkInput() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * Causes the IInkRecognizer object to recognize the associated strokes collection and fire a Recognition event when recognition is complete.
     * @param {VARIANT} CustomData Specifies any application-defined data that is available to the application in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-recognition">Recognition</a> event. This parameter may be a VARIANT of type VT_EMPTY or VT_NULL if no data needs to be passed. The default value is <b>NULL</b>.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
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
     * Success.
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
     * Cannot allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_NO_STROKES_TO_RECOGNIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No strokes exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-backgroundrecognize
     */
    BackgroundRecognize(CustomData) {
        result := ComCall(27, this, "ptr", CustomData, "HRESULT")
        return result
    }

    /**
     * Causes the IInkRecognizer object to recognize the associated strokes collection and fire a RecognitionWithAlternates event when recognition is complete.
     * @param {VARIANT} CustomData Optional. Specifies any application-defined data that is available to the application in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-recognitionwithalternates">RecognitionWithAlternates</a> event. This parameter may be a VARIANT of type VT_EMPTY or VT_NULL if no data needs to be passed. The default value is <b>NULL</b>.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT Value</th>
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_NO_STROKES_TO_RECOGNIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No strokes exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-backgroundrecognizewithalternates
     */
    BackgroundRecognizeWithAlternates(CustomData) {
        result := ComCall(28, this, "ptr", CustomData, "HRESULT")
        return result
    }

    /**
     * Creates a duplicate InkRecognizerContext object.
     * @returns {IInkRecognizerContext} When this method returns, contains the newly created <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-clone
     */
    Clone() {
        result := ComCall(29, this, "ptr*", &RecoContext := 0, "HRESULT")
        return IInkRecognizerContext(RecoContext)
    }

    /**
     * Indicates whether the system dictionary, user dictionary, or word list contain a specified string.
     * @param {BSTR} String The string to look up in the dictionaries and word list.
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {VARIANT_BOOL} When this method returns, contains <b>VARIANT_TRUE</b> if the string is in the dictionary or word list; otherwise <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizercontext-isstringsupported
     */
    IsStringSupported(String) {
        String := String is String ? BSTR.Alloc(String).Value : String

        result := ComCall(30, this, "ptr", String, "short*", &Supported := 0, "HRESULT")
        return Supported
    }
}
