#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSessionEvents interface provides notifications of session-related events such as changes in the volume level, display name, and session state.
 * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nn-audiopolicy-iaudiosessionevents
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSessionEvents extends IUnknown{
    /**
     * The interface identifier for IAudioSessionEvents
     * @type {Guid}
     */
    static IID => Guid("{24918acc-64b3-37c1-8ca9-74a66e9957a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} NewDisplayName 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    OnDisplayNameChanged(NewDisplayName, EventContext) {
        NewDisplayName := NewDisplayName is String ? StrPtr(NewDisplayName) : NewDisplayName

        result := ComCall(3, this, "ptr", NewDisplayName, "ptr", EventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} NewIconPath 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    OnIconPathChanged(NewIconPath, EventContext) {
        NewIconPath := NewIconPath is String ? StrPtr(NewIconPath) : NewIconPath

        result := ComCall(4, this, "ptr", NewIconPath, "ptr", EventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} NewVolume 
     * @param {BOOL} NewMute 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    OnSimpleVolumeChanged(NewVolume, NewMute, EventContext) {
        result := ComCall(5, this, "float", NewVolume, "int", NewMute, "ptr", EventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ChannelCount 
     * @param {Pointer<Single>} NewChannelVolumeArray 
     * @param {Integer} ChangedChannel 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    OnChannelVolumeChanged(ChannelCount, NewChannelVolumeArray, ChangedChannel, EventContext) {
        result := ComCall(6, this, "uint", ChannelCount, "float*", NewChannelVolumeArray, "uint", ChangedChannel, "ptr", EventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} NewGroupingParam 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     */
    OnGroupingParamChanged(NewGroupingParam, EventContext) {
        result := ComCall(7, this, "ptr", NewGroupingParam, "ptr", EventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewState 
     * @returns {HRESULT} 
     */
    OnStateChanged(NewState) {
        result := ComCall(8, this, "int", NewState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DisconnectReason 
     * @returns {HRESULT} 
     */
    OnSessionDisconnected(DisconnectReason) {
        result := ComCall(9, this, "int", DisconnectReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
