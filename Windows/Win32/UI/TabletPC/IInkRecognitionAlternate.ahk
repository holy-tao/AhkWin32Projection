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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_string
     */
    get_String() {
        RecoString := BSTR()
        result := ComCall(7, this, "ptr", RecoString, "HRESULT")
        return RecoString
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_confidence
     */
    get_Confidence() {
        result := ComCall(8, this, "int*", &Confidence := 0, "HRESULT")
        return Confidence
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_baseline
     */
    get_Baseline() {
        Baseline := VARIANT()
        result := ComCall(9, this, "ptr", Baseline, "HRESULT")
        return Baseline
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_midline
     */
    get_Midline() {
        Midline := VARIANT()
        result := ComCall(10, this, "ptr", Midline, "HRESULT")
        return Midline
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_ascender
     */
    get_Ascender() {
        Ascender := VARIANT()
        result := ComCall(11, this, "ptr", Ascender, "HRESULT")
        return Ascender
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_descender
     */
    get_Descender() {
        Descender := VARIANT()
        result := ComCall(12, this, "ptr", Descender, "HRESULT")
        return Descender
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linenumber
     */
    get_LineNumber() {
        result := ComCall(13, this, "int*", &LineNumber := 0, "HRESULT")
        return LineNumber
    }

    /**
     * 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_strokes
     */
    get_Strokes() {
        result := ComCall(14, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * 
     * @returns {IInkRecognitionAlternates} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_linealternates
     */
    get_LineAlternates() {
        result := ComCall(15, this, "ptr*", &LineAlternates := 0, "HRESULT")
        return IInkRecognitionAlternates(LineAlternates)
    }

    /**
     * 
     * @returns {IInkRecognitionAlternates} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_confidencealternates
     */
    get_ConfidenceAlternates() {
        result := ComCall(16, this, "ptr*", &ConfidenceAlternates := 0, "HRESULT")
        return IInkRecognitionAlternates(ConfidenceAlternates)
    }

    /**
     * 
     * @param {IInkStrokes} Strokes 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-getstrokesfromstrokeranges
     */
    GetStrokesFromStrokeRanges(Strokes) {
        result := ComCall(17, this, "ptr", Strokes, "ptr*", &GetStrokesFromStrokeRanges := 0, "HRESULT")
        return IInkStrokes(GetStrokesFromStrokeRanges)
    }

    /**
     * 
     * @param {Pointer<Integer>} selectionStart 
     * @param {Pointer<Integer>} selectionLength 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-getstrokesfromtextrange
     */
    GetStrokesFromTextRange(selectionStart, selectionLength) {
        selectionStartMarshal := selectionStart is VarRef ? "int*" : "ptr"
        selectionLengthMarshal := selectionLength is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, selectionStartMarshal, selectionStart, selectionLengthMarshal, selectionLength, "ptr*", &GetStrokesFromTextRange := 0, "HRESULT")
        return IInkStrokes(GetStrokesFromTextRange)
    }

    /**
     * 
     * @param {IInkStrokes} Strokes 
     * @param {Pointer<Integer>} selectionStart 
     * @param {Pointer<Integer>} selectionLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-gettextrangefromstrokes
     */
    GetTextRangeFromStrokes(Strokes, selectionStart, selectionLength) {
        selectionStartMarshal := selectionStart is VarRef ? "int*" : "ptr"
        selectionLengthMarshal := selectionLength is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "ptr", Strokes, selectionStartMarshal, selectionStart, selectionLengthMarshal, selectionLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} PropertyType 
     * @returns {IInkRecognitionAlternates} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-alternateswithconstantpropertyvalues
     */
    AlternatesWithConstantPropertyValues(PropertyType) {
        PropertyType := PropertyType is String ? BSTR.Alloc(PropertyType).Value : PropertyType

        result := ComCall(20, this, "ptr", PropertyType, "ptr*", &AlternatesWithConstantPropertyValues := 0, "HRESULT")
        return IInkRecognitionAlternates(AlternatesWithConstantPropertyValues)
    }

    /**
     * 
     * @param {BSTR} PropertyType 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-getpropertyvalue
     */
    GetPropertyValue(PropertyType) {
        PropertyType := PropertyType is String ? BSTR.Alloc(PropertyType).Value : PropertyType

        PropertyValue := VARIANT()
        result := ComCall(21, this, "ptr", PropertyType, "ptr", PropertyValue, "HRESULT")
        return PropertyValue
    }
}
