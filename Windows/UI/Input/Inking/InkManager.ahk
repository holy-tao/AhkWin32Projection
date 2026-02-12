#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkManager.ahk
#Include .\IInkRecognizerContainer.ahk
#Include .\IInkStrokeContainer.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of InkManager.
  * 
  * Manages the input, manipulation, and processing (including handwriting recognition) of one or more [InkStroke](inkstroke.md) objects.
 * @remarks
 * If recognition is not required, use an [InkStrokeContainer](inkstrokecontainer.md) object instead of an InkManager. Previous recognition results are still available through [GetRecognitionResults](inkstrokecontainer_getrecognitionresults_1073930605.md).
 * 
 * If only recognition is required, and not storage, use an [InkRecognizerContainer](inkrecognizercontainer.md) instead of an InkManager.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Gets or sets the ink input mode.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Gets the bounding rectangle of the [InkStroke](inkstroke.md) collection that is managed by the [InkManager](inkmanager.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.boundingrect
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Creates a new [InkManager](inkmanager.md) object that is used to manage [InkStroke](inkstroke.md) objects.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.InkManager")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IInkManager")) {
            if ((queryResult := this.QueryInterface(IInkManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkManager := IInkManager(outPtr)
        }

        return this.__IInkManager.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IInkManager")) {
            if ((queryResult := this.QueryInterface(IInkManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkManager := IInkManager(outPtr)
        }

        return this.__IInkManager.put_Mode(value)
    }

    /**
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Processes information about the position and features of the contact point, like pressure and tilt, on initial down contact. You must call this method before you call [ProcessPointerUpdate](inkmanager_processpointerupdate_416065930.md), and then ProcessPointerUp.
     * 
     * > [!IMPORTANT]
     * > This method is not supported in desktop apps.
     * @param {PointerPoint} pointerPoint_ Information about the position and features of the contact point.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.processpointerdown
     */
    ProcessPointerDown(pointerPoint_) {
        if (!this.HasProp("__IInkManager")) {
            if ((queryResult := this.QueryInterface(IInkManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkManager := IInkManager(outPtr)
        }

        return this.__IInkManager.ProcessPointerDown(pointerPoint_)
    }

    /**
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Processes position and state properties, such as pressure and tilt, for the specified pointer, from the last pointer event up to and including the current pointer event.Call this method after [ProcessPointerDown](inkmanager_processpointerdown_1209788648.md) and before [ProcessPointerUp](inkmanager_processpointerup_1637073524.md).
     * 
     * > [!IMPORTANT]
     * > This method is not supported in desktop apps.
     * @param {PointerPoint} pointerPoint_ The input pointer for which updates are to be processed.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.processpointerupdate
     */
    ProcessPointerUpdate(pointerPoint_) {
        if (!this.HasProp("__IInkManager")) {
            if ((queryResult := this.QueryInterface(IInkManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkManager := IInkManager(outPtr)
        }

        return this.__IInkManager.ProcessPointerUpdate(pointerPoint_)
    }

    /**
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Processes information about the position and features of the contact point, like pressure and tilt, on up contact. You must call this method after you call [ProcessPointerUpdate](inkmanager_processpointerupdate_416065930.md).
     * 
     * > [!IMPORTANT]
     * > This method is not supported in desktop apps.
     * @param {PointerPoint} pointerPoint_ Information about the position and features of the contact point.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.processpointerup
     */
    ProcessPointerUp(pointerPoint_) {
        if (!this.HasProp("__IInkManager")) {
            if ((queryResult := this.QueryInterface(IInkManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkManager := IInkManager(outPtr)
        }

        return this.__IInkManager.ProcessPointerUp(pointerPoint_)
    }

    /**
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Sets the default [InkDrawingAttributes](inkdrawingattributes.md) for all new [InkStroke](inkstroke.md) objects added to the [InkStroke](inkstroke.md) collection managed by the [InkManager](inkmanager.md).
     * 
     * SetDefaultDrawingAttributes does not affect the current stroke, or any existing strokes.
     * @param {InkDrawingAttributes} drawingAttributes The default attributes applied to a new ink stroke.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.setdefaultdrawingattributes
     */
    SetDefaultDrawingAttributes(drawingAttributes) {
        if (!this.HasProp("__IInkManager")) {
            if ((queryResult := this.QueryInterface(IInkManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkManager := IInkManager(outPtr)
        }

        return this.__IInkManager.SetDefaultDrawingAttributes(drawingAttributes)
    }

    /**
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Performs handwriting recognition on one or more [InkStroke](inkstroke.md) objects.
     * @remarks
     * Because [RecognizeAsync](inkmanager_recognizeasync_1262794931.md) does not automatically update the existing recognition results stored in the [InkManager](inkmanager.md), [UpdateRecognitionResults](inkmanager_updaterecognitionresults_1771366374.md) is typically called after [RecognizeAsync](inkmanager_recognizeasync_1262794931.md) has completed.
     * @param {Integer} recognitionTarget One of the values from the [InkRecognitionTarget](inkrecognitiontarget.md) enumeration.
     * @returns {IAsyncOperation<IVectorView<InkRecognitionResult>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.recognizeasync
     */
    RecognizeAsync2(recognitionTarget) {
        if (!this.HasProp("__IInkManager")) {
            if ((queryResult := this.QueryInterface(IInkManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkManager := IInkManager(outPtr)
        }

        return this.__IInkManager.RecognizeAsync2(recognitionTarget)
    }

    /**
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Sets the default [InkRecognizer](inkrecognizer.md) used for handwriting recognition.
     * @param {InkRecognizer} recognizer The [InkRecognizer](inkrecognizer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.setdefaultrecognizer
     */
    SetDefaultRecognizer(recognizer) {
        if (!this.HasProp("__IInkRecognizerContainer")) {
            if ((queryResult := this.QueryInterface(IInkRecognizerContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkRecognizerContainer := IInkRecognizerContainer(outPtr)
        }

        return this.__IInkRecognizerContainer.SetDefaultRecognizer(recognizer)
    }

    /**
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Performs handwriting recognition on one or more [InkStroke](inkstroke.md) objects.
     * @remarks
     * Because RecognizeAsync does not automatically update the existing recognition results stored in the [InkManager](inkmanager.md), [UpdateRecognitionResults](inkmanager_updaterecognitionresults_1771366374.md) is typically called after RecognizeAsync has completed.
     * @param {InkStrokeContainer} strokeCollection 
     * @param {Integer} recognitionTarget One of the values from the [InkRecognitionTarget](inkrecognitiontarget.md) enumeration.
     * @returns {IAsyncOperation<IVectorView<InkRecognitionResult>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.recognizeasync
     */
    RecognizeAsync(strokeCollection, recognitionTarget) {
        if (!this.HasProp("__IInkRecognizerContainer")) {
            if ((queryResult := this.QueryInterface(IInkRecognizerContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkRecognizerContainer := IInkRecognizerContainer(outPtr)
        }

        return this.__IInkRecognizerContainer.RecognizeAsync(strokeCollection, recognitionTarget)
    }

    /**
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Gets the collection of installed handwriting recognizers.
     * @returns {IVectorView<InkRecognizer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.getrecognizers
     */
    GetRecognizers() {
        if (!this.HasProp("__IInkRecognizerContainer")) {
            if ((queryResult := this.QueryInterface(IInkRecognizerContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkRecognizerContainer := IInkRecognizerContainer(outPtr)
        }

        return this.__IInkRecognizerContainer.GetRecognizers()
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Adds one or more [InkStroke](inkstroke.md) objects to the collection managed by the [InkManager](inkmanager.md).
     * @param {InkStroke} stroke The ink stroke to be added.
     * 
     * *stroke* must be created by using the [Clone](inkstroke_clone_766852569.md) method, or through a call to [EndStroke](inkstrokebuilder_endstroke_245944492.md) or [ProcessPointerUp](inkmanager_processpointerup_1637073524.md). Empty or existing strokes are not valid.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.addstroke
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Deletes the selected [InkStroke](inkstroke.md) objects from the [InkStroke](inkstroke.md) collection managed by the [InkManager](inkmanager.md).
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.deleteselected
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Moves the selected strokes. All affected strokes are re-rendered.
     * @remarks
     * The following can result from a call to MoveSelected:
     * + Moving one or more strokes that make up part of a word results in the reprocessing of existing ink recognition results.
     * + Moving all strokes that make up a word results in the recalculation of the [BoundingRect](inkrecognitionresult_boundingrect.md) of the [InkRecognitionResult](inkrecognitionresult.md). Ink recognition is not reprocessed.
     * + Moving one or more strokes results in the recalculation of the [BoundingRect](inkstroke_boundingrect.md) for each stroke.
     * + Moving one or more strokes results in the recalculation of the [BoundingRect](inkmanager_boundingrect.md) of the [InkManager](inkmanager.md).
     * @param {POINT} translation The destination screen coordinates for the upper-left corner of the bounding rectangle of the selected strokes.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.moveselected
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Selects all strokes contained entirely within the polyline.
     * 
     * > [!NOTE]
     * > The [Selected](inkstroke_selected.md) flag is reset for all other strokes in the collection.
     * 
     * .
     * @param {IIterable<POINT>} polyline_ The points of the polyline.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.selectwithpolyline
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Selects all strokes intersected by the new stroke.
     * 
     * > [!NOTE]
     * > The [Selected](inkstroke_selected.md) flag is reset for all other strokes in the collection.
     * @param {POINT} from The start of the stroke.
     * @param {POINT} to The end of the stroke.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.selectwithline
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Copies the selected [InkStroke](inkstroke.md) objects (from the [InkStroke](inkstroke.md) collection managed by the [InkManager](inkmanager.md)) to the clipboard in Ink Serialized Format (ISF) format.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.copyselectedtoclipboard
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Adds the [InkStroke](inkstroke.md) content from the clipboard to the [InkStroke](inkstroke.md) collection that is managed by the [InkManager](inkmanager.md) and renders the new strokes..
     * @remarks
     * The content of the clipboard must be in Ink Serialized Format (ISF) format.
     * 
     * The [InkStroke](inkstroke.md) content from the clipboard is selected. Any existing selection is discarded.
     * @param {POINT} position The screen coordinates for the upper-left corner of the bounding rectangle of the clipboard content.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.pastefromclipboard
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Identifies whether content on the clipboard can be added to the [InkStroke](inkstroke.md) collection that is managed by the [InkManager](inkmanager.md).
     * 
     * > [!NOTE]
     * > Clipboard content must be in Ink Serialized Format (ISF).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.canpastefromclipboard
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Asynchronously loads all [InkStroke](inkstroke.md) objects from the specified stream to the [InkStroke](inkstroke.md) collection that is managed by the [InkManager](inkmanager.md).
     * 
     * Ink data is serialized as Ink Serialized Format (ISF) metadata and embedded into a Graphics Interchange Format (GIF) file.
     * @remarks
     * Embedding the metadata into a Graphics Interchange Format (GIF) file enables ink to be viewed in applications that are not ink-enabled while maintaining full fidelity for ink-enabled applications. This format is ideal for transporting ink content within an HTML file and making it usable by both ink and non-ink applications. 
     * 
     * > [!NOTE]
     * > Ink Serialized Format (ISF) is the most compact persistent representation of ink. It can be embedded within a binary document format or placed directly on the Clipboard while preserving various ink properties such as pressure, width, color, tilt, twist, and so on.
     * @param {IInputStream} inputStream The stream that contains the stroke collection. An [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) (requires [IOutputStream](../windows.storage.streams/ioutputstream.md)) object can be specified instead.
     * @returns {IAsyncActionWithProgress<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.loadasync
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Asynchronously saves all [InkStroke](inkstroke.md) objects in the [InkStroke](inkstroke.md) collection that is managed by the [InkManager](inkmanager.md) to the specified stream.
     * 
     * Ink data is serialized as Ink Serialized Format (ISF) metadata and embedded into a Graphics Interchange Format (GIF) file.
     * @remarks
     * Embedding the metadata into a Graphics Interchange Format (GIF) file enables ink to be viewed in applications that are not ink-enabled while maintaining full fidelity for ink-enabled applications. This format is ideal for transporting ink content within an HTML file and making it usable by both ink and non-ink applications. 
     * 
     * > [!NOTE]
     * > Ink Serialized Format (ISF) is the most compact persistent representation of ink. It can be embedded within a binary document format or placed directly on the Clipboard while preserving various ink properties such as pressure, width, color, tilt, twist, and so on.
     * @param {IOutputStream} outputStream The target stream. An [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) (requires [IOutputStream](../windows.storage.streams/ioutputstream.md)) object can be specified instead.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.saveasync
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Updates the collection of potential text matches from handwriting recognition.
     * @param {IVectorView<InkRecognitionResult>} recognitionResults The results returned by recognition, where each [InkRecognitionResult](inkrecognitionresult.md) object represents one written word. 
     * 
     * > [!NOTE]
     * > Each word is associated with a ranked list of text strings (retrieved through a call to [GetTextCandidates](inkrecognitionresult_gettextcandidates_1780889583.md)) as potential matches for the word.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.updaterecognitionresults
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Retrieves all ink strokes in the collection managed by the [InkManager](inkmanager.md).
     * @returns {IVectorView<InkStroke>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.getstrokes
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
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Retrieves the collection of words returned by handwriting recognition.
     * @returns {IVectorView<InkRecognitionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanager.getrecognitionresults
     */
    GetRecognitionResults() {
        if (!this.HasProp("__IInkStrokeContainer")) {
            if ((queryResult := this.QueryInterface(IInkStrokeContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeContainer := IInkStrokeContainer(outPtr)
        }

        return this.__IInkStrokeContainer.GetRecognitionResults()
    }

;@endregion Instance Methods
}
