#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOfflineFilesItem.ahk" { IOfflineFilesItem }

/**
 * Represents a directory item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesdirectoryitem
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesDirectoryItem extends IOfflineFilesItem {
    /**
     * The interface identifier for IOfflineFilesDirectoryItem
     * @type {Guid}
     */
    static IID := Guid("{2273597a-a08c-4a00-a37a-c1ae4e9a1cfd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesDirectoryItem interfaces
    */
    struct Vtbl extends IOfflineFilesItem.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesDirectoryItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IOfflineFilesDirectoryItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
