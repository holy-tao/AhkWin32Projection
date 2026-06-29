#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUnbufferedFileHandleOplockCallback.ahk" { IUnbufferedFileHandleOplockCallback }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to handles from a random-access byte stream that the StorageFile.OpenAsync method created.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nn-windowsstoragecom-iunbufferedfilehandleprovider
 * @namespace Windows.Win32.System.WinRT.Storage
 */
export default struct IUnbufferedFileHandleProvider extends IUnknown {
    /**
     * The interface identifier for IUnbufferedFileHandleProvider
     * @type {Guid}
     */
    static IID := Guid("{a65c9109-42ab-4b94-a7b1-dd2e4e68515e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUnbufferedFileHandleProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OpenUnbufferedFileHandle  : IntPtr
        CloseUnbufferedFileHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUnbufferedFileHandleProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a handle from a random-access byte stream that the StorageFile.OpenAsync method created and registers a callback method that you want to run when the opportunistic lock for the handle is broken.
     * @remarks
     * <b>IUnbufferedFileHandleProvider::OpenUnbufferedFileHandle</b> opens a new handle that is open for GENERIC_READ. <b>IUnbufferedFileHandleProvider::OpenUnbufferedFileHandle</b> does not return the actual handle underlying the stream, or a duplicate of that handle.
     * 
     *  Call <a href="https://docs.microsoft.com/windows/desktop/api/windowsstoragecom/nf-windowsstoragecom-iunbufferedfilehandleprovider-closeunbufferedfilehandle">IUnbufferedFileHandleProvider::CloseUnbufferedFileHandle</a> when you no longer need the handle. The handle is also closed when the opportunistic lock breaks, so your code must process exceptions that occur when the handle is not valid.
     * @param {IUnbufferedFileHandleOplockCallback} oplockBreakCallback An interface that contains the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/windowsstoragecom/nf-windowsstoragecom-iunbufferedfilehandleoplockcallback-onbrokencallback">IUnbufferedFileHandleOplockCallback::OnBrokenCallback</a> method that you want to run when the opportunistic lock for the handle is broken.
     * @returns {Pointer} The handle from the random-access byte stream.
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-iunbufferedfilehandleprovider-openunbufferedfilehandle
     */
    OpenUnbufferedFileHandle(oplockBreakCallback) {
        result := ComCall(3, this, "ptr", oplockBreakCallback, "ptr*", &fileHandle := 0, "HRESULT")
        return fileHandle
    }

    /**
     * Closes the handle from a random-access byte stream that you created by calling IUnbufferedFileHandleProvider::OpenUnbufferedFileHandle.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-iunbufferedfilehandleprovider-closeunbufferedfilehandle
     */
    CloseUnbufferedFileHandle() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUnbufferedFileHandleProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenUnbufferedFileHandle := CallbackCreate(GetMethod(implObj, "OpenUnbufferedFileHandle"), flags, 3)
        this.vtbl.CloseUnbufferedFileHandle := CallbackCreate(GetMethod(implObj, "CloseUnbufferedFileHandle"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenUnbufferedFileHandle)
        CallbackFree(this.vtbl.CloseUnbufferedFileHandle)
    }
}
