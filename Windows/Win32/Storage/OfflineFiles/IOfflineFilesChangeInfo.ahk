#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the information associated with local changes made to an item while working offline.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefileschangeinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesChangeInfo extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesChangeInfo
     * @type {Guid}
     */
    static IID := Guid("{a96e6fa4-e0d1-4c29-960b-ee508fe68c72}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesChangeInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsDirty                     : IntPtr
        IsDeletedOffline            : IntPtr
        IsCreatedOffline            : IntPtr
        IsLocallyModifiedData       : IntPtr
        IsLocallyModifiedAttributes : IntPtr
        IsLocallyModifiedTime       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesChangeInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether an item in the Offline Files cache has been modified.
     * @remarks
     * When an item is modified offline, it is marked as "dirty." Such items must be synchronized to clear this "dirty" property on the item.  The Offline Files service automatically synchronizes items when an offline scope transitions to online.
     * @returns {BOOL} Receives <b>TRUE</b> if the item has been modified in some way while working offline, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-isdirty
     */
    IsDirty() {
        result := ComCall(3, this, BOOL.Ptr, &pbDirty := 0, Int32)
        return pbDirty
    }

    /**
     * Determines whether an item has been deleted from the Offline Files cache while working offline.
     * @returns {BOOL} Receives <b>TRUE</b> if the item has been deleted from the Offline Files cache while working offline, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-isdeletedoffline
     */
    IsDeletedOffline() {
        result := ComCall(4, this, BOOL.Ptr, &pbDeletedOffline := 0, "HRESULT")
        return pbDeletedOffline
    }

    /**
     * Determines whether an item was created in the Offline Files cache while working offline.
     * @returns {BOOL} Receives <b>TRUE</b> if the item was created in the Offline Files cache while working offline, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-iscreatedoffline
     */
    IsCreatedOffline() {
        result := ComCall(5, this, BOOL.Ptr, &pbCreatedOffline := 0, "HRESULT")
        return pbCreatedOffline
    }

    /**
     * Determines whether an item's data was modified while working offline.
     * @returns {BOOL} Receives <b>TRUE</b> if the item's data was modified in the Offline Files cache while working offline, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifieddata
     */
    IsLocallyModifiedData() {
        result := ComCall(6, this, BOOL.Ptr, &pbLocallyModifiedData := 0, "HRESULT")
        return pbLocallyModifiedData
    }

    /**
     * Determines whether one or more of an item's attributes were modified while working offline.
     * @remarks
     * Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesfilesysinfo-getattributes">IOfflineFilesFileSysInfo::GetAttributes</a> to examine the Win32 file attributes for an item.
     * @returns {BOOL} Receives <b>TRUE</b> if one or more of the item's attributes were modified in the Offline Files cache while working offline, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifiedattributes
     */
    IsLocallyModifiedAttributes() {
        result := ComCall(7, this, BOOL.Ptr, &pbLocallyModifiedAttributes := 0, "HRESULT")
        return pbLocallyModifiedAttributes
    }

    /**
     * Determines whether one or more of an item's time values were modified while working offline.
     * @remarks
     * Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesfilesysinfo-gettimes">IOfflineFilesFileSysInfo::GetTimes</a> to examine the time values associated with an item.
     * @returns {BOOL} Receives <b>TRUE</b> if one or more of the item's time values were modified in the Offline Files cache while working offline, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifiedtime
     */
    IsLocallyModifiedTime() {
        result := ComCall(8, this, BOOL.Ptr, &pbLocallyModifiedTime := 0, "HRESULT")
        return pbLocallyModifiedTime
    }

    Query(iid) {
        if (IOfflineFilesChangeInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsDirty := CallbackCreate(GetMethod(implObj, "IsDirty"), flags, 2)
        this.vtbl.IsDeletedOffline := CallbackCreate(GetMethod(implObj, "IsDeletedOffline"), flags, 2)
        this.vtbl.IsCreatedOffline := CallbackCreate(GetMethod(implObj, "IsCreatedOffline"), flags, 2)
        this.vtbl.IsLocallyModifiedData := CallbackCreate(GetMethod(implObj, "IsLocallyModifiedData"), flags, 2)
        this.vtbl.IsLocallyModifiedAttributes := CallbackCreate(GetMethod(implObj, "IsLocallyModifiedAttributes"), flags, 2)
        this.vtbl.IsLocallyModifiedTime := CallbackCreate(GetMethod(implObj, "IsLocallyModifiedTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsDirty)
        CallbackFree(this.vtbl.IsDeletedOffline)
        CallbackFree(this.vtbl.IsCreatedOffline)
        CallbackFree(this.vtbl.IsLocallyModifiedData)
        CallbackFree(this.vtbl.IsLocallyModifiedAttributes)
        CallbackFree(this.vtbl.IsLocallyModifiedTime)
    }
}
