#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} RecoString 
     * @returns {HRESULT} 
     */
    get_String(RecoString) {
        result := ComCall(7, this, "ptr", RecoString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Confidence 
     * @returns {HRESULT} 
     */
    get_Confidence(Confidence) {
        result := ComCall(8, this, "int*", Confidence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Baseline 
     * @returns {HRESULT} 
     */
    get_Baseline(Baseline) {
        result := ComCall(9, this, "ptr", Baseline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Midline 
     * @returns {HRESULT} 
     */
    get_Midline(Midline) {
        result := ComCall(10, this, "ptr", Midline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Ascender 
     * @returns {HRESULT} 
     */
    get_Ascender(Ascender) {
        result := ComCall(11, this, "ptr", Ascender, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Descender 
     * @returns {HRESULT} 
     */
    get_Descender(Descender) {
        result := ComCall(12, this, "ptr", Descender, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} LineNumber 
     * @returns {HRESULT} 
     */
    get_LineNumber(LineNumber) {
        result := ComCall(13, this, "int*", LineNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    get_Strokes(Strokes) {
        result := ComCall(14, this, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognitionAlternates>} LineAlternates 
     * @returns {HRESULT} 
     */
    get_LineAlternates(LineAlternates) {
        result := ComCall(15, this, "ptr", LineAlternates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognitionAlternates>} ConfidenceAlternates 
     * @returns {HRESULT} 
     */
    get_ConfidenceAlternates(ConfidenceAlternates) {
        result := ComCall(16, this, "ptr", ConfidenceAlternates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @param {Pointer<IInkStrokes>} GetStrokesFromStrokeRanges 
     * @returns {HRESULT} 
     */
    GetStrokesFromStrokeRanges(Strokes, GetStrokesFromStrokeRanges) {
        result := ComCall(17, this, "ptr", Strokes, "ptr", GetStrokesFromStrokeRanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} selectionStart 
     * @param {Pointer<Int32>} selectionLength 
     * @param {Pointer<IInkStrokes>} GetStrokesFromTextRange 
     * @returns {HRESULT} 
     */
    GetStrokesFromTextRange(selectionStart, selectionLength, GetStrokesFromTextRange) {
        result := ComCall(18, this, "int*", selectionStart, "int*", selectionLength, "ptr", GetStrokesFromTextRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @param {Pointer<Int32>} selectionStart 
     * @param {Pointer<Int32>} selectionLength 
     * @returns {HRESULT} 
     */
    GetTextRangeFromStrokes(Strokes, selectionStart, selectionLength) {
        result := ComCall(19, this, "ptr", Strokes, "int*", selectionStart, "int*", selectionLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PropertyType 
     * @param {Pointer<IInkRecognitionAlternates>} AlternatesWithConstantPropertyValues 
     * @returns {HRESULT} 
     */
    AlternatesWithConstantPropertyValues(PropertyType, AlternatesWithConstantPropertyValues) {
        PropertyType := PropertyType is String ? BSTR.Alloc(PropertyType).Value : PropertyType

        result := ComCall(20, this, "ptr", PropertyType, "ptr", AlternatesWithConstantPropertyValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PropertyType 
     * @param {Pointer<VARIANT>} PropertyValue 
     * @returns {HRESULT} 
     */
    GetPropertyValue(PropertyType, PropertyValue) {
        PropertyType := PropertyType is String ? BSTR.Alloc(PropertyType).Value : PropertyType

        result := ComCall(21, this, "ptr", PropertyType, "ptr", PropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
