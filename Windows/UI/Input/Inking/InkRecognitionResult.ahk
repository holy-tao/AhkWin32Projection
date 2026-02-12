#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkRecognitionResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides properties and methods to manage [InkStroke](inkstroke.md) handwriting recognition data.
  * 
  * Recognition results are produced for each word detected by an [InkRecognizer](inkrecognizer.md).
 * @remarks
 * | JavaScript (usage) |
 * |---|
 * | var inkRecognitionResults = [Windows.UI.Input.Inking.InkManager.getRecognitionResults()](inkmanager_getrecognitionresults_1073930605.md);<br/><br/>var inkRecognitionResult = inkRecognitionResults[...]; |
 * | var inkRecognitionResults =[Windows.UI.Input.Inking.InkStrokeContainer.getRecognitionResults()](inkstrokecontainer_getrecognitionresults_1073930605.md);<br/><br/>var inkRecognitionResult = inkRecognitionResults[...]; |
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkrecognitionresult
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkRecognitionResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkRecognitionResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkRecognitionResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the bounding rectangle of the [InkStroke](inkstroke.md) data used for handwriting recognition.
     * 
     * Recognition results are produced for each word that is detected by an [InkRecognizer](inkrecognizer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkrecognitionresult.boundingrect
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BoundingRect() {
        if (!this.HasProp("__IInkRecognitionResult")) {
            if ((queryResult := this.QueryInterface(IInkRecognitionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkRecognitionResult := IInkRecognitionResult(outPtr)
        }

        return this.__IInkRecognitionResult.get_BoundingRect()
    }

    /**
     * Retrieves the collection of strings identified as potential matches for each word returned by handwriting recognition.
     * @returns {IVectorView<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkrecognitionresult.gettextcandidates
     */
    GetTextCandidates() {
        if (!this.HasProp("__IInkRecognitionResult")) {
            if ((queryResult := this.QueryInterface(IInkRecognitionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkRecognitionResult := IInkRecognitionResult(outPtr)
        }

        return this.__IInkRecognitionResult.GetTextCandidates()
    }

    /**
     * Retrieves all ink strokes used for handwriting recognition.
     * 
     * Recognition results are produced for each word that is detected by an [InkRecognizer](inkrecognizer.md).
     * @returns {IVectorView<InkStroke>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkrecognitionresult.getstrokes
     */
    GetStrokes() {
        if (!this.HasProp("__IInkRecognitionResult")) {
            if ((queryResult := this.QueryInterface(IInkRecognitionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkRecognitionResult := IInkRecognitionResult(outPtr)
        }

        return this.__IInkRecognitionResult.GetStrokes()
    }

;@endregion Instance Methods
}
