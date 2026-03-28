#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IInkStrokes.ahk
#Include .\IInkRecognitionAlternates.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents the possible word matches for segments of ink that are compared to a recognizers dictionary.
 * @remarks
 * A recognition segment is a basic ink fragment or unit that the recognizer uses internally to produce a recognition result for a known <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The segments are usually determined by spacing and are broken down into the smallest possible ink fragments.
 * 
 * Sometimes the ink may have ambiguous distinctions between segments. These segments are compared to a recognizer's dictionary to determine possible matches (alternates). When the segments are compared, the recognizer creates a list of possible alternates and assigns a confidence level to each one, picking a top choice.
 * 
 * For instance, consider the phrase "how are you". This phrase is probably broken into three segments (depending on the spacing between segments), one for each word.
 * 
 * When each segment is recognized, a <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionresult">RecognitionResult</a> is created. Each result then returns a list of alternates to choose from. For instance, the segment "how" may have alternates like "how", "now", "new", and so on, with "how" being the top alternate. By default, the top alternate is returned for each segment. You can choose to return alternates other than the top alternate.
 * 
 * You can also return alternates that are based on the properties of the alternates, such as the confidence level of the recognition result, the line number on which the alternates appear, and so on. See the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">RecognitionProperty</a> object for a list of the recognition properties.
 * 
 * Alternates of alternates can also be returned.
 * 
 * Not all recognizers set all of the properties listed above. When an application attempts to access a property that is not set by the recognizer, an argument exception is thrown.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkrecognitionalternate
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognitionAlternate extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRecognitionAlternate
     * @type {Guid}
     */
    static IID => Guid("{b7e660ad-77e4-429b-adda-873780d1fc4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_String", "get_Confidence", "get_Baseline", "get_Midline", "get_Ascender", "get_Descender", "get_LineNumber", "get_Strokes", "get_LineAlternates", "get_ConfidenceAlternates", "GetStrokesFromStrokeRanges", "GetStrokesFromTextRange", "GetTextRangeFromStrokes", "AlternatesWithConstantPropertyValues", "GetPropertyValue"]

    /**
     * @type {BSTR} 
     */
    String {
        get => this.get_String()
    }

    /**
     * @type {Integer} 
     */
    Confidence {
        get => this.get_Confidence()
    }

    /**
     * @type {VARIANT} 
     */
    Baseline {
        get => this.get_Baseline()
    }

    /**
     * @type {VARIANT} 
     */
    Midline {
        get => this.get_Midline()
    }

    /**
     * @type {VARIANT} 
     */
    Ascender {
        get => this.get_Ascender()
    }

    /**
     * @type {VARIANT} 
     */
    Descender {
        get => this.get_Descender()
    }

    /**
     * @type {Integer} 
     */
    LineNumber {
        get => this.get_LineNumber()
    }

    /**
     * @type {IInkStrokes} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * @type {IInkRecognitionAlternates} 
     */
    LineAlternates {
        get => this.get_LineAlternates()
    }

    /**
     * @type {IInkRecognitionAlternates} 
     */
    ConfidenceAlternates {
        get => this.get_ConfidenceAlternates()
    }

    /**
     * Gets the top string of the alternate.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_string
     */
    get_String() {
        RecoString := BSTR()
        result := ComCall(7, this, "ptr", RecoString, "HRESULT")
        return RecoString
    }

    /**
     * Gets the level of confidence (strong, intermediate, or poor) that a recognizer has in the recognition of an IInkRecognitionAlternate object or a gesture. (IInkRecognitionAlternate.get_Confidence)
     * @remarks
     * For a list of confidence values that may be returned, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognitionconfidence">InkRecognitionConfidence</a> enumeration type.
     * 
     * <div class="alert"><b>Note</b>  Confidence evaluation is available for all gesture recognizers in the current release of Windows XP Tablet PC Edition.</div>
     * <div> </div>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionalternate">IInkRecognitionAlternate Interface</a> object:
     * 
     * If the alternate represents a phrase or sentence, the value represents the lowest confidence level of a recognition segment found in the phrase or sentence. However, if the alternate represents a word, the value represents the confidence level of the word.
     * 
     * <div class="alert"><b>Note</b>  This property throws an exception if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer Interface</a> that generates the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionalternate">IInkRecognitionAlternate Interface</a> does not support confidence levels.</div>
     * <div> </div>
     * Of the Microsoft recognizers, only the Microsoft English (US) Handwriting Recognizer and the Microsoft Gesture Recognizer support confidence levels. Third party recognizers may or may not support confidence levels.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_confidence
     */
    get_Confidence() {
        result := ComCall(8, this, "int*", &Confidence := 0, "HRESULT")
        return Confidence
    }

    /**
     * Gets the baseline for a IInkRecognitionAlternate object that represents a single line of text.
     * @remarks
     * The baseline is the imaginary horizontal line with which the base of each character, excluding decenders, is aligned. It also corresponds to the bottom of the x-height.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">If the recognition alternate spans more than one recognition segment within a line of text, then this property returns a line that begins at the first point of the baseline of the first segment in the alternate and ends at the last point of the baseline of the last segment in the alternate.
     * 
     * <p class="note">You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues">AlternatesWithConstantPropertyValues</a> method with the <i>propertyType</i> parameter set to the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">Segmentation</a> recognition property globally unique identifier (GUID) to get a collection of one segment recognition alternates that correspond to a segmentation of your original alternate.
     * 
     * </div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  If the recognition alternate spans more than one line, this property generates an E_FAIL error. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linealternates">LineAlternates</a> property to get a collection of one line recognition alternates that corresponds to a multiple line recognition alternate.</div>
     * <div> </div>
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_baseline
     */
    get_Baseline() {
        Baseline := VARIANT()
        result := ComCall(9, this, "ptr", Baseline, "HRESULT")
        return Baseline
    }

    /**
     * Gets the midline for a IInkRecognitionAlternate object that represents a single line of text.
     * @remarks
     * The midline corresponds to an imaginary horizontal line with which the top of the main body of each character, excluding <i>ascender</i>, is aligned. The midline also corresponds to the top of the x-height.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">If the recognition alternate  spans more than one recognition segment within a line of text, then this property returns a line parallel to the baseline for the alternate. The distance of the midline above the baseline is determined by the corresponding distance within the first segment.
     * 
     * <p class="note">You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues">AlternatesWithConstantPropertyValues</a> method with the <i>propertyType</i> parameter set to the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">Segmentation</a> recognition property globally unique identifier (GUID) to get a collection of one segment recognition alternates that correspond to a segmentation of your original alternate.
     * 
     * </div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  If the recognition alternate spans more than one line, this property generates an E_FAIL error. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linealternates">LineAlternates</a> property to get a collection of one line recognition alternates that corresponds to a multiple line recognition alternate.</div>
     * <div> </div>
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_midline
     */
    get_Midline() {
        Midline := VARIANT()
        result := ComCall(10, this, "ptr", Midline, "HRESULT")
        return Midline
    }

    /**
     * Gets the ascender line for a IInkRecognitionAlternate object that represents a single line of text.
     * @remarks
     * For western languages, the ascender corresponds to the portion of a lowercase letter that extends above the main body (the midline or x-height) of that letter such as the vertical line of a "b" that extends above the highest point of the circle in that letter. The ascender line is the imaginary horizontal line across the top of the ascenders.
     * 
     * <div class="alert"><b>Note</b>  If the recognition alternate spans more than one recognition segment within a line of text, then this property will return a line parallel to the baseline for the alternate. The distance of the ascender line above the baseline is determined by the corresponding distance within the first segment.You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues">AlternatesWithConstantPropertyValues</a> method with the <i>propertyType</i> parameter set to the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">Segmentation</a> recognition property globally unique identifier (GUID) to get a collection of one segment recognition alternates that correspond to a segmentation of your original alternate.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  If the recognition alternate spans more than one line, this property generates an E_FAIL error. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linealternates">LineAlternates</a> property to get a collection of one line recognition alternates that corresponds to a multiple line recognition alternate.</div>
     * <div> </div>
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_ascender
     */
    get_Ascender() {
        Ascender := VARIANT()
        result := ComCall(11, this, "ptr", Ascender, "HRESULT")
        return Ascender
    }

    /**
     * Gets the descender line for an IInkRecognitionAlternate object that represents a single line of text.
     * @remarks
     * For western languages, the descender corresponds to the portion of a lowercase letter that falls below the baseline, such as the vertical line of a "p" that extends below the lowest point of the circle in that letter. The descender line is the imaginary horizontal line across the bottom of the descenders.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">If the recognition alternate spans more than one recognition segment within a line of text, then this property returns a line parallel to the baseline for the alternate. The distance of the descender line below the baseline is determined by the corresponding distance within the first segment.
     * 
     * <p class="note">You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues">AlternatesWithConstantPropertyValues</a> method with the <i>propertyType</i> parameter set to the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">Segmentation</a> recognition property globally unique identifier (GUID) to get a collection of one segment recognition alternates that correspond to a segmentation of your original alternate.
     * 
     * </div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  If the recognition alternate spans more than one line, this property generates an E_FAIL error. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linealternates">LineAlternates</a> property to get a collection of one line recognition alternates that corresponds to a multiple line recognition alternate.</div>
     * <div> </div>
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_descender
     */
    get_Descender() {
        Descender := VARIANT()
        result := ComCall(12, this, "ptr", Descender, "HRESULT")
        return Descender
    }

    /**
     * Gets the line number of the ink that makes up the alternate.
     * @remarks
     * Line numbers begin with 1.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">Recognizer</a> object automatically determines the metrics for how lines are spaced.</div>
     * <div> </div>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linenumber
     */
    get_LineNumber() {
        result := ComCall(13, this, "int*", &LineNumber := 0, "HRESULT")
        return LineNumber
    }

    /**
     * Gets the collection of strokes that are contained in an object or used to create an object. (IInkRecognitionAlternate.get_Strokes)
     * @remarks
     * The collection of strokes may be the copies of the strokes contained in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object or the strokes that were used to create the object or collection.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes">Strokes</a> property for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object does not return the actual collection that the <b>InkDisp</b> object works with, but instead returns a copy. For example, this means that adding or removing strokes to this collection does not affect the <b>InkDisp</b> object's strokes; to add or remove strokes, use <b>InkDisp</b> methods such as <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-addstrokesatrectangle">AddStrokesAtRectangle</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestroke">DeleteStroke</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestrokes">DeleteStrokes</a>. However, each stroke in the collection is a reference to the original <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object.</div>
     * <div> </div>
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_strokes
     */
    get_Strokes() {
        result := ComCall(14, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Gets the IInkRecognitionAlternates collection in which each alternate in the collection is on a separate line.
     * @remarks
     * If you have a recognition alternate for a paragraph of ink, you can use the <b>LineAlternates</b> property to get a collection of recognition alternates in which each alternate represents a separate line of the paragraph.
     * 
     * This property is an alternative to calling the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues">AlternatesWithConstantPropertyValues</a> method with the <i>propertyType</i> parameter set to the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">LineNumber</a> value of the RecognitionProperty constants. For more information about properties of alternates see the RecognitionProperty constants.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a> object automatically determines the line metrics when drawing ink.</div>
     * <div> </div>
     * @returns {IInkRecognitionAlternates} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linealternates
     */
    get_LineAlternates() {
        result := ComCall(15, this, "ptr*", &LineAlternates := 0, "HRESULT")
        return IInkRecognitionAlternates(LineAlternates)
    }

    /**
     * Gets the collection of alternates in which each alternate in the collection consists of the segments with the same property values.
     * @remarks
     * This property is an alternative to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues">AlternatesWithConstantPropertyValues</a> method. For more information about properties of alternates, see the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">RecognitionProperty</a> constants.
     * @returns {IInkRecognitionAlternates} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_confidencealternates
     */
    get_ConfidenceAlternates() {
        result := ComCall(16, this, "ptr*", &ConfidenceAlternates := 0, "HRESULT")
        return IInkRecognitionAlternates(ConfidenceAlternates)
    }

    /**
     * Retrieves the smallest InkStrokes collection that contains a known input InkStrokes collection and for which the IInkRecognizer object can provide alternates.
     * @remarks
     * The returned collection may match the input collection, or it may be larger if the input collection matches only part of the smallest recognition result that includes all of the input strokes.
     * 
     * This method is most useful for single-click word selection. For example, to return the strokes that make up the word you clicked, you can click a stroke, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-hittestcircle">HitTest</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object to retrieve the stroke that was clicked, and then call <b>GetStrokesFromStrokeRanges</b>.
     * 
     * The stroke ranges are valid until the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object is modified.
     * @param {IInkStrokes} Strokes The collection of stroke objects to use to find the smallest stroke collection of the recognition result alternate that contains this collection.
     * @returns {IInkStrokes} When this method returns, contains a pointer to the smallest collection of strokes that contains a known input collection of strokes and for which the recognizer can provide alternates.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-getstrokesfromstrokeranges
     */
    GetStrokesFromStrokeRanges(Strokes) {
        result := ComCall(17, this, "ptr", Strokes, "ptr*", &GetStrokesFromStrokeRanges := 0, "HRESULT")
        return IInkStrokes(GetStrokesFromStrokeRanges)
    }

    /**
     * Retrieves the collection that corresponds to the smallest set of recognition segments that contains a specified character range within the alternate.
     * @remarks
     * To further clarify <b>GetStrokesFromTextRange</b>, consider a collection of strokes that has been recognized and for which the best alternate for those strokes is "how are you". The parameter passed to the method is some range within (or possibly all of) this string result. This alternate contains five segments, one for each word and one for each space. The strokes returned correspond to the smallest set of segments that include all of the input range. If the <i>selectionStart</i> parameter is 0, and the <i>selectionLength</i> parameter is 5, creating a range corresponding to the "how a" of the result string, then the strokes returned are all of the recognized strokes that make up the segments "how are". This is the smallest set of segments that includes the input range.
     * 
     * In both word and character based recognizers, spaces are counted as a character. If the input selection corresponds to a space character, then this method returns and empty <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * @param {Pointer<Integer>} selectionStart The start of the character range within this alternate. The character at the <i>selectionStart</i> position is included in the range of recognized text. This parameter is adjusted to the beginning of the smallest recognized set of one or more segments that includes the input selection. The <i>selectionStart</i> parameter is a zero-based index into the characters in the recognition alternate's text.
     * @param {Pointer<Integer>} selectionLength The length of the character range within the alternate. This parameter must be greater than 0. This parameter is adjusted to the length of the smallest set of one or more segments that includes the input selection.
     * @returns {IInkStrokes} Upon return, contains  a pointer to the collection of strokes that corresponds to the known range of recognized text.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-getstrokesfromtextrange
     */
    GetStrokesFromTextRange(selectionStart, selectionLength) {
        selectionStartMarshal := selectionStart is VarRef ? "int*" : "ptr"
        selectionLengthMarshal := selectionLength is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, selectionStartMarshal, selectionStart, selectionLengthMarshal, selectionLength, "ptr*", &GetStrokesFromTextRange := 0, "HRESULT")
        return IInkStrokes(GetStrokesFromTextRange)
    }

    /**
     * Retrieves the smallest range of recognized text for which the recognizer can return an alternate that contains a known InkStrokes collection.
     * @remarks
     * Use this method to retrieve the text that corresponds to a specified range of strokes. For example, consider a collection of strokes, "how are you", that was drawn using nine strokes (one for each letter and three for each word). If a collection that consists of the sixth and seventh strokes is passed in, corresponding to characters "e" and "y", the text range returned matches the alternate containing "are you" and the selection start and length matches this substring.
     * @param {IInkStrokes} Strokes The collection of strokes for which to find the containing alternate.
     * @param {Pointer<Integer>} selectionStart The start position of the range of recognized text within the alternate object on which this method was called that matches the smallest alternate that contains the passed-in strokes.
     * @param {Pointer<Integer>} selectionLength When this method returns, contains the length of the text within the range of recognized text of the smallest alternate that contains the passed-in strokes.
     * @returns {HRESULT} If successful, returns S_OK; otherwise, returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-gettextrangefromstrokes
     */
    GetTextRangeFromStrokes(Strokes, selectionStart, selectionLength) {
        selectionStartMarshal := selectionStart is VarRef ? "int*" : "ptr"
        selectionLengthMarshal := selectionLength is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "ptr", Strokes, selectionStartMarshal, selectionStart, selectionLengthMarshal, selectionLength, "HRESULT")
        return result
    }

    /**
     * Retrieves a IInkRecognitionAlternates collection, which are a division of the IInkRecognitionAlternate object on which this method is called.
     * @remarks
     * Each alternate in the collection contains adjacent recognition segments which have the same property value for the property passed into the method.
     * 
     * For example, you can return alternates that divide the original alternate by:
     * 
     * <ul>
     * <li>Level of confidence boundaries-strong, intermediate, or poor-in the recognition result.</li>
     * <li>Line boundaries.</li>
     * <li>Recognition segment boundaries.</li>
     * </ul>
     * For a complete list of property types, see <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">RecognitionProperty</a>.
     * 
     * <div class="alert"><b>Note</b>  The recognizer determines the segmentation of strokes into the recognition segments. Some recognition segments, such as spaces, may correspond to an empty <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  The recognizer determines the ordering of the recognition segments. Therefore, adjacent recognition segments may be based on the order in which the ink was drawn or based on location, such as whether it is positioned left-to-right, positioned top-to-bottom, and so on.</div>
     * <div> </div>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_confidencealternates">ConfidenceAlternates</a> property is an alternative to the <b>AlternatesWithConstantPropertyValues</b> method, where <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">ConfidenceLevel</a> is the RecognitionProperty that separates the alternates in the returned recognition alternates collection.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linealternates">LineAlternates</a> property is an alternative to the <b>AlternatesWithConstantPropertyValues</b> method, where <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">LineNumber</a> is the RecognitionProperty that separates the alternates in the returned recognition alternates collection.
     * 
     * <div class="alert"><b>Note</b>  The <b>AlternatesWithConstantPropertyValues</b> method, the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linealternates">LineAlternates</a> property, and the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_confidencealternates">ConfidenceAlternates</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionalternate">IInkRecognitionAlternate</a> object function differently than the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms698186(v=vs.85)">AlternatesFromSelection</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionresult">IInkRecognitionResult</a> object. <b>AlternatesFromSelection</b> returns a collection of alternates for the requested segments of the recognition result.</div>
     * <div> </div>
     * @param {BSTR} PropertyType Specifies a string value that identifies the property. For a list of the properties that can be used, see <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">RecognitionProperty</a>.
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {IInkRecognitionAlternates} When this method returns, contains an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionalternates">IInkRecognitionAlternates</a> collection which is made up of a division of the alternate on which this method is called. Each <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionalternate">IInkRecognitionAlternate</a> object in the collection contains adjacent recognition segments which have the same property value for the <i>propertyType</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues
     */
    AlternatesWithConstantPropertyValues(PropertyType) {
        PropertyType := PropertyType is String ? BSTR.Alloc(PropertyType).Value : PropertyType

        result := ComCall(20, this, "ptr", PropertyType, "ptr*", &AlternatesWithConstantPropertyValues := 0, "HRESULT")
        return IInkRecognitionAlternates(AlternatesWithConstantPropertyValues)
    }

    /**
     * Retrieves the value of a specified property of the alternate.
     * @remarks
     * Use this method to obtain property values for <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">RecognitionProperty</a> objects that have no corresponding helper property, such as the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_confidence">Confidence</a> and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linenumber">LineNumber</a> properties.
     * @param {BSTR} PropertyType Specifies which property of the alternate to return, as one of the GUIDs from the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">RecognitionProperty</a> object.
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-getpropertyvalue
     */
    GetPropertyValue(PropertyType) {
        PropertyType := PropertyType is String ? BSTR.Alloc(PropertyType).Value : PropertyType

        _PropertyValue := VARIANT()
        result := ComCall(21, this, "ptr", PropertyType, "ptr", _PropertyValue, "HRESULT")
        return _PropertyValue
    }
}
