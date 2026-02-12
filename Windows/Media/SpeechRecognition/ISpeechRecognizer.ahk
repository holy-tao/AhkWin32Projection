#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Globalization\Language.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\ISpeechRecognitionConstraint.ahk
#Include .\SpeechRecognizerTimeouts.ahk
#Include .\SpeechRecognizerUIOptions.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\SpeechRecognitionCompilationResult.ahk
#Include .\SpeechRecognitionResult.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class ISpeechRecognizer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognizer
     * @type {Guid}
     */
    static IID => Guid("{0bc3c9cb-c26a-40f2-aeb5-8096b2e48073}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentLanguage", "get_Constraints", "get_Timeouts", "get_UIOptions", "CompileConstraintsAsync", "RecognizeAsync", "RecognizeWithUIAsync", "add_RecognitionQualityDegrading", "remove_RecognitionQualityDegrading", "add_StateChanged", "remove_StateChanged"]

    /**
     * @type {Language} 
     */
    CurrentLanguage {
        get => this.get_CurrentLanguage()
    }

    /**
     * @type {IVector<ISpeechRecognitionConstraint>} 
     */
    Constraints {
        get => this.get_Constraints()
    }

    /**
     * @type {SpeechRecognizerTimeouts} 
     */
    Timeouts {
        get => this.get_Timeouts()
    }

    /**
     * @type {SpeechRecognizerUIOptions} 
     */
    UIOptions {
        get => this.get_UIOptions()
    }

    /**
     * 
     * @returns {Language} 
     */
    get_CurrentLanguage() {
        result := ComCall(6, this, "ptr*", &language_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Language(language_)
    }

    /**
     * 
     * @returns {IVector<ISpeechRecognitionConstraint>} 
     */
    get_Constraints() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ISpeechRecognitionConstraint, value)
    }

    /**
     * 
     * @returns {SpeechRecognizerTimeouts} 
     */
    get_Timeouts() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechRecognizerTimeouts(value)
    }

    /**
     * 
     * @returns {SpeechRecognizerUIOptions} 
     */
    get_UIOptions() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechRecognizerUIOptions(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<SpeechRecognitionCompilationResult>} 
     */
    CompileConstraintsAsync() {
        result := ComCall(10, this, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SpeechRecognitionCompilationResult, asyncOperation)
    }

    /**
     * 
     * @returns {IAsyncOperation<SpeechRecognitionResult>} 
     */
    RecognizeAsync() {
        result := ComCall(11, this, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SpeechRecognitionResult, asyncOperation)
    }

    /**
     * 
     * @returns {IAsyncOperation<SpeechRecognitionResult>} 
     */
    RecognizeWithUIAsync() {
        result := ComCall(12, this, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SpeechRecognitionResult, asyncOperation)
    }

    /**
     * 
     * @param {TypedEventHandler<SpeechRecognizer, SpeechRecognitionQualityDegradingEventArgs>} speechRecognitionQualityDegradingHandler 
     * @returns {EventRegistrationToken} 
     */
    add_RecognitionQualityDegrading(speechRecognitionQualityDegradingHandler) {
        cookie := EventRegistrationToken()
        result := ComCall(13, this, "ptr", speechRecognitionQualityDegradingHandler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_RecognitionQualityDegrading(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(14, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SpeechRecognizer, SpeechRecognizerStateChangedEventArgs>} stateChangedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(stateChangedHandler) {
        cookie := EventRegistrationToken()
        result := ComCall(15, this, "ptr", stateChangedHandler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_StateChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(16, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
