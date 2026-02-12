#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include .\SecondaryAuthenticationFactorAuthenticationResult.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include .\SecondaryAuthenticationFactorAuthenticationStageInfo.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class ISecondaryAuthenticationFactorAuthenticationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryAuthenticationFactorAuthenticationStatics
     * @type {Guid}
     */
    static IID => Guid("{3f582656-28f8-4e0f-ae8c-5898b9ae2469}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowNotificationMessageAsync", "StartAuthenticationAsync", "add_AuthenticationStageChanged", "remove_AuthenticationStageChanged", "GetAuthenticationStageInfoAsync"]

    /**
     * 
     * @param {HSTRING} deviceName 
     * @param {Integer} message 
     * @returns {IAsyncAction} 
     */
    ShowNotificationMessageAsync(deviceName, message) {
        if(deviceName is String) {
            pin := HSTRING.Create(deviceName)
            deviceName := pin.Value
        }
        deviceName := deviceName is Win32Handle ? NumGet(deviceName, "ptr") : deviceName

        result := ComCall(6, this, "ptr", deviceName, "int", message, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {IBuffer} serviceAuthenticationNonce 
     * @returns {IAsyncOperation<SecondaryAuthenticationFactorAuthenticationResult>} 
     */
    StartAuthenticationAsync(deviceId, serviceAuthenticationNonce) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(7, this, "ptr", deviceId, "ptr", serviceAuthenticationNonce, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SecondaryAuthenticationFactorAuthenticationResult, operation)
    }

    /**
     * 
     * @param {EventHandler<SecondaryAuthenticationFactorAuthenticationStageChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AuthenticationStageChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_AuthenticationStageChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<SecondaryAuthenticationFactorAuthenticationStageInfo>} 
     */
    GetAuthenticationStageInfoAsync() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SecondaryAuthenticationFactorAuthenticationStageInfo, result_)
    }
}
