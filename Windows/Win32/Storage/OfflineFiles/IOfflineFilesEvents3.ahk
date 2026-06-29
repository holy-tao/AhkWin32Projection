#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\OFFLINEFILES_EVENTS.ahk" { OFFLINEFILES_EVENTS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOfflineFilesEvents2.ahk" { IOfflineFilesEvents2 }
#Import ".\OFFLINEFILES_ITEM_TYPE.ahk" { OFFLINEFILES_ITEM_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Used to report events associated with transparently cached items.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesevents3
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesEvents3 extends IOfflineFilesEvents2 {
    /**
     * The interface identifier for IOfflineFilesEvents3
     * @type {Guid}
     */
    static IID := Guid("{9ba04a45-ee69-42f0-9ab1-7db5c8805808}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesEvents3 interfaces
    */
    struct Vtbl extends IOfflineFilesEvents2.Vtbl {
        TransparentCacheItemNotify : IntPtr
        PrefetchFileBegin          : IntPtr
        PrefetchFileEnd            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesEvents3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reports that an action has been performed on a transparently cached item.
     * @param {PWSTR} pszPath The item's UNC path string.
     * @param {OFFLINEFILES_EVENTS} EventType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_events">OFFLINEFILES_EVENTS</a> enumeration value that indicates the type of the item.
     * @param {OFFLINEFILES_ITEM_TYPE} ItemType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @param {BOOL} bModifiedData <b>TRUE</b> if the item's data was modified, <b>FALSE</b> otherwise.
     * @param {BOOL} bModifiedAttributes <b>TRUE</b> if one or more of the item's attributes were modified, <b>FALSE</b> otherwise.
     * @param {PWSTR} pzsOldPath The original UNC path string for the item.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents3-transparentcacheitemnotify
     */
    TransparentCacheItemNotify(pszPath, EventType, ItemType, bModifiedData, bModifiedAttributes, pzsOldPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pzsOldPath := pzsOldPath is String ? StrPtr(pzsOldPath) : pzsOldPath

        result := ComCall(37, this, "ptr", pszPath, OFFLINEFILES_EVENTS, EventType, OFFLINEFILES_ITEM_TYPE, ItemType, BOOL, bModifiedData, BOOL, bModifiedAttributes, "ptr", pzsOldPath, "HRESULT")
        return result
    }

    /**
     * Reports that a file prefetch operation has begun.
     * @param {PWSTR} pszPath The UNC path of the file.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents3-prefetchfilebegin
     */
    PrefetchFileBegin(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(38, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * Reports that a file prefetch operation has ended.
     * @param {PWSTR} pszPath The UNC path of the file.
     * @param {HRESULT} hrResult Receives the result of the operation. Contains <b>S_OK</b> if the operation completed successfully or an error value otherwise.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents3-prefetchfileend
     */
    PrefetchFileEnd(pszPath, hrResult) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(39, this, "ptr", pszPath, "int", hrResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOfflineFilesEvents3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TransparentCacheItemNotify := CallbackCreate(GetMethod(implObj, "TransparentCacheItemNotify"), flags, 7)
        this.vtbl.PrefetchFileBegin := CallbackCreate(GetMethod(implObj, "PrefetchFileBegin"), flags, 2)
        this.vtbl.PrefetchFileEnd := CallbackCreate(GetMethod(implObj, "PrefetchFileEnd"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TransparentCacheItemNotify)
        CallbackFree(this.vtbl.PrefetchFileBegin)
        CallbackFree(this.vtbl.PrefetchFileEnd)
    }
}
