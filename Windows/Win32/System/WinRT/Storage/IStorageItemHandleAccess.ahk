#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HANDLE_SHARING_OPTIONS.ahk" { HANDLE_SHARING_OPTIONS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HANDLE_ACCESS_OPTIONS.ahk" { HANDLE_ACCESS_OPTIONS }
#Import ".\IOplockBreakingHandler.ahk" { IOplockBreakingHandler }
#Import ".\HANDLE_OPTIONS.ahk" { HANDLE_OPTIONS }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the operating system handle of a storage file.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nn-windowsstoragecom-istorageitemhandleaccess
 * @namespace Windows.Win32.System.WinRT.Storage
 */
export default struct IStorageItemHandleAccess extends IUnknown {
    /**
     * The interface identifier for IStorageItemHandleAccess
     * @type {Guid}
     */
    static IID := Guid("{5ca296b2-2c25-4d22-b785-b885c8201e6a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStorageItemHandleAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStorageItemHandleAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a handle to a file.
     * @param {HANDLE_ACCESS_OPTIONS} accessOptions The level of access that a handle has on the file.
     * @param {HANDLE_SHARING_OPTIONS} sharingOptions The requested sharing mode of the handle.
     * @param {HANDLE_OPTIONS} options The flags of the file handle.
     * @param {IOplockBreakingHandler} oplockBreakingHandler Not currently implemented.
     * @returns {HANDLE} The handle to the file.
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-istorageitemhandleaccess-create
     */
    Create(accessOptions, sharingOptions, options, oplockBreakingHandler) {
        interopHandle := HANDLE.Owned()
        result := ComCall(3, this, HANDLE_ACCESS_OPTIONS, accessOptions, HANDLE_SHARING_OPTIONS, sharingOptions, HANDLE_OPTIONS, options, "ptr", oplockBreakingHandler, HANDLE.Ptr, interopHandle, "HRESULT")
        return interopHandle
    }

    Query(iid) {
        if (IStorageItemHandleAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
    }
}
