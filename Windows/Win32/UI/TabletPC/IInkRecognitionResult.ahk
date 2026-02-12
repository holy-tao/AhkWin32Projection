#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IInkRecognitionAlternate.ahk
#Include .\IInkStrokes.ahk
#Include .\IInkRecognitionAlternates.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents the result of the recognition. The results of recognizing handwritten ink are returned in an IInkRecognitionResult object.
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionalternate">IInkRecognitionAlternate</a> objects, or alternates, are created from the result. The best, or top, alternate is the one that is used by the default in the result. However, you can use the methods of the <b>IInkRecognitionResult</b> object to specify which alternates to use in the result.
 * 
 * System performance can suffer if recognition results are automatically assigned to every collection of stroke. Therefore, by default, results are not attached to a collection of strokes. You must call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionresult-setresultonstrokes">SetResultOnStrokes</a> method to assign results to a collection of strokes.
 * 
 * The only way to persist recognition results is to call <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionresult-setresultonstrokes">SetResultOnStrokes</a> and then add this collection of strokes to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcustomstrokes">CustomStrokes</a> collection on the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
 * 
 * Not all recognizers set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topconfidence">TopConfidence</a> property. When an application attempts to access a property that is not set by the recognizer, an argument exception is thrown.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * 
 * <div class="alert"><b>Note</b>  The various handwriting recognizers shipped from Microsoft in both Latin characters  and East Asian languages can sometimes produce the Unicode value 0xFFFF as the recognition result. This occurs when the recognizer is unable to match a piece of ink with any valid character. The 0xFFFF code point is valid UCS-2, but not allowed in UTF-8. An application that converts recognition results to UTF-8, should replace 0xFFFF with some other code point, for example, 0xFFFD.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nn-msinkaut-iinkrecognitionresult
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognitionResult extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRecognitionResult
     * @type {Guid}
     */
    static IID => Guid("{3bc129a8-86cd-45ad-bde8-e0d32d61c16d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TopString", "get_TopAlternate", "get_TopConfidence", "get_Strokes", "AlternatesFromSelection", "ModifyTopAlternate", "SetResultOnStrokes"]

    /**
     * @type {BSTR} 
     */
    TopString {
        get => this.get_TopString()
    }

    /**
     * @type {IInkRecognitionAlternate} 
     */
    TopAlternate {
        get => this.get_TopAlternate()
    }

    /**
     * @type {Integer} 
     */
    TopConfidence {
        get => this.get_TopConfidence()
    }

    /**
     * @type {IInkStrokes} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * Gets the result text for the TopAlternate property.
     * @remarks
     * <div class="alert"><b>Note</b>  The result text for the <b>TopString</b> property changes if a call to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionresult-modifytopalternate">ModifyTopAlternate</a> method causes a change to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topalternate">TopAlternate</a> property.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topstring
     */
    get_TopString() {
        TopString := BSTR()
        result := ComCall(7, this, "ptr", TopString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TopString
    }

    /**
     * Gets the top alternate of the recognition result. (IInkRecognitionResult.get_TopAlternate)
     * @remarks
     * When the recognizer returns a recognition result, the recognition alternates are ranked from the highest confidence level to the lowest confidence level. The recognition alternate with the highest confidence level is selected as the top alternate.
     * 
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionresult-modifytopalternate">ModifyTopAlternate</a> method to change which recognition alternate is the top alternate.
     * @returns {IInkRecognitionAlternate} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topalternate
     */
    get_TopAlternate() {
        result := ComCall(8, this, "ptr*", &TopAlternate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInkRecognitionAlternate(TopAlternate)
    }

    /**
     * Gets the top alternate of the recognition result. (IInkRecognitionResult.get_TopConfidence)
     * @remarks
     * Of the Microsoft <b>recognizers</b>, only the Microsoft English (US) Handwriting Recognizer and the Microsoft Gesture Recognizer support confidence levels. Third party recognizers may or may not support confidence levels.
     * 
     * <div class="alert"><b>Note</b>  The <b>TopConfidence</b> property may change if a call to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionresult-modifytopalternate">ModifyTopAlternate</a> method causes a change to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topalternate">TopAlternate</a> property.</div>
     * <div> </div>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topconfidence
     */
    get_TopConfidence() {
        result := ComCall(9, this, "int*", &TopConfidence := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TopConfidence
    }

    /**
     * Gets the collection of strokes that are contained in an object or used to create an object. (IInkRecognitionResult.get_Strokes)
     * @remarks
     * The collection of strokes may be the copies of the strokes contained in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object or the strokes that were used to create the object or collection.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes">Strokes</a> property for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object does not return the actual collection that the <b>InkDisp</b> object works with, but instead returns a copy. For example, this means that adding or removing strokes to this collection does not affect the <b>InkDisp</b> object's strokes; to add or remove strokes, use <b>InkDisp</b> methods such as <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-addstrokesatrectangle">AddStrokesAtRectangle</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestroke">DeleteStroke</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestrokes">DeleteStrokes</a>. However, each stroke in the collection is a reference to the original <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object.</div>
     * <div> </div>
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkrecognitionresult-get_strokes
     */
    get_Strokes() {
        result := ComCall(10, this, "ptr*", &Strokes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInkStrokes(Strokes)
    }

    /**
     * 
     * @param {Integer} selectionStart 
     * @param {Integer} selectionLength 
     * @param {Integer} maximumAlternates 
     * @returns {IInkRecognitionAlternates} 
     */
    AlternatesFromSelection(selectionStart, selectionLength, maximumAlternates) {
        result := ComCall(11, this, "int", selectionStart, "int", selectionLength, "int", maximumAlternates, "ptr*", &AlternatesFromSelection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInkRecognitionAlternates(AlternatesFromSelection)
    }

    /**
     * Changes the top alternate of a recognition result by using the specified alternate.
     * @remarks
     * By default, the best result string of the recognition result corresponds to the <b>top alternate</b>. However, you can use this method to specify that alternates other than the top alternate are used in the result. When you choose an alternate other than the top alternate, you are essentially choosing a different path through the lattice of alternates that are associated with the results.
     * 
     * To retrieve the alternates that can be used to modify the recognition result, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms698186(v=vs.85)">AlternatesFromSelection</a> method.
     * 
     * <div class="alert"><b>Note</b>  A call to <b>ModifyTopAlternate Method</b> may modify the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topstring">TopString</a> and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topalternate">TopAlternate</a> properties.</div>
     * <div> </div>
     * The alternate used in the function can be a word alternate in an entire sentence. For example, an alternate obtained by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms698186(v=vs.85)">AlternatesFromSelection</a> (0, 5) for "Hello World" only changes the "Hello" part of the word leaving the "World" part intact.
     * @param {IInkRecognitionAlternate} Alternate The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionalternate">IInkRecognitionAlternate</a> to use to modify the top alternate.
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
     * <dt><b>TPC_E_NOT_RELEVANT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The lattice does not contain data.
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
     * A parameter contained an invalid pointer.
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
     * The alternate does not match the known range, or it was not obtained from this lattice.
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
     * An exception occurred while processing.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkrecognitionresult-modifytopalternate
     */
    ModifyTopAlternate(Alternate) {
        result := ComCall(12, this, "ptr", Alternate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Assigns the recognition results to the strokes that were used to create the results.
     * @remarks
     * System performance suffers if recognition results are automatically assigned to every <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection. Therefore results are not attached to an InkStrokes collection by default. To assign results to an InkStrokes collection, you must call <b>SetResultOnStrokes</b>. To return the recognition results for a InkStrokes collection, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionresult">IInkRecognitionResult</a> property of the InkStrokes collection. After you assign results to a InkStrokes collection, you can then store the strokes in a <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcustomstrokes">IInkCustomStrokes</a> collection. These custom strokes, as well as the <b>IInkRecognitionResult</b>, can be persisted and retrieved for later use.
     * 
     * To return the recognition results of a collection of strokes, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokes-get_recognitionresult">RecognitionResult</a> property.
     * 
     * After you assign results to a collection of strokes, you can then store the strokes in an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcustomstrokes">IInkCustomStrokes</a> collection. These custom strokes, as well as the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionresult">IInkRecognitionResult</a>, can be persisted and retrieved for later use.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected parameter or property type.
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
     * An exception occurred while processing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkrecognitionresult-setresultonstrokes
     */
    SetResultOnStrokes() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
