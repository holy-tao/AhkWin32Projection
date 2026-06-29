#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DMUS_VOICE_STATE.ahk" { DMUS_VOICE_STATE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirectMusicSynth.ahk" { IDirectMusicSynth }

/**
 * IDirectMusicSynth8is unsupported and may be altered or unavailable in the future.
 * @see https://learn.microsoft.com/windows/win32/api/dmusics/nn-dmusics-idirectmusicsynth8
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct IDirectMusicSynth8 extends IDirectMusicSynth {
    /**
     * The interface identifier for IDirectMusicSynth8
     * @type {Guid}
     */
    static IID := Guid("{53cab625-2711-4c9f-9de7-1b7f925f6fc8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectMusicSynth8 interfaces
    */
    struct Vtbl extends IDirectMusicSynth.Vtbl {
        PlayVoice            : IntPtr
        StopVoice            : IntPtr
        GetVoiceState        : IntPtr
        Refresh              : IntPtr
        AssignChannelToBuses : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectMusicSynth8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * PlayVoice is unsupported and may be altered or unavailable in the future.
     * @param {Integer} rt 
     * @param {Integer} dwVoiceId 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannel 
     * @param {Integer} dwDLId 
     * @param {Integer} prPitch PREL not defined here.
     * @param {Integer} vrVolume VREL not defined here.
     * @param {Integer} stVoiceStart 
     * @param {Integer} stLoopStart 
     * @param {Integer} stLoopEnd 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth8-playvoice
     */
    PlayVoice(rt, dwVoiceId, dwChannelGroup, dwChannel, dwDLId, prPitch, vrVolume, stVoiceStart, stLoopStart, stLoopEnd) {
        result := ComCall(20, this, "int64", rt, "uint", dwVoiceId, "uint", dwChannelGroup, "uint", dwChannel, "uint", dwDLId, "int", prPitch, "int", vrVolume, "uint", stVoiceStart, "uint", stLoopStart, "uint", stLoopEnd, "HRESULT")
        return result
    }

    /**
     * StopVoice is unsupported and may be altered or unavailable in the future.
     * @param {Integer} rt 
     * @param {Integer} dwVoiceId 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth8-stopvoice
     */
    StopVoice(rt, dwVoiceId) {
        result := ComCall(21, this, "int64", rt, "uint", dwVoiceId, "HRESULT")
        return result
    }

    /**
     * GetVoiceState is unsupported and may be altered or unavailable in the future.
     * @param {Pointer<Integer>} dwVoice 
     * @param {Integer} cbVoice 
     * @param {Pointer<DMUS_VOICE_STATE>} dwVoiceState 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth8-getvoicestate
     */
    GetVoiceState(dwVoice, cbVoice, dwVoiceState) {
        dwVoiceMarshal := dwVoice is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, dwVoiceMarshal, dwVoice, "uint", cbVoice, DMUS_VOICE_STATE.Ptr, dwVoiceState, "HRESULT")
        return result
    }

    /**
     * Refresh is unsupported and may be altered or unavailable in the future.
     * @param {Integer} dwDownloadID 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth8-refresh
     */
    Refresh(dwDownloadID, dwFlags) {
        result := ComCall(23, this, "uint", dwDownloadID, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * AssignChannelToBuses is unsupported and may be altered or unavailable in the future.
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannel 
     * @param {Pointer<Integer>} pdwBuses 
     * @param {Integer} cBuses 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth8-assignchanneltobuses
     */
    AssignChannelToBuses(dwChannelGroup, dwChannel, pdwBuses, cBuses) {
        pdwBusesMarshal := pdwBuses is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "uint", dwChannelGroup, "uint", dwChannel, pdwBusesMarshal, pdwBuses, "uint", cBuses, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectMusicSynth8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PlayVoice := CallbackCreate(GetMethod(implObj, "PlayVoice"), flags, 11)
        this.vtbl.StopVoice := CallbackCreate(GetMethod(implObj, "StopVoice"), flags, 3)
        this.vtbl.GetVoiceState := CallbackCreate(GetMethod(implObj, "GetVoiceState"), flags, 4)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 3)
        this.vtbl.AssignChannelToBuses := CallbackCreate(GetMethod(implObj, "AssignChannelToBuses"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PlayVoice)
        CallbackFree(this.vtbl.StopVoice)
        CallbackFree(this.vtbl.GetVoiceState)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.AssignChannelToBuses)
    }
}
