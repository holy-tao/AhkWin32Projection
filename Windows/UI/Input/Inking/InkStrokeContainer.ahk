#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkStrokeContainer.ahk
#Include .\IInkStrokeContainer2.ahk
#Include .\IInkStrokeContainer3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides properties and methods to store and manage the collection of [InkStroke](inkstroke.md) objects rendered by the [InkPresenter](inkpresenter.md).
  * 
  * Modifications made to any of the ink strokes in the stroke container are immediately rendered to the drawing surface associated with the [InkPresenter](inkpresenter.md).
 * @remarks
 * For ink recognition, use an [InkRecognizerContainer](inkrecognizercontainer.md) object.
 * 
 * The [StrokesCollected](inkpresenter_strokescollected.md) event is fired when ink strokes are processed ("wet" to "dry") on the UI thread.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkStrokeContainer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkStrokeContainer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkStrokeContainer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the bounding rectangle of the [InkStroke](inkstroke.md) collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.boundingrect
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new [InkStrokeContainer](inkstrokecontainer.md) object that is used to manage [InkStroke](inkstroke.md) objects.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.InkStrokeContainer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BoundingRect() {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.get_BoundingRect()
    }

    /**
     * Adds an [InkStroke](inkstroke.md) object to the collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * 
     * > An [InkStroke](inkstroke.md) cannot exist in more than one [InkStrokeContainer](inkstrokecontainer.md). Call the [Clone](inkstroke_clone_766852569.md) method to duplicate a stroke in another container.
     * @param {InkStroke} stroke The ink stroke to be added.
     * 
     * *stroke* must be created by using the [Clone](inkstroke_clone_766852569.md) method, or through a call to [EndStroke](inkstrokebuilder_endstroke_245944492.md) or [ProcessPointerUp](inkmanager_processpointerup_1637073524.md). Empty or existing strokes are not valid.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.addstroke
     */
    AddStroke(stroke) {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.AddStroke(stroke)
    }

    /**
     * Deletes the selected [InkStroke](inkstroke.md) objects from the [InkStroke](inkstroke.md) collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * @remarks
     * This method does not cause the [StrokesErased](inkpresenter_strokeserased.md) event to fire.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.deleteselected
     */
    DeleteSelected() {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.DeleteSelected()
    }

    /**
     * Moves the selected strokes. All affected strokes are re-rendered.
     * @remarks
     * The following can result from a call to MoveSelected:
     * + Moving one or more strokes that make up part of a word results in the reprocessing of existing ink recognition results.
     * + Moving all strokes that make up a word results in the recalculation of the [BoundingRect](inkrecognitionresult_boundingrect.md) of the [InkRecognitionResult](inkrecognitionresult.md). Ink recognition is not reprocessed.
     * + Moving one or more strokes results in the recalculation of the [BoundingRect](inkstroke_boundingrect.md) for each stroke.
     * + Moving one or more strokes results in the recalculation of the [BoundingRect](inkstrokecontainer_boundingrect.md) of the [InkStrokeContainer](inkstrokecontainer.md).
     * @param {POINT} translation The destination screen coordinates for the upper-left corner of the bounding rectangle of the selected strokes.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.moveselected
     */
    MoveSelected(translation) {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.MoveSelected(translation)
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.selectwithpolyline
     */
    SelectWithPolyLine(polyline_) {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.SelectWithPolyLine(polyline_)
    }

    /**
     * Selects all strokes intersected by the new stroke.
     * 
     * > [!NOTE]
     * > The [Selected](inkstroke_selected.md) flag is reset for all other strokes in the collection.
     * @param {POINT} from The start of the line.
     * @param {POINT} to The of the line.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.selectwithline
     */
    SelectWithLine(from, to) {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.SelectWithLine(from, to)
    }

    /**
     * Copies the selected [InkStroke](inkstroke.md) objects (from the [InkStroke](inkstroke.md) collection managed by the [InkStrokeContainer](inkstrokecontainer.md)) to the clipboard in Ink Serialized Format (ISF) format.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.copyselectedtoclipboard
     */
    CopySelectedToClipboard() {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.CopySelectedToClipboard()
    }

    /**
     * Adds the [InkStroke](inkstroke.md) content from the clipboard to the [InkStroke](inkstroke.md) collection that is managed by the [InkStrokeContainer](inkstrokecontainer.md) and renders the new strokes..
     * @remarks
     * The content of the clipboard must be in Ink Serialized Format (ISF) format.
     * 
     * The [InkStroke](inkstroke.md) content from the clipboard is selected. Any existing selection is discarded.
     * @param {POINT} position The screen coordinates for the upper-left corner of the bounding rectangle of the clipboard content.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.pastefromclipboard
     */
    PasteFromClipboard(position) {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.PasteFromClipboard(position)
    }

    /**
     * Identifies whether content on the clipboard can be added to the [InkStroke](inkstroke.md) collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * 
     * > [!NOTE]
     * > Clipboard content must be in Ink Serialized Format (ISF).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.canpastefromclipboard
     */
    CanPasteFromClipboard() {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.CanPasteFromClipboard()
    }

    /**
     * Asynchronously loads all [InkStroke](inkstroke.md) objects from the specified stream to the [InkStroke](inkstroke.md) collection that is managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * 
     * > All existing strokes in the [InkStrokeContainer](inkstrokecontainer.md) are cleared before new strokes are loaded.
     * @param {IInputStream} inputStream The target stream.
     * @returns {IAsyncActionWithProgress<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.loadasync
     */
    LoadAsync(inputStream) {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.LoadAsync(inputStream)
    }

    /**
     * Asynchronously saves all [InkStroke](inkstroke.md) objects in the [InkStroke](inkstroke.md) collection that is managed by the [InkStrokeContainer](inkstrokecontainer.md) to the specified stream and in the specified format.
     * @param {IOutputStream} outputStream The target stream. An [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) (requires [IOutputStream](../windows.storage.streams/ioutputstream.md)) object can be specified instead.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.saveasync
     */
    SaveAsync(outputStream) {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.SaveAsync(outputStream)
    }

    /**
     * Updates the collection of recognition matches previously processed by an [InkRecognizer](inkrecognizer.md) and stored in an [InkRecognizerContainer](inkrecognizercontainer.md).
     * 
     * Recognition is not supported by [InkStrokeContainer](inkstrokecontainer.md), you must use an [InkRecognizerContainer](inkrecognizercontainer.md) object.
     * @param {IVectorView<InkRecognitionResult>} recognitionResults The updated collection of [InkRecognitionResult](inkrecognitionresult.md) objects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.updaterecognitionresults
     */
    UpdateRecognitionResults(recognitionResults) {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.UpdateRecognitionResults(recognitionResults)
    }

    /**
     * Retrieves all ink strokes in the collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * @returns {IVectorView<InkStroke>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.getstrokes
     */
    GetStrokes() {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.GetStrokes()
    }

    /**
     * Gets the collection of recognition matches previously processed by an [InkRecognizer](inkrecognizer.md) and stored in an [InkRecognizerContainer](inkrecognizercontainer.md).
     * 
     * Recognition is not supported by [InkStrokeContainer](inkstrokecontainer.md), you must use an [InkRecognizerContainer](inkrecognizercontainer.md) object.
     * @returns {IVectorView<InkRecognitionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.getrecognitionresults
     */
    GetRecognitionResults() {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.GetRecognitionResults()
    }

    /**
     * Adds one or more ink strokes to the collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * 
     * > An [InkStroke](inkstroke.md) cannot exist in more than one [InkStrokeContainer](inkstrokecontainer.md). Call the [Clone](inkstroke_clone_766852569.md) method to duplicate a stroke in another container.
     * @param {IIterable<InkStroke>} strokes The ink strokes to be added as a collection of [InkStroke](inkstroke.md) objects.Each *stroke* must be created using the [Clone](inkstroke_clone_766852569.md) method, or through a call to [EndStroke](inkstrokebuilder_endstroke_245944492.md) or [ProcessPointerUp](inkmanager_processpointerup_1637073524.md). Empty or existing strokes are not valid.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.addstrokes
     */
    AddStrokes(strokes) {
        if (!this.HasProp("__IInkStrokeContainer2")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer2 := IInkStrokeContainer2(outPtr)
        }

        return this.__IInkStrokeContainer2.AddStrokes(strokes)
    }

    /**
     * Deletes all [InkStroke](inkstroke.md) objects from the collection managed by the [InkStrokeContainer](inkstrokecontainer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.clear
     */
    Clear() {
        if (!this.HasProp("__IInkStrokeContainer2")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer2 := IInkStrokeContainer2(outPtr)
        }

        return this.__IInkStrokeContainer2.Clear()
    }

    /**
     * Asynchronously saves all [InkStroke](inkstroke.md) objects in the [InkStroke](inkstroke.md) collection that is managed by the [InkStrokeContainer](inkstrokecontainer.md) to the specified stream.
     * @param {IOutputStream} outputStream The target stream. An [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) (requires [IOutputStream](../windows.storage.streams/ioutputstream.md)) object can be specified instead.
     * @param {Integer} inkPersistenceFormat_ 
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.saveasync
     */
    SaveWithFormatAsync(outputStream, inkPersistenceFormat_) {
        if (!this.HasProp("__IInkStrokeContainer3")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer3 := IInkStrokeContainer3(outPtr)
        }

        return this.__IInkStrokeContainer3.SaveWithFormatAsync(outputStream, inkPersistenceFormat_)
    }

    /**
     * Retrieves the single InkStroke with the specified ID.
     * @param {Integer} id The Global Unique Identifier (GUID) used to identify a single ink stroke.
     * @returns {InkStroke} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokecontainer.getstrokebyid
     */
    GetStrokeById(id) {
        if (!this.HasProp("__IInkStrokeContainer3")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer3 := IInkStrokeContainer3(outPtr)
        }

        return this.__IInkStrokeContainer3.GetStrokeById(id)
    }

;@endregion Instance Methods
}
