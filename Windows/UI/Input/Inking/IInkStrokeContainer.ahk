#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Foundation\IAsyncActionWithProgress.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\InkStroke.ahk
#Include .\InkRecognitionResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a manager for the collection of [InkStroke](inkstroke.md) objects rendered by the [InkPresenter](inkpresenter.md).
  * 
  * Modifications made to any of the ink strokes in the stroke container are immediately rendered to the drawing surface associated with the [InkPresenter](inkpresenter.md).
 * @remarks
 * For ink recognition, use an [IInkRecognizerContainer](iinkrecognizercontainer.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkStrokeContainer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStrokeContainer
     * @type {Guid}
     */
    static IID => Guid("{22accbc6-faa9-4f14-b68c-f6cee670ae16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BoundingRect", "AddStroke", "DeleteSelected", "MoveSelected", "SelectWithPolyLine", "SelectWithLine", "CopySelectedToClipboard", "PasteFromClipboard", "CanPasteFromClipboard", "LoadAsync", "SaveAsync", "UpdateRecognitionResults", "GetStrokes", "GetRecognitionResults"]

    /**
     * Gets the bounding rectangle of the [InkStroke](inkstroke.md) collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.boundingrect
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
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Adds an [InkStroke](inkstroke.md) object to the collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * @remarks
     * The [StrokesCollected](inkpresenter_strokescollected.md) event is fired when ink strokes are processed ("wet" to "dry") on the UI thread.
     * @param {InkStroke} stroke The ink stroke to be added.
     * 
     * *stroke* must be created by using the [Clone](inkstroke_clone_766852569.md) method, or through a call to [EndStroke](inkstrokebuilder_endstroke_245944492.md) or [ProcessPointerUp](inkmanager_processpointerup_1637073524.md). Empty or existing strokes are not valid.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.addstroke
     */
    AddStroke(stroke) {
        result := ComCall(7, this, "ptr", stroke, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes the selected [InkStroke](inkstroke.md) objects from the [InkStroke](inkstroke.md) collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * @remarks
     * This method does not cause the [StrokesErased](inkpresenter_strokeserased.md) event to fire.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.deleteselected
     */
    DeleteSelected() {
        invalidatedRect := RECT()
        result := ComCall(8, this, "ptr", invalidatedRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return invalidatedRect
    }

    /**
     * Moves the selected strokes. All affected strokes are re-rendered.
     * @remarks
     * The following can result from a call to [MoveSelected](inkstrokecontainer_moveselected_1369131213.md):
     * + Moving one or more strokes that make up part of a word results in the reprocessing of existing ink recognition results.
     * + Moving all strokes that make up a word results in the recalculation of the [BoundingRect](inkrecognitionresult_boundingrect.md) of the [InkRecognitionResult](inkrecognitionresult.md). Ink recognition is not reprocessed.
     * + Moving one or more strokes results in the recalculation of the [BoundingRect](inkstroke_boundingrect.md) for each stroke.
     * + Moving one or more strokes results in the recalculation of the [BoundingRect](inkstrokecontainer_boundingrect.md) of the [InkStrokeContainer](inkstrokecontainer.md).
     * @param {POINT} translation The destination screen coordinates for the upper-left corner of the bounding rectangle of the selected strokes.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.moveselected
     */
    MoveSelected(translation) {
        invalidatedRectangle := RECT()
        result := ComCall(9, this, "ptr", translation, "ptr", invalidatedRectangle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return invalidatedRectangle
    }

    /**
     * Selects all strokes contained entirely within the polyline.
     * 
     * > [!NOTE]
     * > The [Selected](inkstroke_selected.md) flag is reset for all other strokes in the collection.
     * 
     * .
     * @param {IIterable<POINT>} polyline_ The points of the polyline.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.selectwithpolyline
     */
    SelectWithPolyLine(polyline_) {
        invalidatedRectangle := RECT()
        result := ComCall(10, this, "ptr", polyline_, "ptr", invalidatedRectangle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return invalidatedRectangle
    }

    /**
     * Selects all strokes intersected by the new stroke.
     * 
     * > [!NOTE]
     * > The [Selected](inkstroke_selected.md) flag is reset for all other strokes in the collection.
     * @param {POINT} from The start of the line.
     * @param {POINT} to The end of the line.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.selectwithline
     */
    SelectWithLine(from, to) {
        invalidatedRectangle := RECT()
        result := ComCall(11, this, "ptr", from, "ptr", to, "ptr", invalidatedRectangle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return invalidatedRectangle
    }

    /**
     * Copies the selected [InkStroke](inkstroke.md) objects (from the [InkStroke](inkstroke.md) collection managed by the [InkStrokeContainer](inkstrokecontainer.md)) to the clipboard in Ink Serialized Format (ISF) format.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.copyselectedtoclipboard
     */
    CopySelectedToClipboard() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds the [InkStroke](inkstroke.md) content from the clipboard to the [InkStroke](inkstroke.md) collection that is managed by the [InkStrokeContainer](inkstrokecontainer.md) and renders the new strokes.
     * @remarks
     * The content of the clipboard must be in Ink Serialized Format (ISF) format.
     * @param {POINT} position The screen coordinates for the upper-left corner of the bounding rectangle of the clipboard content.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.pastefromclipboard
     */
    PasteFromClipboard(position) {
        invalidatedRectangle := RECT()
        result := ComCall(13, this, "ptr", position, "ptr", invalidatedRectangle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return invalidatedRectangle
    }

    /**
     * Identifies whether content on the clipboard can be added to the [InkStroke](inkstroke.md) collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * 
     * > [!NOTE]
     * > Clipboard content must be in Ink Serialized Format (ISF).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.canpastefromclipboard
     */
    CanPasteFromClipboard() {
        result := ComCall(14, this, "int*", &canPaste := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return canPaste
    }

    /**
     * Asynchronously loads all [InkStroke](inkstroke.md) objects from the specified stream to the [InkStroke](inkstroke.md) collection that is managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * @param {IInputStream} inputStream The stream that contains the stroke collection. An [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) (requires [IOutputStream](../windows.storage.streams/ioutputstream.md)) object can be specified instead.
     * @returns {IAsyncActionWithProgress<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.loadasync
     */
    LoadAsync(inputStream) {
        result := ComCall(15, this, "ptr", inputStream, "ptr*", &loadAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncActionWithProgress((ptr) => IPropertyValue(ptr).GetUInt64(), loadAction)
    }

    /**
     * Asynchronously saves all [InkStroke](inkstroke.md) objects in the [InkStroke](inkstroke.md) collection that is managed by the [InkStrokeContainer](inkstrokecontainer.md) to the specified stream.
     * @param {IOutputStream} outputStream The target stream. An [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) (requires [IOutputStream](../windows.storage.streams/ioutputstream.md)) object can be specified instead.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.saveasync
     */
    SaveAsync(outputStream) {
        result := ComCall(16, this, "ptr", outputStream, "ptr*", &outputStreamOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetUInt32(), (ptr) => IPropertyValue(ptr).GetUInt32(), outputStreamOperation)
    }

    /**
     * Updates the collection of recognition matches previously processed by an [InkRecognizer](inkrecognizer.md) and stored in an [InkRecognizerContainer](inkrecognizercontainer.md).
     * 
     * Recognition is not supported by [InkStrokeContainer](inkstrokecontainer.md), you must use an [InkRecognizerContainer](inkrecognizercontainer.md) object.
     * @param {IVectorView<InkRecognitionResult>} recognitionResults The updated collection of [InkRecognitionResult](inkrecognitionresult.md) objects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.updaterecognitionresults
     */
    UpdateRecognitionResults(recognitionResults) {
        result := ComCall(17, this, "ptr", recognitionResults, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves all ink strokes in the collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * @returns {IVectorView<InkStroke>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.getstrokes
     */
    GetStrokes() {
        result := ComCall(18, this, "ptr*", &strokeView := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(InkStroke, strokeView)
    }

    /**
     * Gets the collection of recognition matches previously processed by an [InkRecognizer](inkrecognizer.md) and stored in an [InkRecognizerContainer](inkrecognizercontainer.md).
     * 
     * Recognition is not supported by [InkStrokeContainer](inkstrokecontainer.md), you must use an [InkRecognizerContainer](inkrecognizercontainer.md) object.
     * @returns {IVectorView<InkRecognitionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer.getrecognitionresults
     */
    GetRecognitionResults() {
        result := ComCall(19, this, "ptr*", &recognitionResults := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(InkRecognitionResult, recognitionResults)
    }
}
