#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DSBCAPS.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSoundBuffer
     * @type {Guid}
     */
    static IID => Guid("{279afa85-4981-11ce-a521-0020af0be560}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCaps", "GetCurrentPosition", "GetFormat", "GetVolume", "GetPan", "GetFrequency", "GetStatus", "Initialize", "Lock", "Play", "SetCurrentPosition", "SetFormat", "SetVolume", "SetPan", "SetFrequency", "Stop", "Unlock", "Restore"]

    /**
     * 
     * @returns {DSBCAPS} 
     */
    GetCaps() {
        pDSBufferCaps := DSBCAPS()
        result := ComCall(3, this, "ptr", pDSBufferCaps, "HRESULT")
        return pDSBufferCaps
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCurrentPlayCursor 
     * @param {Pointer<Integer>} pdwCurrentWriteCursor 
     * @returns {HRESULT} 
     */
    GetCurrentPosition(pdwCurrentPlayCursor, pdwCurrentWriteCursor) {
        pdwCurrentPlayCursorMarshal := pdwCurrentPlayCursor is VarRef ? "uint*" : "ptr"
        pdwCurrentWriteCursorMarshal := pdwCurrentWriteCursor is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCurrentPlayCursorMarshal, pdwCurrentPlayCursor, pdwCurrentWriteCursorMarshal, pdwCurrentWriteCursor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pwfxFormat 
     * @param {Integer} dwSizeAllocated 
     * @returns {Integer} 
     */
    GetFormat(pwfxFormat, dwSizeAllocated) {
        result := ComCall(5, this, "ptr", pwfxFormat, "uint", dwSizeAllocated, "uint*", &pdwSizeWritten := 0, "HRESULT")
        return pdwSizeWritten
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetVolume() {
        result := ComCall(6, this, "int*", &plVolume := 0, "HRESULT")
        return plVolume
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPan() {
        result := ComCall(7, this, "int*", &plPan := 0, "HRESULT")
        return plPan
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFrequency() {
        result := ComCall(8, this, "uint*", &pdwFrequency := 0, "HRESULT")
        return pdwFrequency
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStatus() {
        result := ComCall(9, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IDirectSound} pDirectSound 
     * @param {Pointer<DSBUFFERDESC>} pcDSBufferDesc 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pDirectSound, pcDSBufferDesc) {
        result := ComCall(10, this, "ptr", pDirectSound, "ptr", pcDSBufferDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOffset 
     * @param {Integer} dwBytes 
     * @param {Pointer<Pointer<Void>>} ppvAudioPtr1 
     * @param {Pointer<Integer>} pdwAudioBytes1 
     * @param {Pointer<Pointer<Void>>} ppvAudioPtr2 
     * @param {Pointer<Integer>} pdwAudioBytes2 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Lock(dwOffset, dwBytes, ppvAudioPtr1, pdwAudioBytes1, ppvAudioPtr2, pdwAudioBytes2, dwFlags) {
        ppvAudioPtr1Marshal := ppvAudioPtr1 is VarRef ? "ptr*" : "ptr"
        pdwAudioBytes1Marshal := pdwAudioBytes1 is VarRef ? "uint*" : "ptr"
        ppvAudioPtr2Marshal := ppvAudioPtr2 is VarRef ? "ptr*" : "ptr"
        pdwAudioBytes2Marshal := pdwAudioBytes2 is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", dwOffset, "uint", dwBytes, ppvAudioPtr1Marshal, ppvAudioPtr1, pdwAudioBytes1Marshal, pdwAudioBytes1, ppvAudioPtr2Marshal, ppvAudioPtr2, pdwAudioBytes2Marshal, pdwAudioBytes2, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwReserved1 
     * @param {Integer} dwPriority 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Play(dwReserved1, dwPriority, dwFlags) {
        result := ComCall(12, this, "uint", dwReserved1, "uint", dwPriority, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwNewPosition 
     * @returns {HRESULT} 
     */
    SetCurrentPosition(dwNewPosition) {
        result := ComCall(13, this, "uint", dwNewPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pcfxFormat 
     * @returns {HRESULT} 
     */
    SetFormat(pcfxFormat) {
        result := ComCall(14, this, "ptr", pcfxFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     */
    SetVolume(lVolume) {
        result := ComCall(15, this, "int", lVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPan 
     * @returns {HRESULT} 
     */
    SetPan(lPan) {
        result := ComCall(16, this, "int", lPan, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFrequency 
     * @returns {HRESULT} 
     */
    SetFrequency(dwFrequency) {
        result := ComCall(17, this, "uint", dwFrequency, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pvAudioPtr1 
     * @param {Integer} dwAudioBytes1 
     * @param {Pointer} pvAudioPtr2 
     * @param {Integer} dwAudioBytes2 
     * @returns {HRESULT} 
     */
    Unlock(pvAudioPtr1, dwAudioBytes1, pvAudioPtr2, dwAudioBytes2) {
        result := ComCall(19, this, "ptr", pvAudioPtr1, "uint", dwAudioBytes1, "ptr", pvAudioPtr2, "uint", dwAudioBytes2, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Restore() {
        result := ComCall(20, this, "HRESULT")
        return result
    }
}
