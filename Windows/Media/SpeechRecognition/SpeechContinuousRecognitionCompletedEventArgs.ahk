#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechContinuousRecognitionCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains continuous recognition event data for the [SpeechContinuousRecognitionSession.Completed](speechcontinuousrecognitionsession_completed.md) event.
 * @remarks
 * To use web-service constraints, speech input and dictation support must be enabled in **Settings** by turning on the "Get to know me" option in the Settings -> Privacy -> Speech, inking, and typing page. See "Recognize speech input" in [Speech recognition](/windows/uwp/input-and-devices/speech-recognition).
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitioncompletedeventargs
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechContinuousRecognitionCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechContinuousRecognitionCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechContinuousRecognitionCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of a continuous speech recognition session (or the result of a grammar constraint compilation).
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitioncompletedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__ISpeechContinuousRecognitionCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionCompletedEventArgs := ISpeechContinuousRecognitionCompletedEventArgs(outPtr)
        }

        return this.__ISpeechContinuousRecognitionCompletedEventArgs.get_Status()
    }

;@endregion Instance Methods
}
