#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSessionManager interface enables a client to access the session controls and volume controls for both cross-process and process-specific audio sessions.
 * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nn-audiopolicy-iaudiosessionmanager
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSessionManager extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} AudioSessionGuid 
     * @param {Integer} StreamFlags 
     * @param {Pointer<IAudioSessionControl>} SessionControl 
     * @returns {HRESULT} 
     */
    GetAudioSessionControl(AudioSessionGuid, StreamFlags, SessionControl) {
        result := ComCall(3, this, "ptr", AudioSessionGuid, "uint", StreamFlags, "ptr", SessionControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} AudioSessionGuid 
     * @param {Integer} StreamFlags 
     * @param {Pointer<ISimpleAudioVolume>} AudioVolume 
     * @returns {HRESULT} 
     */
    GetSimpleAudioVolume(AudioSessionGuid, StreamFlags, AudioVolume) {
        result := ComCall(4, this, "ptr", AudioSessionGuid, "uint", StreamFlags, "ptr", AudioVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
