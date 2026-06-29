#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows a media source to create a Windows Runtime object in the Protected Media Path (PMP) process.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfpmphostapp
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFPMPHostApp extends IUnknown {
    /**
     * The interface identifier for IMFPMPHostApp
     * @type {Guid}
     */
    static IID := Guid("{84d2054a-3aa1-4728-a3b0-440a418cf49c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFPMPHostApp interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LockProcess       : IntPtr
        UnlockProcess     : IntPtr
        ActivateClassById : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFPMPHostApp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Blocks the protected media path (PMP) process from ending. (IMFPMPHostApp.LockProcess)
     * @remarks
     * When this method is called, it increments the lock count on the PMP process. For every call to this method, the application should make a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpmphostapp-unlockprocess">IMFPMPHostApp::UnlockProcess</a>, which decrements the lock count. When the PMP process is ready to exit, it waits for about 3 seconds, or until the lock count reaches zero, before exiting.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphostapp-lockprocess
     */
    LockProcess() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Decrements the lock count on the protected media path (PMP) process. Call this method once for each call to IMFPMPHostApp::LockProcess.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphostapp-unlockprocess
     */
    UnlockProcess() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Creates a Windows Runtime object in the protected media path (PMP) process.
     * @param {PWSTR} id Id of object to create.
     * @param {IStream} pStream Data to be passed to the object by way of a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface to retrieve.
     * @returns {Pointer<Void>} Receives a pointer to the created object.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphostapp-activateclassbyid
     */
    ActivateClassById(id, pStream, riid) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(5, this, "ptr", id, "ptr", pStream, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IMFPMPHostApp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LockProcess := CallbackCreate(GetMethod(implObj, "LockProcess"), flags, 1)
        this.vtbl.UnlockProcess := CallbackCreate(GetMethod(implObj, "UnlockProcess"), flags, 1)
        this.vtbl.ActivateClassById := CallbackCreate(GetMethod(implObj, "ActivateClassById"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LockProcess)
        CallbackFree(this.vtbl.UnlockProcess)
        CallbackFree(this.vtbl.ActivateClassById)
    }
}
