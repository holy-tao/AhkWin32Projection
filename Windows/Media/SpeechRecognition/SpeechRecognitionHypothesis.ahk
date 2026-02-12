#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognitionHypothesis.ahk
#Include ..\..\..\Guid.ahk

/**
 * A recognition result fragment returned by the speech recognizer during an ongoing dictation session.
  * 
  * The result fragment is useful for demonstrating that speech recognition is processing input during a lengthy dictation session.
 * @remarks
 * An app retrieves this object through the [SpeechRecognitionHypothesisGeneratedEventArgs.Hypothesis](speechrecognitionhypothesisgeneratedeventargs_hypothesis.md) property while handling a [HypothesisGenerated](speechrecognizer_hypothesisgenerated.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionhypothesis
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionHypothesis extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognitionHypothesis

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognitionHypothesis.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the text of the hypothesis, or recognition result fragment, returned by the speech recognizer during an ongoing dictation session.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionhypothesis.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ISpeechRecognitionHypothesis")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionHypothesis.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionHypothesis := ISpeechRecognitionHypothesis(outPtr)
        }

        return this.__ISpeechRecognitionHypothesis.get_Text()
    }

;@endregion Instance Methods
}
