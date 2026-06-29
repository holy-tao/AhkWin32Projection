#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOfflineFilesItem.ahk" { IOfflineFilesItem }

/**
 * Represents a share item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesshareitem
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesShareItem extends IOfflineFilesItem {
    /**
     * The interface identifier for IOfflineFilesShareItem
     * @type {Guid}
     */
    static IID := Guid("{bab7e48d-4804-41b5-a44d-0f199b06b145}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesShareItem interfaces
    */
    struct Vtbl extends IOfflineFilesItem.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesShareItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IOfflineFilesShareItem.IID.Equals(iid)) {
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
