#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\InkStroke.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

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
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkRecognitionResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRecognitionResult
     * @type {Guid}
     */
    static IID => Guid("{36461a94-5068-40ef-8a05-2c2fb60908a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BoundingRect", "GetTextCandidates", "GetStrokes"]

    /**
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BoundingRect() {
        boundingRect := RECT()
        result := ComCall(6, this, "ptr", boundingRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return boundingRect
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    GetTextCandidates() {
        result := ComCall(7, this, "ptr*", &textCandidates := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), textCandidates)
    }

    /**
     * 
     * @returns {IVectorView<InkStroke>} 
     */
    GetStrokes() {
        result := ComCall(8, this, "ptr*", &strokes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(InkStroke, strokes)
    }
}
