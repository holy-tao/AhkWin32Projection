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
     * 
     * @param {Pointer<Guid>} AudioSessionGuid 
     * @param {Integer} StreamFlags 
     * @returns {IAudioSessionControl} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager-getaudiosessioncontrol
     */
    GetAudioSessionControl(AudioSessionGuid, StreamFlags) {
        result := ComCall(3, this, "ptr", AudioSessionGuid, "uint", StreamFlags, "ptr*", &SessionControl := 0, "HRESULT")
        return IAudioSessionControl(SessionControl)
    }

    /**
     * 
     * @param {Pointer<Guid>} AudioSessionGuid 
     * @param {Integer} StreamFlags 
     * @returns {ISimpleAudioVolume} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager-getsimpleaudiovolume
     */
    GetSimpleAudioVolume(AudioSessionGuid, StreamFlags) {
        result := ComCall(4, this, "ptr", AudioSessionGuid, "uint", StreamFlags, "ptr*", &AudioVolume := 0, "HRESULT")
        return ISimpleAudioVolume(AudioVolume)
    }
}
