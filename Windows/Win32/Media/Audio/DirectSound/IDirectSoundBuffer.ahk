#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<DSBCAPS>} pDSBufferCaps 
     * @returns {HRESULT} 
     */
    GetCaps(pDSBufferCaps) {
        result := ComCall(3, this, "ptr", pDSBufferCaps, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwSizeWritten 
     * @returns {HRESULT} 
     */
    GetFormat(pwfxFormat, dwSizeAllocated, pdwSizeWritten) {
        pdwSizeWrittenMarshal := pdwSizeWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pwfxFormat, "uint", dwSizeAllocated, pdwSizeWrittenMarshal, pdwSizeWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plVolume 
     * @returns {HRESULT} 
     */
    GetVolume(plVolume) {
        plVolumeMarshal := plVolume is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, plVolumeMarshal, plVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPan 
     * @returns {HRESULT} 
     */
    GetPan(plPan) {
        plPanMarshal := plPan is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plPanMarshal, plPan, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFrequency 
     * @returns {HRESULT} 
     */
    GetFrequency(pdwFrequency) {
        pdwFrequencyMarshal := pdwFrequency is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwFrequencyMarshal, pdwFrequency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
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
        pdwAudioBytes1Marshal := pdwAudioBytes1 is VarRef ? "uint*" : "ptr"
        pdwAudioBytes2Marshal := pdwAudioBytes2 is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", dwOffset, "uint", dwBytes, "ptr*", ppvAudioPtr1, pdwAudioBytes1Marshal, pdwAudioBytes1, "ptr*", ppvAudioPtr2, pdwAudioBytes2Marshal, pdwAudioBytes2, "uint", dwFlags, "HRESULT")
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
