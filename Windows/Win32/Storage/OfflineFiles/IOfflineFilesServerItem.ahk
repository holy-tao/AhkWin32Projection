#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOfflineFilesItem.ahk" { IOfflineFilesItem }

/**
 * Represents a server item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesserveritem
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesServerItem extends IOfflineFilesItem {
    /**
     * The interface identifier for IOfflineFilesServerItem
     * @type {Guid}
     */
    static IID := Guid("{9b1c9576-a92b-4151-8e9e-7c7b3ec2e016}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesServerItem interfaces
    */
    struct Vtbl extends IOfflineFilesItem.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesServerItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IOfflineFilesServerItem.IID.Equals(iid)) {
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
