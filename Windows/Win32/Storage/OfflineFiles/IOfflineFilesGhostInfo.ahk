#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the ghosting status of an item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesghostinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesGhostInfo extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesGhostInfo
     * @type {Guid}
     */
    static IID := Guid("{2b09d48c-8ab5-464f-a755-a59d92f99429}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesGhostInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsGhosted : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesGhostInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the item is ghosted.
     * @remarks
     * An item is said to be ghosted in the offline files cache if, when the item is offline, its name is visible to the user, but its contents are not accessible. A file or directory can be in this state for one of the following reasons:
     * 
     * <ul>
     * <li>The item is pinned, which means that there is an entry for it in the cache.  However, either the content has not yet been synchronized to the client, or it was removed from the client (due to loss of oplock or detection of stale data) when the client transitioned offline.</li>
     * <li>The item has a sibling file or directory that is the root of a pinned namespace in the cache. When an item is pinned, its sibling items are ghosted so that the user can still see where the pinned item and its siblings are located in the online namespace even if the sibling items are not available offline.</li>
     * </ul>
     * @returns {BOOL} Receives <b>TRUE</b> if the item is ghosted, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesghostinfo-isghosted
     */
    IsGhosted() {
        result := ComCall(3, this, BOOL.Ptr, &pbGhosted := 0, "HRESULT")
        return pbGhosted
    }

    Query(iid) {
        if (IOfflineFilesGhostInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsGhosted := CallbackCreate(GetMethod(implObj, "IsGhosted"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsGhosted)
    }
}
