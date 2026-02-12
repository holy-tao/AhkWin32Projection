#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\VoipPhoneCall.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IVoipCallCoordinator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoipCallCoordinator
     * @type {Guid}
     */
    static IID => Guid("{4f118bcf-e8ef-4434-9c5f-a8d893fafe79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReserveCallResourcesAsync", "add_MuteStateChanged", "remove_MuteStateChanged", "RequestNewIncomingCall", "RequestNewOutgoingCall", "NotifyMuted", "NotifyUnmuted", "RequestOutgoingUpgradeToVideoCall", "RequestIncomingUpgradeToVideoCall", "TerminateCellularCall", "CancelUpgrade"]

    /**
     * 
     * @param {HSTRING} taskEntryPoint 
     * @returns {IAsyncOperation<Integer>} 
     */
    ReserveCallResourcesAsync(taskEntryPoint) {
        if(taskEntryPoint is String) {
            pin := HSTRING.Create(taskEntryPoint)
            taskEntryPoint := pin.Value
        }
        taskEntryPoint := taskEntryPoint is Win32Handle ? NumGet(taskEntryPoint, "ptr") : taskEntryPoint

        result := ComCall(6, this, "ptr", taskEntryPoint, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {TypedEventHandler<VoipCallCoordinator, MuteChangeEventArgs>} muteChangeHandler 
     * @returns {EventRegistrationToken} 
     */
    add_MuteStateChanged(muteChangeHandler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", muteChangeHandler, "ptr", token, "int")
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
    remove_MuteStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} context_ 
     * @param {HSTRING} contactName 
     * @param {HSTRING} contactNumber 
     * @param {Uri} contactImage 
     * @param {HSTRING} serviceName 
     * @param {Uri} brandingImage 
     * @param {HSTRING} callDetails 
     * @param {Uri} ringtone 
     * @param {Integer} media 
     * @param {TimeSpan} ringTimeout 
     * @returns {VoipPhoneCall} 
     */
    RequestNewIncomingCall(context_, contactName, contactNumber, contactImage, serviceName, brandingImage, callDetails, ringtone, media, ringTimeout) {
        if(context_ is String) {
            pin := HSTRING.Create(context_)
            context_ := pin.Value
        }
        context_ := context_ is Win32Handle ? NumGet(context_, "ptr") : context_
        if(contactName is String) {
            pin := HSTRING.Create(contactName)
            contactName := pin.Value
        }
        contactName := contactName is Win32Handle ? NumGet(contactName, "ptr") : contactName
        if(contactNumber is String) {
            pin := HSTRING.Create(contactNumber)
            contactNumber := pin.Value
        }
        contactNumber := contactNumber is Win32Handle ? NumGet(contactNumber, "ptr") : contactNumber
        if(serviceName is String) {
            pin := HSTRING.Create(serviceName)
            serviceName := pin.Value
        }
        serviceName := serviceName is Win32Handle ? NumGet(serviceName, "ptr") : serviceName
        if(callDetails is String) {
            pin := HSTRING.Create(callDetails)
            callDetails := pin.Value
        }
        callDetails := callDetails is Win32Handle ? NumGet(callDetails, "ptr") : callDetails

        result := ComCall(9, this, "ptr", context_, "ptr", contactName, "ptr", contactNumber, "ptr", contactImage, "ptr", serviceName, "ptr", brandingImage, "ptr", callDetails, "ptr", ringtone, "uint", media, "ptr", ringTimeout, "ptr*", &call := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoipPhoneCall(call)
    }

    /**
     * 
     * @param {HSTRING} context_ 
     * @param {HSTRING} contactName 
     * @param {HSTRING} serviceName 
     * @param {Integer} media 
     * @returns {VoipPhoneCall} 
     */
    RequestNewOutgoingCall(context_, contactName, serviceName, media) {
        if(context_ is String) {
            pin := HSTRING.Create(context_)
            context_ := pin.Value
        }
        context_ := context_ is Win32Handle ? NumGet(context_, "ptr") : context_
        if(contactName is String) {
            pin := HSTRING.Create(contactName)
            contactName := pin.Value
        }
        contactName := contactName is Win32Handle ? NumGet(contactName, "ptr") : contactName
        if(serviceName is String) {
            pin := HSTRING.Create(serviceName)
            serviceName := pin.Value
        }
        serviceName := serviceName is Win32Handle ? NumGet(serviceName, "ptr") : serviceName

        result := ComCall(10, this, "ptr", context_, "ptr", contactName, "ptr", serviceName, "uint", media, "ptr*", &call := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoipPhoneCall(call)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyMuted() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyUnmuted() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} callUpgradeGuid 
     * @param {HSTRING} context_ 
     * @param {HSTRING} contactName 
     * @param {HSTRING} serviceName 
     * @returns {VoipPhoneCall} 
     */
    RequestOutgoingUpgradeToVideoCall(callUpgradeGuid, context_, contactName, serviceName) {
        if(context_ is String) {
            pin := HSTRING.Create(context_)
            context_ := pin.Value
        }
        context_ := context_ is Win32Handle ? NumGet(context_, "ptr") : context_
        if(contactName is String) {
            pin := HSTRING.Create(contactName)
            contactName := pin.Value
        }
        contactName := contactName is Win32Handle ? NumGet(contactName, "ptr") : contactName
        if(serviceName is String) {
            pin := HSTRING.Create(serviceName)
            serviceName := pin.Value
        }
        serviceName := serviceName is Win32Handle ? NumGet(serviceName, "ptr") : serviceName

        result := ComCall(13, this, "ptr", callUpgradeGuid, "ptr", context_, "ptr", contactName, "ptr", serviceName, "ptr*", &call := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoipPhoneCall(call)
    }

    /**
     * 
     * @param {HSTRING} context_ 
     * @param {HSTRING} contactName 
     * @param {HSTRING} contactNumber 
     * @param {Uri} contactImage 
     * @param {HSTRING} serviceName 
     * @param {Uri} brandingImage 
     * @param {HSTRING} callDetails 
     * @param {Uri} ringtone 
     * @param {TimeSpan} ringTimeout 
     * @returns {VoipPhoneCall} 
     */
    RequestIncomingUpgradeToVideoCall(context_, contactName, contactNumber, contactImage, serviceName, brandingImage, callDetails, ringtone, ringTimeout) {
        if(context_ is String) {
            pin := HSTRING.Create(context_)
            context_ := pin.Value
        }
        context_ := context_ is Win32Handle ? NumGet(context_, "ptr") : context_
        if(contactName is String) {
            pin := HSTRING.Create(contactName)
            contactName := pin.Value
        }
        contactName := contactName is Win32Handle ? NumGet(contactName, "ptr") : contactName
        if(contactNumber is String) {
            pin := HSTRING.Create(contactNumber)
            contactNumber := pin.Value
        }
        contactNumber := contactNumber is Win32Handle ? NumGet(contactNumber, "ptr") : contactNumber
        if(serviceName is String) {
            pin := HSTRING.Create(serviceName)
            serviceName := pin.Value
        }
        serviceName := serviceName is Win32Handle ? NumGet(serviceName, "ptr") : serviceName
        if(callDetails is String) {
            pin := HSTRING.Create(callDetails)
            callDetails := pin.Value
        }
        callDetails := callDetails is Win32Handle ? NumGet(callDetails, "ptr") : callDetails

        result := ComCall(14, this, "ptr", context_, "ptr", contactName, "ptr", contactNumber, "ptr", contactImage, "ptr", serviceName, "ptr", brandingImage, "ptr", callDetails, "ptr", ringtone, "ptr", ringTimeout, "ptr*", &call := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoipPhoneCall(call)
    }

    /**
     * 
     * @param {Guid} callUpgradeGuid 
     * @returns {HRESULT} 
     */
    TerminateCellularCall(callUpgradeGuid) {
        result := ComCall(15, this, "ptr", callUpgradeGuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} callUpgradeGuid 
     * @returns {HRESULT} 
     */
    CancelUpgrade(callUpgradeGuid) {
        result := ComCall(16, this, "ptr", callUpgradeGuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
