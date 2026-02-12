#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognitionHypothesisGeneratedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [SpeechRecognizer.HypothesisGenerated](speechrecognizer_hypothesisgenerated.md) event.
 * @remarks
 * This object is passed to a [SpeechRecognizer.HypothesisGenerated](speechrecognizer_hypothesisgenerated.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionhypothesisgeneratedeventargs
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionHypothesisGeneratedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognitionHypothesisGeneratedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognitionHypothesisGeneratedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a recognition result fragment returned by the speech recognizer during an ongoing dictation session.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionhypothesisgeneratedeventargs.hypothesis
     * @type {SpeechRecognitionHypothesis} 
     */
    Hypothesis {
        get => this.get_Hypothesis()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SpeechRecognitionHypothesis} 
     */
    get_Hypothesis() {
        if (!this.HasProp("__ISpeechRecognitionHypothesisGeneratedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionHypothesisGeneratedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionHypothesisGeneratedEventArgs := ISpeechRecognitionHypothesisGeneratedEventArgs(outPtr)
        }

        return this.__ISpeechRecognitionHypothesisGeneratedEventArgs.get_Hypothesis()
    }

;@endregion Instance Methods
}
