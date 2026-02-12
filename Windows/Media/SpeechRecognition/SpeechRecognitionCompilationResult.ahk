#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognitionCompilationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * The result of compiling the constraints set for a [SpeechRecognizer](speechrecognizer.md) object.
 * @remarks
 * Call [SpeechRecognizer.CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) to obtain an instance of this class.
 * 
 * [CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) must always be called before [RecognizeAsync](speechrecognizer_recognizeasync_748427924.md) or [RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md), even if no constraints are specified in the [Constraints](speechrecognizer_constraints.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitioncompilationresult
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionCompilationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognitionCompilationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognitionCompilationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result state ([SpeechRecognitionResultStatus](speechrecognitionresultstatus.md)) from the compiling of grammar constraints.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitioncompilationresult.status
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
        if (!this.HasProp("__ISpeechRecognitionCompilationResult")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionCompilationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionCompilationResult := ISpeechRecognitionCompilationResult(outPtr)
        }

        return this.__ISpeechRecognitionCompilationResult.get_Status()
    }

;@endregion Instance Methods
}
