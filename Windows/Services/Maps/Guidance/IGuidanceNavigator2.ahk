#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceNavigator2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceNavigator2
     * @type {Guid}
     */
    static IID => Guid("{6cdc50d1-041c-4bf3-b633-a101fc2f6b57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_AudioNotificationRequested", "remove_AudioNotificationRequested", "get_IsGuidanceAudioMuted", "put_IsGuidanceAudioMuted"]

    /**
     * @type {Boolean} 
     */
    IsGuidanceAudioMuted {
        get => this.get_IsGuidanceAudioMuted()
        set => this.put_IsGuidanceAudioMuted(value)
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, GuidanceAudioNotificationRequestedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_AudioNotificationRequested(value) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", value, "ptr", token, "int")
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
    remove_AudioNotificationRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGuidanceAudioMuted() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsGuidanceAudioMuted(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
