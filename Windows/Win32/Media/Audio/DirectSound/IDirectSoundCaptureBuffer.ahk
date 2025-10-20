#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundCaptureBuffer extends IUnknown{
    /**
     * The interface identifier for IDirectSoundCaptureBuffer
     * @type {Guid}
     */
    static IID => Guid("{b0210782-89cd-11d0-af08-00a0c925cd16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DSCBCAPS>} pDSCBCaps 
     * @returns {HRESULT} 
     */
    GetCaps(pDSCBCaps) {
        result := ComCall(3, this, "ptr", pDSCBCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCapturePosition 
     * @param {Pointer<UInt32>} pdwReadPosition 
     * @returns {HRESULT} 
     */
    GetCurrentPosition(pdwCapturePosition, pdwReadPosition) {
        result := ComCall(4, this, "uint*", pdwCapturePosition, "uint*", pdwReadPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pwfxFormat 
     * @param {Integer} dwSizeAllocated 
     * @param {Pointer<UInt32>} pdwSizeWritten 
     * @returns {HRESULT} 
     */
    GetFormat(pwfxFormat, dwSizeAllocated, pdwSizeWritten) {
        result := ComCall(5, this, "ptr", pwfxFormat, "uint", dwSizeAllocated, "uint*", pdwSizeWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        result := ComCall(6, this, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IDirectSoundCapture>} pDirectSoundCapture 
     * @param {Pointer<DSCBUFFERDESC>} pcDSCBufferDesc 
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
    Initialize(pDirectSoundCapture, pcDSCBufferDesc) {
        result := ComCall(7, this, "ptr", pDirectSoundCapture, "ptr", pcDSCBufferDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOffset 
     * @param {Integer} dwBytes 
     * @param {Pointer<Void>} ppvAudioPtr1 
     * @param {Pointer<UInt32>} pdwAudioBytes1 
     * @param {Pointer<Void>} ppvAudioPtr2 
     * @param {Pointer<UInt32>} pdwAudioBytes2 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Lock(dwOffset, dwBytes, ppvAudioPtr1, pdwAudioBytes1, ppvAudioPtr2, pdwAudioBytes2, dwFlags) {
        result := ComCall(8, this, "uint", dwOffset, "uint", dwBytes, "ptr", ppvAudioPtr1, "uint*", pdwAudioBytes1, "ptr", ppvAudioPtr2, "uint*", pdwAudioBytes2, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Start(dwFlags) {
        result := ComCall(9, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(11, this, "ptr", pvAudioPtr1, "uint", dwAudioBytes1, "ptr", pvAudioPtr2, "uint", dwAudioBytes2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
