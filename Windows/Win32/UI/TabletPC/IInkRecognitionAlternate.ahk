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
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognitionalternate
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-get_string
     */
    get_String() {
        RecoString := BSTR()
        result := ComCall(7, this, "ptr", RecoString, "HRESULT")
        return RecoString
    }

    /**
     * Gets the level of confidence (strong, intermediate, or poor) that a recognizer has in the recognition of an IInkRecognitionAlternate object or a gesture.
     * @remarks
     * 
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
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-get_confidence
     */
    get_Confidence() {
        result := ComCall(8, this, "int*", &Confidence := 0, "HRESULT")
        return Confidence
    }

    /**
     * Gets the baseline for a IInkRecognitionAlternate object that represents a single line of text.
     * @remarks
     * 
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
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-get_baseline
     */
    get_Baseline() {
        Baseline := VARIANT()
        result := ComCall(9, this, "ptr", Baseline, "HRESULT")
        return Baseline
    }

    /**
     * Gets the midline for a IInkRecognitionAlternate object that represents a single line of text.
     * @remarks
     * 
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
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-get_midline
     */
    get_Midline() {
        Midline := VARIANT()
        result := ComCall(10, this, "ptr", Midline, "HRESULT")
        return Midline
    }

    /**
     * Gets the ascender line for a IInkRecognitionAlternate object that represents a single line of text.
     * @remarks
     * 
     * For western languages, the ascender corresponds to the portion of a lowercase letter that extends above the main body (the midline or x-height) of that letter such as the vertical line of a "b" that extends above the highest point of the circle in that letter. The ascender line is the imaginary horizontal line across the top of the ascenders.
     * 
     * <div class="alert"><b>Note</b>  If the recognition alternate spans more than one recognition segment within a line of text, then this property will return a line parallel to the baseline for the alternate. The distance of the ascender line above the baseline is determined by the corresponding distance within the first segment.You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues">AlternatesWithConstantPropertyValues</a> method with the <i>propertyType</i> parameter set to the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">Segmentation</a> recognition property globally unique identifier (GUID) to get a collection of one segment recognition alternates that correspond to a segmentation of your original alternate.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  If the recognition alternate spans more than one line, this property generates an E_FAIL error. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linealternates">LineAlternates</a> property to get a collection of one line recognition alternates that corresponds to a multiple line recognition alternate.</div>
     * <div> </div>
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-get_ascender
     */
    get_Ascender() {
        Ascender := VARIANT()
        result := ComCall(11, this, "ptr", Ascender, "HRESULT")
        return Ascender
    }

    /**
     * Gets the decender line for an IInkRecognitionAlternate object that represents a single line of text.
     * @remarks
     * 
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
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-get_descender
     */
    get_Descender() {
        Descender := VARIANT()
        result := ComCall(12, this, "ptr", Descender, "HRESULT")
        return Descender
    }

    /**
     * Gets the line number of the ink that makes up the alternate.
     * @remarks
     * 
     * Line numbers begin with 1.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">Recognizer</a> object automatically determines the metrics for how lines are spaced.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linenumber
     */
    get_LineNumber() {
        result := ComCall(13, this, "int*", &LineNumber := 0, "HRESULT")
        return LineNumber
    }

    /**
     * Gets the collection of strokes that are contained in an object or used to create an object.
     * @remarks
     * 
     * The collection of strokes may be the copies of the strokes contained in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object or the strokes that were used to create the object or collection.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes">Strokes</a> property for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object does not return the actual collection that the <b>InkDisp</b> object works with, but instead returns a copy. For example, this means that adding or removing strokes to this collection does not affect the <b>InkDisp</b> object's strokes; to add or remove strokes, use <b>InkDisp</b> methods such as <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-addstrokesatrectangle">AddStrokesAtRectangle</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestroke">DeleteStroke</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestrokes">DeleteStrokes</a>. However, each stroke in the collection is a reference to the original <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object.</div>
     * <div> </div>
     * 
     * 
     * @returns {IInkStrokes} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-get_strokes
     */
    get_Strokes() {
        result := ComCall(14, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Gets the IInkRecognitionAlternates collection in which each alternate in the collection is on a separate line.
     * @remarks
     * 
     * If you have a recognition alternate for a paragraph of ink, you can use the <b>LineAlternates</b> property to get a collection of recognition alternates in which each alternate represents a separate line of the paragraph.
     * 
     * This property is an alternative to calling the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues">AlternatesWithConstantPropertyValues</a> method with the <i>propertyType</i> parameter set to the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">LineNumber</a> value of the RecognitionProperty constants. For more information about properties of alternates see the RecognitionProperty constants.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a> object automatically determines the line metrics when drawing ink.</div>
     * <div> </div>
     * 
     * 
     * @returns {IInkRecognitionAlternates} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linealternates
     */
    get_LineAlternates() {
        result := ComCall(15, this, "ptr*", &LineAlternates := 0, "HRESULT")
        return IInkRecognitionAlternates(LineAlternates)
    }

    /**
     * Gets the collection of alternates in which each alternate in the collection consists of the segments with the same property values.
     * @remarks
     * 
     * This property is an alternative to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues">AlternatesWithConstantPropertyValues</a> method. For more information about properties of alternates, see the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">RecognitionProperty</a> constants.
     * 
     * 
     * @returns {IInkRecognitionAlternates} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-get_confidencealternates
     */
    get_ConfidenceAlternates() {
        result := ComCall(16, this, "ptr*", &ConfidenceAlternates := 0, "HRESULT")
        return IInkRecognitionAlternates(ConfidenceAlternates)
    }

    /**
     * Retrieves the smallest InkStrokes collection that contains a known input InkStrokes collection and for which the IInkRecognizer object can provide alternates.
     * @param {IInkStrokes} Strokes The collection of stroke objects to use to find the smallest stroke collection of the recognition result alternate that contains this collection.
     * @returns {IInkStrokes} When this method returns, contains a pointer to the smallest collection of strokes that contains a known input collection of strokes and for which the recognizer can provide alternates.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-getstrokesfromstrokeranges
     */
    GetStrokesFromStrokeRanges(Strokes) {
        result := ComCall(17, this, "ptr", Strokes, "ptr*", &GetStrokesFromStrokeRanges := 0, "HRESULT")
        return IInkStrokes(GetStrokesFromStrokeRanges)
    }

    /**
     * Retrives the collection that corresponds to the smallest set of recognition segments that contains a specified character range within the alternate.
     * @param {Pointer<Integer>} selectionStart The start of the character range within this alternate. The character at the <i>selectionStart</i> position is included in the range of recognized text. This parameter is adjusted to the beginning of the smallest recognized set of one or more segments that includes the input selection. The <i>selectionStart</i> parameter is a zero-based index into the characters in the recognition alternate's text.
     * @param {Pointer<Integer>} selectionLength The length of the character range within the alternate. This parameter must be greater than 0. This parameter is adjusted to the length of the smallest set of one or more segments that includes the input selection.
     * @returns {IInkStrokes} Upon return, contains  a pointer to the collection of strokes that corresponds to the known range of recognized text.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-getstrokesfromtextrange
     */
    GetStrokesFromTextRange(selectionStart, selectionLength) {
        selectionStartMarshal := selectionStart is VarRef ? "int*" : "ptr"
        selectionLengthMarshal := selectionLength is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, selectionStartMarshal, selectionStart, selectionLengthMarshal, selectionLength, "ptr*", &GetStrokesFromTextRange := 0, "HRESULT")
        return IInkStrokes(GetStrokesFromTextRange)
    }

    /**
     * Retrieves the smallest range of recognized text for which the recognizer can return an alternate that contains a known InkStrokes collection.
     * @param {IInkStrokes} Strokes The collection of strokes for which to find the containing alternate.
     * @param {Pointer<Integer>} selectionStart The start position of the range of recognized text within the alternate object on which this method was called that matches the smallest alternate that contains the passed-in strokes.
     * @param {Pointer<Integer>} selectionLength When this method returns, contains the length of the text within the range of recognized text of the smallest alternate that contains the passed-in strokes.
     * @returns {HRESULT} If successful, returns S_OK; otherwise, returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-gettextrangefromstrokes
     */
    GetTextRangeFromStrokes(Strokes, selectionStart, selectionLength) {
        selectionStartMarshal := selectionStart is VarRef ? "int*" : "ptr"
        selectionLengthMarshal := selectionLength is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "ptr", Strokes, selectionStartMarshal, selectionStart, selectionLengthMarshal, selectionLength, "HRESULT")
        return result
    }

    /**
     * Retrieves a IInkRecognitionAlternates collection, which are a division of the IInkRecognitionAlternate object on which this method is called.
     * @param {BSTR} PropertyType Specifies a string value that identifies the property. For a list of the properties that can be used, see <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">RecognitionProperty</a>.
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {IInkRecognitionAlternates} When this method returns, contains an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionalternates">IInkRecognitionAlternates</a> collection which is made up of a division of the alternate on which this method is called. Each <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionalternate">IInkRecognitionAlternate</a> object in the collection contains adjacent recognition segments which have the same property value for the <i>propertyType</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues
     */
    AlternatesWithConstantPropertyValues(PropertyType) {
        PropertyType := PropertyType is String ? BSTR.Alloc(PropertyType).Value : PropertyType

        result := ComCall(20, this, "ptr", PropertyType, "ptr*", &AlternatesWithConstantPropertyValues := 0, "HRESULT")
        return IInkRecognitionAlternates(AlternatesWithConstantPropertyValues)
    }

    /**
     * Retrieves the value of a specified property of the alternate.
     * @param {BSTR} PropertyType Specifies which property of the alternate to return, as one of the GUIDs from the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">RecognitionProperty</a> object.
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {VARIANT} Upon return, contains the value of the property type as an array of bytes. this value is interpreted differently for each property type.
     * 
     * <table>
     * <tr>
     * <th>RecognitionProperty Type
     *               </th>
     * <th>Description
     *               </th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ConfidenceLevel_______________"></a><a id="confidencelevel_______________"></a><a id="CONFIDENCELEVEL_______________"></a><dl>
     * <dt><b>ConfidenceLevel
     *               </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * CONFIDENCE_LEVEL enumeration type.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HotPoint_______________"></a><a id="hotpoint_______________"></a><a id="HOTPOINT_______________"></a><dl>
     * <dt><b>HotPoint
     *               </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * POINT.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LineMetrics_______________"></a><a id="linemetrics_______________"></a><a id="LINEMETRICS_______________"></a><dl>
     * <dt><b>LineMetrics
     *               </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * LATTICE_METRICS structure.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LineNumber_______________"></a><a id="linenumber_______________"></a><a id="LINENUMBER_______________"></a><dl>
     * <dt><b>LineNumber
     *               </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ULONG.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MaximumStrokeCount_______________"></a><a id="maximumstrokecount_______________"></a><a id="MAXIMUMSTROKECOUNT_______________"></a><dl>
     * <dt><b>MaximumStrokeCount
     *               </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not used.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PointsPerInch_______________"></a><a id="pointsperinch_______________"></a><a id="POINTSPERINCH_______________"></a><dl>
     * <dt><b>PointsPerInch
     *               </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not used.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Segmentation_______________"></a><a id="segmentation_______________"></a><a id="SEGMENTATION_______________"></a><dl>
     * <dt><b>Segmentation
     *               </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not a value, returns TPC_E_INVALID_PROPERTY.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="S_OK_______________"></a><a id="s_ok_______________"></a><dl>
     * <dt><b>S_OK
     *               </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognitionalternate-getpropertyvalue
     */
    GetPropertyValue(PropertyType) {
        PropertyType := PropertyType is String ? BSTR.Alloc(PropertyType).Value : PropertyType

        PropertyValue := VARIANT()
        result := ComCall(21, this, "ptr", PropertyType, "ptr", PropertyValue, "HRESULT")
        return PropertyValue
    }
}
