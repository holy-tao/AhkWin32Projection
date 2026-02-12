#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpeechContinuousRecognitionSession.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class ISpeechRecognizer2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognizer2
     * @type {Guid}
     */
    static IID => Guid("{63c9baf1-91e3-4ea4-86a1-7c3867d084a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContinuousRecognitionSession", "get_State", "StopRecognitionAsync", "add_HypothesisGenerated", "remove_HypothesisGenerated"]

    /**
     * @type {SpeechContinuousRecognitionSession} 
     */
    ContinuousRecognitionSession {
        get => this.get_ContinuousRecognitionSession()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {SpeechContinuousRecognitionSession} 
     */
    get_ContinuousRecognitionSession() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechContinuousRecognitionSession(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    StopRecognitionAsync() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SpeechRecognizer, SpeechRecognitionHypothesisGeneratedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_HypothesisGenerated(value) {
        returnValue := EventRegistrationToken()
        result := ComCall(9, this, "ptr", value, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_HypothesisGenerated(value) {
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
