#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DSCBUFFERDESC.ahk" { DSCBUFFERDESC }
#Import ".\IDirectSoundCapture.ahk" { IDirectSoundCapture }
#Import ".\DSCBCAPS.ahk" { DSCBCAPS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundCaptureBuffer extends IUnknown {
    /**
     * The interface identifier for IDirectSoundCaptureBuffer
     * @type {Guid}
     */
    static IID := Guid("{b0210782-89cd-11d0-af08-00a0c925cd16}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundCaptureBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCaps            : IntPtr
        GetCurrentPosition : IntPtr
        GetFormat          : IntPtr
        GetStatus          : IntPtr
        Initialize         : IntPtr
        Lock               : IntPtr
        Start              : IntPtr
        Stop               : IntPtr
        Unlock             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundCaptureBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {DSCBCAPS} 
     */
    GetCaps() {
        pDSCBCaps := DSCBCAPS()
        result := ComCall(3, this, DSCBCAPS.Ptr, pDSCBCaps, "HRESULT")
        return pDSCBCaps
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
     * @param {Integer} pwfxFormat 
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
    GetStatus() {
        result := ComCall(6, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
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
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(pDirectSoundCapture, pcDSCBufferDesc) {
        result := ComCall(7, this, "ptr", pDirectSoundCapture, DSCBUFFERDESC.Ptr, pcDSCBufferDesc, "HRESULT")
        return result
    }

    /**
     * Dismounts the volume and removes the volume's encryption key from system memory.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {Integer} dwOffset 
     * @param {Integer} dwBytes 
     * @param {Pointer<Pointer<Void>>} ppvAudioPtr1 
     * @param {Pointer<Integer>} pdwAudioBytes1 
     * @param {Pointer<Pointer<Void>>} ppvAudioPtr2 
     * @param {Pointer<Integer>} pdwAudioBytes2 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                           | Description                                                                                                                                                               |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                           | The method was successful.<br/>                                                                                                                                     |
     * | <dl> <dt>**E\_ACCESS\_DENIED**</dt> <dt>2147942405 (0x80070005)</dt> </dl>               | Applications are accessing this volume. If all access is nonexclusive, specifying the *ForceDismount* parameter as true allows the method to run successfully.<br/> |
     * | <dl> <dt>**FVE\_E\_NOT\_ENCRYPTED**</dt> <dt>2150694913 (0x80310001)</dt> </dl>          | The volume is fully decrypted and cannot be locked.<br/>                                                                                                            |
     * | <dl> <dt>**FVE\_E\_PROTECTION\_DISABLED**</dt> <dt>2150694945 (0x80310021)</dt> </dl>    | The volume's encryption key is available in the clear on the disk, preventing the volume from being locked.<br/>                                                    |
     * | <dl> <dt>**FVE\_E\_RECOVERY\_KEY\_REQUIRED**</dt> <dt>2150694946 (0x80310022)</dt> </dl> | The volume does not have key protectors of the type "Numerical Password" or "External Key" that are necessary to unlock the volume.<br/>                            |
     * @see https://learn.microsoft.com/windows/win32/SecProv/lock-win32-encryptablevolume
     */
    Lock(dwOffset, dwBytes, ppvAudioPtr1, pdwAudioBytes1, ppvAudioPtr2, pdwAudioBytes2, dwFlags) {
        ppvAudioPtr1Marshal := ppvAudioPtr1 is VarRef ? "ptr*" : "ptr"
        pdwAudioBytes1Marshal := pdwAudioBytes1 is VarRef ? "uint*" : "ptr"
        ppvAudioPtr2Marshal := ppvAudioPtr2 is VarRef ? "ptr*" : "ptr"
        pdwAudioBytes2Marshal := pdwAudioBytes2 is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwOffset, "uint", dwBytes, ppvAudioPtr1Marshal, ppvAudioPtr1, pdwAudioBytes1Marshal, pdwAudioBytes1, ppvAudioPtr2Marshal, ppvAudioPtr2, pdwAudioBytes2Marshal, pdwAudioBytes2, "uint", dwFlags, "HRESULT")
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
     * @param {Integer} pvAudioPtr1 
     * @param {Integer} dwAudioBytes1 
     * @param {Integer} pvAudioPtr2 
     * @param {Integer} dwAudioBytes2 
     * @returns {HRESULT} 
     */
    Unlock(pvAudioPtr1, dwAudioBytes1, pvAudioPtr2, dwAudioBytes2) {
        result := ComCall(11, this, "ptr", pvAudioPtr1, "uint", dwAudioBytes1, "ptr", pvAudioPtr2, "uint", dwAudioBytes2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectSoundCaptureBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCaps := CallbackCreate(GetMethod(implObj, "GetCaps"), flags, 2)
        this.vtbl.GetCurrentPosition := CallbackCreate(GetMethod(implObj, "GetCurrentPosition"), flags, 3)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 4)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.Lock := CallbackCreate(GetMethod(implObj, "Lock"), flags, 8)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 2)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.Unlock := CallbackCreate(GetMethod(implObj, "Unlock"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCaps)
        CallbackFree(this.vtbl.GetCurrentPosition)
        CallbackFree(this.vtbl.GetFormat)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Lock)
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.Unlock)
    }
}
