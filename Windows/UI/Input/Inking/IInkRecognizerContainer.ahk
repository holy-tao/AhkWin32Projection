#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\InkRecognitionResult.ahk
#Include .\InkRecognizer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents one or more [InkRecognizer](inkrecognizer.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkrecognizercontainer
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkRecognizerContainer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRecognizerContainer
     * @type {Guid}
     */
    static IID => Guid("{a74d9a31-8047-4698-a912-f82a5085012f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDefaultRecognizer", "RecognizeAsync", "GetRecognizers"]

    /**
     * Sets the default [InkRecognizer](inkrecognizer.md) used for handwriting recognition.
     * @param {InkRecognizer} recognizer The [InkRecognizer](inkrecognizer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkrecognizercontainer.setdefaultrecognizer
     */
    SetDefaultRecognizer(recognizer) {
        result := ComCall(6, this, "ptr", recognizer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs handwriting recognition on one or more [InkStroke](inkstroke.md) objects.
     * @remarks
     * Because [RecognizeAsync](inkmanager_recognizeasync_1262794931.md) does not automatically update the existing recognition results stored in the [InkManager](inkmanager.md), typically [UpdateRecognitionResults](inkmanager_updaterecognitionresults_1771366374.md) is called after [RecognizeAsync](inkmanager_recognizeasync_1262794931.md) has completed.
     * @param {InkStrokeContainer} strokeCollection The set of strokes on which recognition is performed.
     * @param {Integer} recognitionTarget One of the values from the [InkRecognitionTarget](inkrecognitiontarget.md) enumeration.
     * @returns {IAsyncOperation<IVectorView<InkRecognitionResult>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkrecognizercontainer.recognizeasync
     */
    RecognizeAsync(strokeCollection, recognitionTarget) {
        result := ComCall(7, this, "ptr", strokeCollection, "int", recognitionTarget, "ptr*", &recognitionResults := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, InkRecognitionResult), recognitionResults)
    }

    /**
     * Gets the collection of installed handwriting recognizers.
     * @returns {IVectorView<InkRecognizer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkrecognizercontainer.getrecognizers
     */
    GetRecognizers() {
        result := ComCall(8, this, "ptr*", &recognizerView := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(InkRecognizer, recognizerView)
    }
}
