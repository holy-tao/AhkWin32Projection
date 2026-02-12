#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MiracastReceiverSettings.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MiracastReceiverApplySettingsResult.ahk
#Include .\MiracastReceiverStatus.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\MiracastReceiverSession.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class IMiracastReceiver extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMiracastReceiver
     * @type {Guid}
     */
    static IID => Guid("{7a315258-e444-51b4-aff7-b88daa1229e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultSettings", "GetCurrentSettings", "GetCurrentSettingsAsync", "DisconnectAllAndApplySettings", "DisconnectAllAndApplySettingsAsync", "GetStatus", "GetStatusAsync", "add_StatusChanged", "remove_StatusChanged", "CreateSession", "CreateSessionAsync", "ClearKnownTransmitters", "RemoveKnownTransmitter"]

    /**
     * 
     * @returns {MiracastReceiverSettings} 
     */
    GetDefaultSettings() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverSettings(result_)
    }

    /**
     * 
     * @returns {MiracastReceiverSettings} 
     */
    GetCurrentSettings() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverSettings(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<MiracastReceiverSettings>} 
     */
    GetCurrentSettingsAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MiracastReceiverSettings, operation)
    }

    /**
     * 
     * @param {MiracastReceiverSettings} settings 
     * @returns {MiracastReceiverApplySettingsResult} 
     */
    DisconnectAllAndApplySettings(settings) {
        result := ComCall(9, this, "ptr", settings, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverApplySettingsResult(result_)
    }

    /**
     * 
     * @param {MiracastReceiverSettings} settings 
     * @returns {IAsyncOperation<MiracastReceiverApplySettingsResult>} 
     */
    DisconnectAllAndApplySettingsAsync(settings) {
        result := ComCall(10, this, "ptr", settings, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MiracastReceiverApplySettingsResult, operation)
    }

    /**
     * 
     * @returns {MiracastReceiverStatus} 
     */
    GetStatus() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverStatus(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<MiracastReceiverStatus>} 
     */
    GetStatusAsync() {
        result := ComCall(12, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MiracastReceiverStatus, operation)
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiver, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_StatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CoreApplicationView} view_ 
     * @returns {MiracastReceiverSession} 
     */
    CreateSession(view_) {
        result := ComCall(15, this, "ptr", view_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverSession(result_)
    }

    /**
     * 
     * @param {CoreApplicationView} view_ 
     * @returns {IAsyncOperation<MiracastReceiverSession>} 
     */
    CreateSessionAsync(view_) {
        result := ComCall(16, this, "ptr", view_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MiracastReceiverSession, operation)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearKnownTransmitters() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {MiracastTransmitter} transmitter 
     * @returns {HRESULT} 
     */
    RemoveKnownTransmitter(transmitter) {
        result := ComCall(18, this, "ptr", transmitter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
