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
        result := ComCall(3, this, "ptr", pcDSBufferDesc, "ptr*", &ppDSBuffer := 0, "ptr", pUnkOuter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectSoundBuffer(ppDSBuffer)
    }

    /**
     * 
     * @returns {DSCAPS} 
     */
    GetCaps() {
        pDSCaps := DSCAPS()
        result := ComCall(4, this, "ptr", pDSCaps, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDSCaps
    }

    /**
     * 
     * @param {IDirectSoundBuffer} pDSBufferOriginal 
     * @returns {IDirectSoundBuffer} 
     */
    DuplicateSoundBuffer(pDSBufferOriginal) {
        result := ComCall(5, this, "ptr", pDSBufferOriginal, "ptr*", &ppDSBufferDuplicate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectSoundBuffer(ppDSBufferDuplicate)
    }

    /**
     * 
     * @param {HWND} hwnd_ 
     * @param {Integer} dwLevel 
     * @returns {HRESULT} 
     */
    SetCooperativeLevel(hwnd_, dwLevel) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(6, this, "ptr", hwnd_, "uint", dwLevel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Learn more about: CompactGrbit enumeration
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/compactgrbit-enumeration
     */
    Compact() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSpeakerConfig() {
        result := ComCall(8, this, "uint*", &pdwSpeakerConfig := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwSpeakerConfig
    }

    /**
     * 
     * @param {Integer} dwSpeakerConfig 
     * @returns {HRESULT} 
     */
    SetSpeakerConfig(dwSpeakerConfig) {
        result := ComCall(9, this, "uint", dwSpeakerConfig, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
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
     * @see https://learn.microsoft.com/windows/win32/api//content/roapi/nf-roapi-initialize
     */
    Initialize(pcGuidDevice) {
        result := ComCall(10, this, "ptr", pcGuidDevice, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
