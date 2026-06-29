#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * The IDirectWriterLock interface enables a single writer to obtain exclusive write access to a root storage object opened in direct mode while allowing concurrent access by multiple readers.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-idirectwriterlock
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct IDirectWriterLock extends IUnknown {
    /**
     * The interface identifier for IDirectWriterLock
     * @type {Guid}
     */
    static IID := Guid("{0e6d4d92-6738-11cf-9608-00aa00680db4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectWriterLock interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        WaitForWriteAccess : IntPtr
        ReleaseWriteAccess : IntPtr
        HaveWriteAccess    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectWriterLock.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The WaitForWriteAccess method obtains exclusive write access to a storage object.
     * @remarks
     * When a storage is opened in direct mode (STGM_DIRECT) with the STGM_READWRITE|STGM_SHARE_DENY_WRITE, you can call this method to obtain exclusive write access to the storage.
     * 
     * This method returns immediately if no readers have the storage open. If the storage is still open for reading, this method blocks for the specified <i>dwTimeout</i> or until the current readers close the storage.
     * @param {Integer} dwTimeout Specifies the time in milliseconds that this method blocks while waiting to obtain exclusive write access to the storage object. If <i>dwTimeout</i> is zero, the method does not block waiting for exclusive access for writing. The INFINITE time-out defined in the Platform SDK is allowed for <i>dwTimeout</i>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The caller has successfully obtained exclusive write access to the storage.|
     * |S_FALSE | This method was called again without an intervening call to IDirectWriterLock::ReleaseWriteAccess.|
     * |STG_E_INUSE | The specified time-out expired without obtaining exclusive write access.|
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idirectwriterlock-waitforwriteaccess
     */
    WaitForWriteAccess(dwTimeout) {
        result := ComCall(3, this, "uint", dwTimeout, "HRESULT")
        return result
    }

    /**
     * The ReleaseWriteAccess method releases the write lock previously obtained.
     * @remarks
     * The writer calls this method to release exclusive access to the storage object previously taken by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idirectwriterlock-waitforwriteaccess">IDirectWriterLock::WaitForWriteAccess</a>.
     * 
     * After the writer calls this method, it is safe to allow readers to reopen the storage again until the next call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idirectwriterlock-waitforwriteaccess">IDirectWriterLock::WaitForWriteAccess</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The write lock was successfully released.|
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idirectwriterlock-releasewriteaccess
     */
    ReleaseWriteAccess() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The HaveWriteAccess method indicates whether the write lock has been taken.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The storage object is currently locked for write access.|
     * |S_FALSE | The storage object is not currently locked for write access.|
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idirectwriterlock-havewriteaccess
     */
    HaveWriteAccess() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectWriterLock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WaitForWriteAccess := CallbackCreate(GetMethod(implObj, "WaitForWriteAccess"), flags, 2)
        this.vtbl.ReleaseWriteAccess := CallbackCreate(GetMethod(implObj, "ReleaseWriteAccess"), flags, 1)
        this.vtbl.HaveWriteAccess := CallbackCreate(GetMethod(implObj, "HaveWriteAccess"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WaitForWriteAccess)
        CallbackFree(this.vtbl.ReleaseWriteAccess)
        CallbackFree(this.vtbl.HaveWriteAccess)
    }
}
