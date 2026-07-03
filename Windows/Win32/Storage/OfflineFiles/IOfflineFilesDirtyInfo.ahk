#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents information about an unsynchronized (&quot;dirty&quot;) file in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesdirtyinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesDirtyInfo extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesDirtyInfo
     * @type {Guid}
     */
    static IID := Guid("{0f50ce33-bac9-4eaa-a11d-da0e527d047d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesDirtyInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LocalDirtyByteCount  : IntPtr
        RemoteDirtyByteCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesDirtyInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the amount of unsynchronized (&quot;dirty&quot;) data for the associated file in the local Offline Files cache.
     * @remarks
     * This method can be called only for file items, which are represented by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesfileitem">IOfflineFilesFileItem</a> objects.
     * @returns {Integer} The number of bytes of unsynchronized data.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesdirtyinfo-localdirtybytecount
     */
    LocalDirtyByteCount() {
        result := ComCall(3, this, "int64*", &pDirtyByteCount := 0, "HRESULT")
        return pDirtyByteCount
    }

    /**
     * This method is reserved for future use. (IOfflineFilesDirtyInfo.RemoteDirtyByteCount)
     * @remarks
     * This method can only be called for file items, which are represented by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesfileitem">IOfflineFilesFileItem</a> objects.
     * @returns {Integer} The number of bytes of unsynchronized data.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesdirtyinfo-remotedirtybytecount
     */
    RemoteDirtyByteCount() {
        result := ComCall(4, this, "int64*", &pDirtyByteCount := 0, "HRESULT")
        return pDirtyByteCount
    }

    Query(iid) {
        if (IOfflineFilesDirtyInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LocalDirtyByteCount := CallbackCreate(GetMethod(implObj, "LocalDirtyByteCount"), flags, 2)
        this.vtbl.RemoteDirtyByteCount := CallbackCreate(GetMethod(implObj, "RemoteDirtyByteCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LocalDirtyByteCount)
        CallbackFree(this.vtbl.RemoteDirtyByteCount)
    }
}
