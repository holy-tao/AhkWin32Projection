#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkRecognizerContainer.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides properties and methods to manage one or more [InkRecognizer](inkrecognizer.md) objects used for handwriting recognition.
  * 
  * InkRecognizerContainer is null if a recognition engine is not available on the system.
 * @remarks
 * If recognition is not required, use an [InkStrokeContainer](inkstrokecontainer.md) object instead of an [InkManager](inkmanager.md). Previous recognition results are still available through [GetRecognitionResults](inkstrokecontainer_getrecognitionresults_1073930605.md).
 * 
 * If only recognition is required, and not storage, use an InkRecognizerContainer instead of an [InkManager](inkmanager.md).
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkrecognizercontainer
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkRecognizerContainer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkRecognizerContainer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkRecognizerContainer.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates a new [InkRecognizerContainer](inkrecognizercontainer.md) object to manage [InkRecognizer](inkrecognizer.md) objects used for handwriting recognition.
     * 
     * [InkRecognizerContainer](inkrecognizercontainer.md) is null if a recognition engine is not available on the system.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.InkRecognizerContainer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Sets the default [InkRecognizer](inkrecognizer.md) used for handwriting recognition.
     * @param {InkRecognizer} recognizer The [InkRecognizer](inkrecognizer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkrecognizercontainer.setdefaultrecognizer
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
     * Performs handwriting recognition on one or more [InkStroke](inkstroke.md) objects.
     * @remarks
     * Because [RecognizeAsync](inkmanager_recognizeasync_1262794931.md) does not automatically update the existing recognition results stored in the [InkManager](inkmanager.md), typically [UpdateRecognitionResults](inkmanager_updaterecognitionresults_1771366374.md) is called after [RecognizeAsync](inkmanager_recognizeasync_1262794931.md) has completed.
     * @param {InkStrokeContainer} strokeCollection The set of strokes on which recognition is performed.
     * @param {Integer} recognitionTarget One of the values from the [InkRecognitionTarget](inkrecognitiontarget.md) enumeration.
     * @returns {IAsyncOperation<IVectorView<InkRecognitionResult>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkrecognizercontainer.recognizeasync
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
     * Gets the collection of installed handwriting recognizers.
     * @returns {IVectorView<InkRecognizer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkrecognizercontainer.getrecognizers
     */
    GetRecognizers() {
        if (!this.HasProp("__IInkRecognizerContainer")) {
            if ((queryResult := this.QueryInterface(IInkRecognizerContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkRecognizerContainer := IInkRecognizerContainer(outPtr)
        }

        return this.__IInkRecognizerContainer.GetRecognizers()
    }

;@endregion Instance Methods
}
