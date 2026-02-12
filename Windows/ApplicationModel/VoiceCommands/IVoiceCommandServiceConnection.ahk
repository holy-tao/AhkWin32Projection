#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\VoiceCommand.ahk
#Include .\VoiceCommandConfirmationResult.ahk
#Include .\VoiceCommandDisambiguationResult.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Globalization\Language.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class IVoiceCommandServiceConnection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoiceCommandServiceConnection
     * @type {Guid}
     */
    static IID => Guid("{d894bb9f-21da-44a4-98a2-fb131920a9cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVoiceCommandAsync", "RequestConfirmationAsync", "RequestDisambiguationAsync", "ReportProgressAsync", "ReportSuccessAsync", "ReportFailureAsync", "RequestAppLaunchAsync", "get_Language", "add_VoiceCommandCompleted", "remove_VoiceCommandCompleted"]

    /**
     * @type {Language} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * 
     * @returns {IAsyncOperation<VoiceCommand>} 
     */
    GetVoiceCommandAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VoiceCommand, operation)
    }

    /**
     * 
     * @param {VoiceCommandResponse} response 
     * @returns {IAsyncOperation<VoiceCommandConfirmationResult>} 
     */
    RequestConfirmationAsync(response) {
        result := ComCall(7, this, "ptr", response, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VoiceCommandConfirmationResult, operation)
    }

    /**
     * 
     * @param {VoiceCommandResponse} response 
     * @returns {IAsyncOperation<VoiceCommandDisambiguationResult>} 
     */
    RequestDisambiguationAsync(response) {
        result := ComCall(8, this, "ptr", response, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VoiceCommandDisambiguationResult, operation)
    }

    /**
     * 
     * @param {VoiceCommandResponse} response 
     * @returns {IAsyncAction} 
     */
    ReportProgressAsync(response) {
        result := ComCall(9, this, "ptr", response, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @param {VoiceCommandResponse} response 
     * @returns {IAsyncAction} 
     */
    ReportSuccessAsync(response) {
        result := ComCall(10, this, "ptr", response, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @param {VoiceCommandResponse} response 
     * @returns {IAsyncAction} 
     */
    ReportFailureAsync(response) {
        result := ComCall(11, this, "ptr", response, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @param {VoiceCommandResponse} response 
     * @returns {IAsyncAction} 
     */
    RequestAppLaunchAsync(response) {
        result := ComCall(12, this, "ptr", response, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @returns {Language} 
     */
    get_Language() {
        result := ComCall(13, this, "ptr*", &language_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Language(language_)
    }

    /**
     * 
     * @param {TypedEventHandler<VoiceCommandServiceConnection, VoiceCommandCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VoiceCommandCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VoiceCommandCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
