#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DSCBUFFERDESC.ahk" { DSCBUFFERDESC }
#Import ".\IDirectSoundBuffer8.ahk" { IDirectSoundBuffer8 }
#Import ".\IDirectSoundCaptureBuffer8.ahk" { IDirectSoundCaptureBuffer8 }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DSBUFFERDESC.ahk" { DSBUFFERDESC }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundFullDuplex extends IUnknown {
    /**
     * The interface identifier for IDirectSoundFullDuplex
     * @type {Guid}
     */
    static IID := Guid("{edcb4c7a-daab-4216-a42e-6c50596ddc1d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundFullDuplex interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundFullDuplex.Vtbl()
        }
        super.__New(implObj, flags)
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
     * @param {Pointer<Guid>} pCaptureGuid 
     * @param {Pointer<Guid>} pRenderGuid 
     * @param {Pointer<DSCBUFFERDESC>} lpDscBufferDesc 
     * @param {Pointer<DSBUFFERDESC>} lpDsBufferDesc 
     * @param {HWND} _hWnd 
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
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(pCaptureGuid, pRenderGuid, lpDscBufferDesc, lpDsBufferDesc, _hWnd, dwLevel, lplpDirectSoundCaptureBuffer8, lplpDirectSoundBuffer8) {
        result := ComCall(3, this, Guid.Ptr, pCaptureGuid, Guid.Ptr, pRenderGuid, DSCBUFFERDESC.Ptr, lpDscBufferDesc, DSBUFFERDESC.Ptr, lpDsBufferDesc, HWND, _hWnd, "uint", dwLevel, IDirectSoundCaptureBuffer8.Ptr, lplpDirectSoundCaptureBuffer8, IDirectSoundBuffer8.Ptr, lplpDirectSoundBuffer8, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectSoundFullDuplex.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
