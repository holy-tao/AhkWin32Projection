#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HANDLE_SHARING_OPTIONS.ahk" { HANDLE_SHARING_OPTIONS }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HANDLE_ACCESS_OPTIONS.ahk" { HANDLE_ACCESS_OPTIONS }
#Import ".\HANDLE_CREATION_OPTIONS.ahk" { HANDLE_CREATION_OPTIONS }
#Import ".\IOplockBreakingHandler.ahk" { IOplockBreakingHandler }
#Import ".\HANDLE_OPTIONS.ahk" { HANDLE_OPTIONS }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the operating system handle of a storage folder.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nn-windowsstoragecom-istoragefolderhandleaccess
 * @namespace Windows.Win32.System.WinRT.Storage
 */
export default struct IStorageFolderHandleAccess extends IUnknown {
    /**
     * The interface identifier for IStorageFolderHandleAccess
     * @type {Guid}
     */
    static IID := Guid("{df19938f-5462-48a0-be65-d2a3271a08d6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStorageFolderHandleAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStorageFolderHandleAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a handle to a file that is in a storage folder.
     * @param {PWSTR} fileName The name of the file that you want to get a handle to.
     * @param {HANDLE_CREATION_OPTIONS} creationOptions The action to take on a file that exists or doesn't exist.
     * @param {HANDLE_ACCESS_OPTIONS} accessOptions The level of access that a handle has on the file.
     * @param {HANDLE_SHARING_OPTIONS} sharingOptions The requested sharing mode of the handle.
     * @param {HANDLE_OPTIONS} options The flags of the file handle.
     * @param {IOplockBreakingHandler} oplockBreakingHandler Not currently implemented.
     * @returns {HANDLE} The handle to the file.
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-istoragefolderhandleaccess-create
     */
    Create(fileName, creationOptions, accessOptions, sharingOptions, options, oplockBreakingHandler) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        interopHandle := HANDLE.Owned()
        result := ComCall(3, this, "ptr", fileName, HANDLE_CREATION_OPTIONS, creationOptions, HANDLE_ACCESS_OPTIONS, accessOptions, HANDLE_SHARING_OPTIONS, sharingOptions, HANDLE_OPTIONS, options, "ptr", oplockBreakingHandler, HANDLE.Ptr, interopHandle, "HRESULT")
        return interopHandle
    }

    Query(iid) {
        if (IStorageFolderHandleAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
    }
}
