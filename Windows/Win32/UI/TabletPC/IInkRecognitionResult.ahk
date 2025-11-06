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
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognitionresult
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topstring
     */
    get_TopString() {
        TopString := BSTR()
        result := ComCall(7, this, "ptr", TopString, "HRESULT")
        return TopString
    }

    /**
     * 
     * @returns {IInkRecognitionAlternate} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topalternate
     */
    get_TopAlternate() {
        result := ComCall(8, this, "ptr*", &TopAlternate := 0, "HRESULT")
        return IInkRecognitionAlternate(TopAlternate)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topconfidence
     */
    get_TopConfidence() {
        result := ComCall(9, this, "int*", &TopConfidence := 0, "HRESULT")
        return TopConfidence
    }

    /**
     * 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionresult-get_strokes
     */
    get_Strokes() {
        result := ComCall(10, this, "ptr*", &Strokes := 0, "HRESULT")
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
        result := ComCall(11, this, "int", selectionStart, "int", selectionLength, "int", maximumAlternates, "ptr*", &AlternatesFromSelection := 0, "HRESULT")
        return IInkRecognitionAlternates(AlternatesFromSelection)
    }

    /**
     * 
     * @param {IInkRecognitionAlternate} Alternate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionresult-modifytopalternate
     */
    ModifyTopAlternate(Alternate) {
        result := ComCall(12, this, "ptr", Alternate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionresult-setresultonstrokes
     */
    SetResultOnStrokes() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
