#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectSoundBuffer.ahk
#Include .\DSCAPS.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSound extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSound
     * @type {Guid}
     */
    static IID => Guid("{279afa83-4981-11ce-a521-0020af0be560}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSoundBuffer", "GetCaps", "DuplicateSoundBuffer", "SetCooperativeLevel", "Compact", "GetSpeakerConfig", "SetSpeakerConfig", "Initialize"]

    /**
     * 
     * @param {Pointer<DSBUFFERDESC>} pcDSBufferDesc 
     * @param {IUnknown} pUnkOuter 
     * @returns {IDirectSoundBuffer} 
     */
    CreateSoundBuffer(pcDSBufferDesc, pUnkOuter) {
        result := ComCall(3, this, "ptr", pcDSBufferDesc, "ptr*", &ppDSBuffer := 0, "ptr", pUnkOuter, "HRESULT")
        return IDirectSoundBuffer(ppDSBuffer)
    }

    /**
     * 
     * @returns {DSCAPS} 
     */
    GetCaps() {
        pDSCaps := DSCAPS()
        result := ComCall(4, this, "ptr", pDSCaps, "HRESULT")
        return pDSCaps
    }

    /**
     * 
     * @param {IDirectSoundBuffer} pDSBufferOriginal 
     * @returns {IDirectSoundBuffer} 
     */
    DuplicateSoundBuffer(pDSBufferOriginal) {
        result := ComCall(5, this, "ptr", pDSBufferOriginal, "ptr*", &ppDSBufferDuplicate := 0, "HRESULT")
        return IDirectSoundBuffer(ppDSBufferDuplicate)
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} dwLevel 
     * @returns {HRESULT} 
     */
    SetCooperativeLevel(hwnd, dwLevel) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "uint", dwLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Compact() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSpeakerConfig() {
        result := ComCall(8, this, "uint*", &pdwSpeakerConfig := 0, "HRESULT")
        return pdwSpeakerConfig
    }

    /**
     * 
     * @param {Integer} dwSpeakerConfig 
     * @returns {HRESULT} 
     */
    SetSpeakerConfig(dwSpeakerConfig) {
        result := ComCall(9, this, "uint", dwSpeakerConfig, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<Guid>} pcGuidDevice 
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
    Initialize(pcGuidDevice) {
        result := ComCall(10, this, "ptr", pcGuidDevice, "HRESULT")
        return result
    }
}
