#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOfflineFilesShareItem.ahk" { IOfflineFilesShareItem }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\OFFLINEFILES_CACHING_MODE.ahk" { OFFLINEFILES_CACHING_MODE }

/**
 * Presents share-specific information about cached items.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesshareinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesShareInfo extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesShareInfo
     * @type {Guid}
     */
    static IID := Guid("{7bcc43e7-31ce-4ca4-8ccd-1cff2dc494da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesShareInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetShareItem        : IntPtr
        GetShareCachingMode : IntPtr
        IsShareDfsJunction  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesShareInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Finds the cache item representing the closest ancestor share to the item.
     * @returns {IOfflineFilesShareItem} Receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesshareitem">IOfflineFilesShareItem</a> interface on the share item.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesshareinfo-getshareitem
     */
    GetShareItem() {
        result := ComCall(3, this, "ptr*", &ppShareItem := 0, "HRESULT")
        return IOfflineFilesShareItem(ppShareItem)
    }

    /**
     * Retrieves the caching mode configuration of the closest ancestor share to the item.
     * @remarks
     * This method is equivalent to locating the nearest share item, obtaining its fully qualified UNC path and calling <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharegetinfo">NetShareGetInfo</a> for <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/ns-lmshare-share_info_1005">SHARE_INFO_1005</a> information.
     * @returns {OFFLINEFILES_CACHING_MODE} Receives a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_caching_mode">OFFLINEFILES_CACHING_MODE</a> enumeration that indicates the caching mode.
     * 
     * The following values can be returned:
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesshareinfo-getsharecachingmode
     */
    GetShareCachingMode() {
        result := ComCall(4, this, "int*", &pCachingMode := 0, "HRESULT")
        return pCachingMode
    }

    /**
     * Determines whether the share item is a DFS junction or a shared folder on a server.
     * @returns {BOOL} Receives <b>TRUE</b> if the item is a DFS junction, or <b>FALSE</b> if the share is a shared folder (\\server\share) on a server.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesshareinfo-issharedfsjunction
     */
    IsShareDfsJunction() {
        result := ComCall(5, this, BOOL.Ptr, &pbIsDfsJunction := 0, "HRESULT")
        return pbIsDfsJunction
    }

    Query(iid) {
        if (IOfflineFilesShareInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetShareItem := CallbackCreate(GetMethod(implObj, "GetShareItem"), flags, 2)
        this.vtbl.GetShareCachingMode := CallbackCreate(GetMethod(implObj, "GetShareCachingMode"), flags, 2)
        this.vtbl.IsShareDfsJunction := CallbackCreate(GetMethod(implObj, "IsShareDfsJunction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetShareItem)
        CallbackFree(this.vtbl.GetShareCachingMode)
        CallbackFree(this.vtbl.IsShareDfsJunction)
    }
}
