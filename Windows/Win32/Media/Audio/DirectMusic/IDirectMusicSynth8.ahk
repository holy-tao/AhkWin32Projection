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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PlayVoice", "StopVoice", "GetVoiceState", "Refresh", "AssignChannelToBuses"]

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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth8-playvoice
     */
    PlayVoice(rt, dwVoiceId, dwChannelGroup, dwChannel, dwDLId, prPitch, vrVolume, stVoiceStart, stLoopStart, stLoopEnd) {
        result := ComCall(20, this, "int64", rt, "uint", dwVoiceId, "uint", dwChannelGroup, "uint", dwChannel, "uint", dwDLId, "int", prPitch, "int", vrVolume, "uint", stVoiceStart, "uint", stLoopStart, "uint", stLoopEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rt 
     * @param {Integer} dwVoiceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth8-stopvoice
     */
    StopVoice(rt, dwVoiceId) {
        result := ComCall(21, this, "int64", rt, "uint", dwVoiceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} dwVoice 
     * @param {Integer} cbVoice 
     * @param {Pointer<DMUS_VOICE_STATE>} dwVoiceState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth8-getvoicestate
     */
    GetVoiceState(dwVoice, cbVoice, dwVoiceState) {
        dwVoiceMarshal := dwVoice is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, dwVoiceMarshal, dwVoice, "uint", cbVoice, "ptr", dwVoiceState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDownloadID 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth8-refresh
     */
    Refresh(dwDownloadID, dwFlags) {
        result := ComCall(23, this, "uint", dwDownloadID, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannel 
     * @param {Pointer<Integer>} pdwBuses 
     * @param {Integer} cBuses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth8-assignchanneltobuses
     */
    AssignChannelToBuses(dwChannelGroup, dwChannel, pdwBuses, cBuses) {
        pdwBusesMarshal := pdwBuses is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "uint", dwChannelGroup, "uint", dwChannel, pdwBusesMarshal, pdwBuses, "uint", cBuses, "HRESULT")
        return result
    }
}
