#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\DSCAPS.ahk" { DSCAPS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirectSoundBuffer.ahk" { IDirectSoundBuffer }
#Import ".\DSBUFFERDESC.ahk" { DSBUFFERDESC }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSound extends IUnknown {
    /**
     * The interface identifier for IDirectSound
     * @type {Guid}
     */
    static IID := Guid("{279afa83-4981-11ce-a521-0020af0be560}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSound interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateSoundBuffer    : IntPtr
        GetCaps              : IntPtr
        DuplicateSoundBuffer : IntPtr
        SetCooperativeLevel  : IntPtr
        Compact              : IntPtr
        GetSpeakerConfig     : IntPtr
        SetSpeakerConfig     : IntPtr
        Initialize           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSound.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DSBUFFERDESC>} pcDSBufferDesc 
     * @param {IUnknown} pUnkOuter 
     * @returns {IDirectSoundBuffer} 
     */
    CreateSoundBuffer(pcDSBufferDesc, pUnkOuter) {
        result := ComCall(3, this, DSBUFFERDESC.Ptr, pcDSBufferDesc, "ptr*", &ppDSBuffer := 0, "ptr", pUnkOuter, "HRESULT")
        return IDirectSoundBuffer(ppDSBuffer)
    }

    /**
     * 
     * @returns {DSCAPS} 
     */
    GetCaps() {
        pDSCaps := DSCAPS()
        result := ComCall(4, this, DSCAPS.Ptr, pDSCaps, "HRESULT")
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
     * @param {HWND} _hwnd 
     * @param {Integer} dwLevel 
     * @returns {HRESULT} 
     */
    SetCooperativeLevel(_hwnd, dwLevel) {
        result := ComCall(6, this, HWND, _hwnd, "uint", dwLevel, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(pcGuidDevice) {
        result := ComCall(10, this, Guid.Ptr, pcGuidDevice, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectSound.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSoundBuffer := CallbackCreate(GetMethod(implObj, "CreateSoundBuffer"), flags, 4)
        this.vtbl.GetCaps := CallbackCreate(GetMethod(implObj, "GetCaps"), flags, 2)
        this.vtbl.DuplicateSoundBuffer := CallbackCreate(GetMethod(implObj, "DuplicateSoundBuffer"), flags, 3)
        this.vtbl.SetCooperativeLevel := CallbackCreate(GetMethod(implObj, "SetCooperativeLevel"), flags, 3)
        this.vtbl.Compact := CallbackCreate(GetMethod(implObj, "Compact"), flags, 1)
        this.vtbl.GetSpeakerConfig := CallbackCreate(GetMethod(implObj, "GetSpeakerConfig"), flags, 2)
        this.vtbl.SetSpeakerConfig := CallbackCreate(GetMethod(implObj, "SetSpeakerConfig"), flags, 2)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSoundBuffer)
        CallbackFree(this.vtbl.GetCaps)
        CallbackFree(this.vtbl.DuplicateSoundBuffer)
        CallbackFree(this.vtbl.SetCooperativeLevel)
        CallbackFree(this.vtbl.Compact)
        CallbackFree(this.vtbl.GetSpeakerConfig)
        CallbackFree(this.vtbl.SetSpeakerConfig)
        CallbackFree(this.vtbl.Initialize)
    }
}
