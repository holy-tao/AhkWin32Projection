#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOfflineFilesPinInfo.ahk" { IOfflineFilesPinInfo }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Defines a method to determine whether an item in the Offline Files cache is partly pinned.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilespininfo2
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesPinInfo2 extends IOfflineFilesPinInfo {
    /**
     * The interface identifier for IOfflineFilesPinInfo2
     * @type {Guid}
     */
    static IID := Guid("{623c58a2-42ed-4ad7-b69a-0f1b30a72d0d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesPinInfo2 interfaces
    */
    struct Vtbl extends IOfflineFilesPinInfo.Vtbl {
        IsPartlyPinned : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesPinInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the item is partly pinned.
     * @remarks
     * Only container items, such as directories and shares, can be partly pinned. An item is partly pinned if the item itself is not pinned, but it contains pinned items. The item could contain autocached or transparently cached items in addition to the pinned items.
     * @returns {BOOL} Receives <b>TRUE</b> if the item has some child content that is pinned in the Offline Files cache, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo2-ispartlypinned
     */
    IsPartlyPinned() {
        result := ComCall(8, this, BOOL.Ptr, &pbPartlyPinned := 0, "HRESULT")
        return pbPartlyPinned
    }

    Query(iid) {
        if (IOfflineFilesPinInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsPartlyPinned := CallbackCreate(GetMethod(implObj, "IsPartlyPinned"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsPartlyPinned)
    }
}
