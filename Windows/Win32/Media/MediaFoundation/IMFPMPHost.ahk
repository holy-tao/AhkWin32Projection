#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables a media source in the application process to create objects in the protected media path (PMP) process.
 * @remarks
 * This interface is used when a media source resides in the application process but the Media Session resides in a PMP process. The media source can use this interface to create objects in the PMP process. For example, to play DRM-protected content, the media source typically must create an input trust authority (ITA) in the PMP process. 
 * 
 * To use this interface, the media source implements the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpmpclient">IMFPMPClient</a> interface. The PMP Media Session calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpmpclient-setpmphost">IMFPMPClient::SetPMPHost</a> on the media source, passing in a pointer to the <b>IMFPMPHost</b> interface.
 * 
 * You can also get a pointer to this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> on the PMP Media Session, using the service identifier <b>MF_PMP_SERVICE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfpmphost
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFPMPHost extends IUnknown {
    /**
     * The interface identifier for IMFPMPHost
     * @type {Guid}
     */
    static IID := Guid("{f70ca1a9-fdc7-4782-b994-adffb1c98606}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFPMPHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LockProcess         : IntPtr
        UnlockProcess       : IntPtr
        CreateObjectByCLSID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFPMPHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Blocks the protected media path (PMP) process from ending. (IMFPMPHost.LockProcess)
     * @remarks
     * When this method is called, it increments the lock count on the PMP process. For every call to this method, the application should make a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpmphost-unlockprocess">IMFPMPHost::UnlockProcess</a>, which decrements the lock count. When the PMP process is ready to exit, it waits for about 3 seconds, or until the lock count reaches zero, before exiting.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphost-lockprocess
     */
    LockProcess() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Decrements the lock count on the protected media path (PMP) process. Call this method once for each call to IMFPMPHost::LockProcess.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphost-unlockprocess
     */
    UnlockProcess() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Creates an object in the protect media path (PMP) process, from a CLSID.
     * @remarks
     * You can use the <i>pStream</i> parameter to initialize the object after it is created.
     * @param {Pointer<Guid>} clsid The CLSID of the object to create.
     * @param {IStream} pStream A pointer to the <b>IStream</b> interface. This parameter can be <b>NULL</b>. If this parameter is not <b>NULL</b>, the PMP host queries the created object for the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a> interface and calls <b>IPersistStream::Load</b>, passing in the <i>pStream</i> pointer.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface to retrieve.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphost-createobjectbyclsid
     */
    CreateObjectByCLSID(clsid, pStream, riid) {
        result := ComCall(5, this, Guid.Ptr, clsid, "ptr", pStream, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IMFPMPHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LockProcess := CallbackCreate(GetMethod(implObj, "LockProcess"), flags, 1)
        this.vtbl.UnlockProcess := CallbackCreate(GetMethod(implObj, "UnlockProcess"), flags, 1)
        this.vtbl.CreateObjectByCLSID := CallbackCreate(GetMethod(implObj, "CreateObjectByCLSID"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LockProcess)
        CallbackFree(this.vtbl.UnlockProcess)
        CallbackFree(this.vtbl.CreateObjectByCLSID)
    }
}
