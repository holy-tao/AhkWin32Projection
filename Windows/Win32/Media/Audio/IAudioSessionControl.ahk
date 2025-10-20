#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSessionControl interface enables a client to configure the control parameters for an audio session and to monitor events in the session.
 * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nn-audiopolicy-iaudiosessioncontrol
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSessionControl extends IUnknown{
    /**
     * The interface identifier for IAudioSessionControl
     * @type {Guid}
     */
    static IID => Guid("{f4b1a599-7266-4319-a8ca-e70acb11e8cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    GetState(pRetVal) {
        result := ComCall(3, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pRetVal 
     * @returns {HRESULT} 
     */
    GetDisplayName(pRetVal) {
        result := ComCall(4, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Value 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    SetDisplayName(Value, EventContext) {
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(5, this, "ptr", Value, "ptr", EventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pRetVal 
     * @returns {HRESULT} 
     */
    GetIconPath(pRetVal) {
        result := ComCall(6, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Value 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    SetIconPath(Value, EventContext) {
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(7, this, "ptr", Value, "ptr", EventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pRetVal 
     * @returns {HRESULT} 
     */
    GetGroupingParam(pRetVal) {
        result := ComCall(8, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Override 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    SetGroupingParam(Override, EventContext) {
        result := ComCall(9, this, "ptr", Override, "ptr", EventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioSessionEvents>} NewNotifications 
     * @returns {HRESULT} 
     */
    RegisterAudioSessionNotification(NewNotifications) {
        result := ComCall(10, this, "ptr", NewNotifications, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioSessionEvents>} NewNotifications 
     * @returns {HRESULT} 
     */
    UnregisterAudioSessionNotification(NewNotifications) {
        result := ComCall(11, this, "ptr", NewNotifications, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
