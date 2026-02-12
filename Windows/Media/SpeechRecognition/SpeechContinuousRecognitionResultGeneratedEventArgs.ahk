#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechContinuousRecognitionResultGeneratedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [SpeechContinuousRecognitionSession.ResultGenerated](speechcontinuousrecognitionsession_resultgenerated.md) event.
 * @remarks
 * This object is passed to a [SpeechContinuousRecognitionSession.ResultGenerated](speechcontinuousrecognitionsession_resultgenerated.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitionresultgeneratedeventargs
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechContinuousRecognitionResultGeneratedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechContinuousRecognitionResultGeneratedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechContinuousRecognitionResultGeneratedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the complete recognition result returned by the speech recognizer at the end of a continuous recognition session where [SpeechRecognitionResultStatus](speechrecognitionresultstatus.md) is set to [Success](speechrecognitionresultstatus.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitionresultgeneratedeventargs.result
     * @type {SpeechRecognitionResult} 
     */
    Result {
        get => this.get_Result()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SpeechRecognitionResult} 
     */
    get_Result() {
        if (!this.HasProp("__ISpeechContinuousRecognitionResultGeneratedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpeechContinuousRecognitionResultGeneratedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechContinuousRecognitionResultGeneratedEventArgs := ISpeechContinuousRecognitionResultGeneratedEventArgs(outPtr)
        }

        return this.__ISpeechContinuousRecognitionResultGeneratedEventArgs.get_Result()
    }

;@endregion Instance Methods
}
