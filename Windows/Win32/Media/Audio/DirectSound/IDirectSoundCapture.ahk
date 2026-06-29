#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DSCBUFFERDESC.ahk" { DSCBUFFERDESC }
#Import ".\IDirectSoundCaptureBuffer.ahk" { IDirectSoundCaptureBuffer }
#Import ".\DSCCAPS.ahk" { DSCCAPS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundCapture extends IUnknown {
    /**
     * The interface identifier for IDirectSoundCapture
     * @type {Guid}
     */
    static IID := Guid("{b0210781-89cd-11d0-af08-00a0c925cd16}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundCapture interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateCaptureBuffer : IntPtr
        GetCaps             : IntPtr
        Initialize          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundCapture.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DSCBUFFERDESC>} pcDSCBufferDesc 
     * @param {IUnknown} pUnkOuter 
     * @returns {IDirectSoundCaptureBuffer} 
     */
    CreateCaptureBuffer(pcDSCBufferDesc, pUnkOuter) {
        result := ComCall(3, this, DSCBUFFERDESC.Ptr, pcDSCBufferDesc, "ptr*", &ppDSCBuffer := 0, "ptr", pUnkOuter, "HRESULT")
        return IDirectSoundCaptureBuffer(ppDSCBuffer)
    }

    /**
     * 
     * @returns {DSCCAPS} 
     */
    GetCaps() {
        pDSCCaps := DSCCAPS()
        result := ComCall(4, this, DSCCAPS.Ptr, pDSCCaps, "HRESULT")
        return pDSCCaps
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
        result := ComCall(5, this, Guid.Ptr, pcGuidDevice, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectSoundCapture.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateCaptureBuffer := CallbackCreate(GetMethod(implObj, "CreateCaptureBuffer"), flags, 4)
        this.vtbl.GetCaps := CallbackCreate(GetMethod(implObj, "GetCaps"), flags, 2)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateCaptureBuffer)
        CallbackFree(this.vtbl.GetCaps)
        CallbackFree(this.vtbl.Initialize)
    }
}
