#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFullDuplex extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSoundFullDuplex
     * @type {Guid}
     */
    static IID => Guid("{edcb4c7a-daab-4216-a42e-6c50596ddc1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<Guid>} pCaptureGuid 
     * @param {Pointer<Guid>} pRenderGuid 
     * @param {Pointer<DSCBUFFERDESC>} lpDscBufferDesc 
     * @param {Pointer<DSBUFFERDESC>} lpDsBufferDesc 
     * @param {HWND} hWnd 
     * @param {Integer} dwLevel 
     * @param {Pointer<IDirectSoundCaptureBuffer8>} lplpDirectSoundCaptureBuffer8 
     * @param {Pointer<IDirectSoundBuffer8>} lplpDirectSoundBuffer8 
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
    Initialize(pCaptureGuid, pRenderGuid, lpDscBufferDesc, lpDsBufferDesc, hWnd, dwLevel, lplpDirectSoundCaptureBuffer8, lplpDirectSoundBuffer8) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(3, this, "ptr", pCaptureGuid, "ptr", pRenderGuid, "ptr", lpDscBufferDesc, "ptr", lpDsBufferDesc, "ptr", hWnd, "uint", dwLevel, "ptr*", lplpDirectSoundCaptureBuffer8, "ptr*", lplpDirectSoundBuffer8, "HRESULT")
        return result
    }
}
