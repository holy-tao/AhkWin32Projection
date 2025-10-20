#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectMusicSynth.ahk

/**
 * IDirectMusicSynth8is unsupported and may be altered or unavailable in the future.
 * @see https://docs.microsoft.com/windows/win32/api//dmusics/nn-dmusics-idirectmusicsynth8
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicSynth8 extends IDirectMusicSynth{
    /**
     * The interface identifier for IDirectMusicSynth8
     * @type {Guid}
     */
    static IID => Guid("{53cab625-2711-4c9f-9de7-1b7f925f6fc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Integer} rt 
     * @param {Integer} dwVoiceId 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannel 
     * @param {Integer} dwDLId 
     * @param {Integer} prPitch 
     * @param {Integer} vrVolume 
     * @param {Integer} stVoiceStart 
     * @param {Integer} stLoopStart 
     * @param {Integer} stLoopEnd 
     * @returns {HRESULT} 
     */
    PlayVoice(rt, dwVoiceId, dwChannelGroup, dwChannel, dwDLId, prPitch, vrVolume, stVoiceStart, stLoopStart, stLoopEnd) {
        result := ComCall(20, this, "int64", rt, "uint", dwVoiceId, "uint", dwChannelGroup, "uint", dwChannel, "uint", dwDLId, "int", prPitch, "int", vrVolume, "uint", stVoiceStart, "uint", stLoopStart, "uint", stLoopEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rt 
     * @param {Integer} dwVoiceId 
     * @returns {HRESULT} 
     */
    StopVoice(rt, dwVoiceId) {
        result := ComCall(21, this, "int64", rt, "uint", dwVoiceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} dwVoice 
     * @param {Integer} cbVoice 
     * @param {Pointer<DMUS_VOICE_STATE>} dwVoiceState 
     * @returns {HRESULT} 
     */
    GetVoiceState(dwVoice, cbVoice, dwVoiceState) {
        result := ComCall(22, this, "uint*", dwVoice, "uint", cbVoice, "ptr", dwVoiceState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDownloadID 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Refresh(dwDownloadID, dwFlags) {
        result := ComCall(23, this, "uint", dwDownloadID, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannel 
     * @param {Pointer<UInt32>} pdwBuses 
     * @param {Integer} cBuses 
     * @returns {HRESULT} 
     */
    AssignChannelToBuses(dwChannelGroup, dwChannel, pdwBuses, cBuses) {
        result := ComCall(24, this, "uint", dwChannelGroup, "uint", dwChannel, "uint*", pdwBuses, "uint", cBuses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
