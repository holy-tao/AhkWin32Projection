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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetState", "GetDisplayName", "SetDisplayName", "GetIconPath", "SetIconPath", "GetGroupingParam", "SetGroupingParam", "RegisterAudioSessionNotification", "UnregisterAudioSessionNotification"]

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-getstate
     */
    GetState(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-getdisplayname
     */
    GetDisplayName(pRetVal) {
        result := ComCall(4, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Value 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setdisplayname
     */
    SetDisplayName(Value, EventContext) {
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(5, this, "ptr", Value, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-geticonpath
     */
    GetIconPath(pRetVal) {
        result := ComCall(6, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Value 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-seticonpath
     */
    SetIconPath(Value, EventContext) {
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(7, this, "ptr", Value, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-getgroupingparam
     */
    GetGroupingParam(pRetVal) {
        result := ComCall(8, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Override 
     * @param {Pointer<Guid>} EventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setgroupingparam
     */
    SetGroupingParam(Override, EventContext) {
        result := ComCall(9, this, "ptr", Override, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioSessionEvents} NewNotifications 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-registeraudiosessionnotification
     */
    RegisterAudioSessionNotification(NewNotifications) {
        result := ComCall(10, this, "ptr", NewNotifications, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioSessionEvents} NewNotifications 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-unregisteraudiosessionnotification
     */
    UnregisterAudioSessionNotification(NewNotifications) {
        result := ComCall(11, this, "ptr", NewNotifications, "HRESULT")
        return result
    }
}
