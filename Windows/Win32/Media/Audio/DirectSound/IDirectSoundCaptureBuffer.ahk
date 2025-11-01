#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundCaptureBuffer extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCaps", "GetCurrentPosition", "GetFormat", "GetStatus", "Initialize", "Lock", "Start", "Stop", "Unlock"]

    /**
     * 
     * @param {Pointer<DSCBCAPS>} pDSCBCaps 
     * @returns {HRESULT} 
     */
    GetCaps(pDSCBCaps) {
        result := ComCall(3, this, "ptr", pDSCBCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCapturePosition 
     * @param {Pointer<Integer>} pdwReadPosition 
     * @returns {HRESULT} 
     */
    GetCurrentPosition(pdwCapturePosition, pdwReadPosition) {
        pdwCapturePositionMarshal := pdwCapturePosition is VarRef ? "uint*" : "ptr"
        pdwReadPositionMarshal := pdwReadPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCapturePositionMarshal, pdwCapturePosition, pdwReadPositionMarshal, pdwReadPosition, "HRESULT")
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
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IDirectSoundCapture} pDirectSoundCapture 
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
        result := ComCall(7, this, "ptr", pDirectSoundCapture, "ptr", pcDSCBufferDesc, "HRESULT")
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

        result := ComCall(8, this, "uint", dwOffset, "uint", dwBytes, "ptr*", ppvAudioPtr1, pdwAudioBytes1Marshal, pdwAudioBytes1, "ptr*", ppvAudioPtr2, pdwAudioBytes2Marshal, pdwAudioBytes2, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Start(dwFlags) {
        result := ComCall(9, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(10, this, "HRESULT")
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
        result := ComCall(11, this, "ptr", pvAudioPtr1, "uint", dwAudioBytes1, "ptr", pvAudioPtr2, "uint", dwAudioBytes2, "HRESULT")
        return result
    }
}
