#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAudioSessionControl.ahk
#Include .\ISimpleAudioVolume.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSessionManager interface enables a client to access the session controls and volume controls for both cross-process and process-specific audio sessions.
 * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nn-audiopolicy-iaudiosessionmanager
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSessionManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSessionManager
     * @type {Guid}
     */
    static IID => Guid("{bfa971f1-4d5e-40bb-935e-967039bfbee4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAudioSessionControl", "GetSimpleAudioVolume"]

    /**
     * The GetAudioSessionControl method retrieves an audio session control.
     * @param {Pointer<Guid>} AudioSessionGuid Pointer to a session GUID. If the GUID does not identify a session that has been previously opened, the call opens a new but empty session. The Sndvol program does not display a volume-level control for a session unless it contains one or more active streams. If this parameter is <b>NULL</b> or points to the value GUID_NULL, the method assigns the stream to the default session.
     * @param {Integer} StreamFlags Specifies the status of the flags for the audio stream.
     * @returns {IAudioSessionControl} Pointer to a pointer variable into which the method writes a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> interface of the audio session control object. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the call fails, <i>*SessionControl</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionmanager-getaudiosessioncontrol
     */
    GetAudioSessionControl(AudioSessionGuid, StreamFlags) {
        result := ComCall(3, this, "ptr", AudioSessionGuid, "uint", StreamFlags, "ptr*", &SessionControl := 0, "HRESULT")
        return IAudioSessionControl(SessionControl)
    }

    /**
     * The GetSimpleAudioVolume method retrieves a simple audio volume control.
     * @param {Pointer<Guid>} AudioSessionGuid Pointer to a session GUID. If the GUID does not identify a session that has been previously opened, the call opens a new but empty session. The Sndvol program does not display a volume-level control for a session unless it contains one or more active streams. If this parameter is <b>NULL</b> or points to the value GUID_NULL, the method assigns the stream to the default session.
     * @param {Integer} StreamFlags Specifies whether the request is for a cross-process session. Set to <b>TRUE</b> if the session is cross-process. Set to <b>FALSE</b> if the session is not cross-process.
     * @returns {ISimpleAudioVolume} Pointer to a pointer variable into which the method writes a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-isimpleaudiovolume">ISimpleAudioVolume</a> interface of the audio volume control object. This interface represents the simple audio volume control for the current process. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>Activate</b> call fails, <i>*AudioVolume</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionmanager-getsimpleaudiovolume
     */
    GetSimpleAudioVolume(AudioSessionGuid, StreamFlags) {
        result := ComCall(4, this, "ptr", AudioSessionGuid, "uint", StreamFlags, "ptr*", &AudioVolume := 0, "HRESULT")
        return ISimpleAudioVolume(AudioVolume)
    }
}
