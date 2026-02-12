#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceNavigator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceNavigator
     * @type {Guid}
     */
    static IID => Guid("{08f17ef7-8e3f-4d9a-be8a-108f9a012c67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartNavigating", "StartSimulating", "StartTracking", "Pause", "Resume", "Stop", "RepeatLastAudioNotification", "get_AudioMeasurementSystem", "put_AudioMeasurementSystem", "get_AudioNotifications", "put_AudioNotifications", "add_GuidanceUpdated", "remove_GuidanceUpdated", "add_DestinationReached", "remove_DestinationReached", "add_Rerouting", "remove_Rerouting", "add_Rerouted", "remove_Rerouted", "add_RerouteFailed", "remove_RerouteFailed", "add_UserLocationLost", "remove_UserLocationLost", "add_UserLocationRestored", "remove_UserLocationRestored", "SetGuidanceVoice", "UpdateUserLocation", "UpdateUserLocationWithPositionOverride"]

    /**
     * @type {Integer} 
     */
    AudioMeasurementSystem {
        get => this.get_AudioMeasurementSystem()
        set => this.put_AudioMeasurementSystem(value)
    }

    /**
     * @type {Integer} 
     */
    AudioNotifications {
        get => this.get_AudioNotifications()
        set => this.put_AudioNotifications(value)
    }

    /**
     * 
     * @param {GuidanceRoute} route 
     * @returns {HRESULT} 
     */
    StartNavigating(route) {
        result := ComCall(6, this, "ptr", route, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {GuidanceRoute} route 
     * @param {Integer} speedInMetersPerSecond 
     * @returns {HRESULT} 
     */
    StartSimulating(route, speedInMetersPerSecond) {
        result := ComCall(7, this, "ptr", route, "int", speedInMetersPerSecond, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartTracking() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
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
    RepeatLastAudioNotification() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioMeasurementSystem() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioMeasurementSystem(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioNotifications() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioNotifications(value) {
        result := ComCall(16, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, GuidanceUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GuidanceUpdated(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
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
    remove_GuidanceUpdated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DestinationReached(handler) {
        token := EventRegistrationToken()
        result := ComCall(19, this, "ptr", handler, "ptr", token, "int")
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
    remove_DestinationReached(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(20, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Rerouting(handler) {
        token := EventRegistrationToken()
        result := ComCall(21, this, "ptr", handler, "ptr", token, "int")
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
    remove_Rerouting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(22, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, GuidanceReroutedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Rerouted(handler) {
        token := EventRegistrationToken()
        result := ComCall(23, this, "ptr", handler, "ptr", token, "int")
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
    remove_Rerouted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(24, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RerouteFailed(handler) {
        token := EventRegistrationToken()
        result := ComCall(25, this, "ptr", handler, "ptr", token, "int")
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
    remove_RerouteFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(26, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UserLocationLost(handler) {
        token := EventRegistrationToken()
        result := ComCall(27, this, "ptr", handler, "ptr", token, "int")
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
    remove_UserLocationLost(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(28, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UserLocationRestored(handler) {
        token := EventRegistrationToken()
        result := ComCall(29, this, "ptr", handler, "ptr", token, "int")
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
    remove_UserLocationRestored(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(30, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} voiceId 
     * @param {HSTRING} voiceFolder 
     * @returns {HRESULT} 
     */
    SetGuidanceVoice(voiceId, voiceFolder) {
        if(voiceFolder is String) {
            pin := HSTRING.Create(voiceFolder)
            voiceFolder := pin.Value
        }
        voiceFolder := voiceFolder is Win32Handle ? NumGet(voiceFolder, "ptr") : voiceFolder

        result := ComCall(31, this, "int", voiceId, "ptr", voiceFolder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Geocoordinate} userLocation 
     * @returns {HRESULT} 
     */
    UpdateUserLocation(userLocation) {
        result := ComCall(32, this, "ptr", userLocation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Geocoordinate} userLocation 
     * @param {BasicGeoposition} positionOverride 
     * @returns {HRESULT} 
     */
    UpdateUserLocationWithPositionOverride(userLocation, positionOverride) {
        result := ComCall(33, this, "ptr", userLocation, "ptr", positionOverride, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
