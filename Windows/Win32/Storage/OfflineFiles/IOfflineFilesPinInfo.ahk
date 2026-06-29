#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the pinned status of an item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilespininfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesPinInfo extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesPinInfo
     * @type {Guid}
     */
    static IID := Guid("{5b2b0655-b3fd-497d-adeb-bd156bc8355b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesPinInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsPinned                     : IntPtr
        IsPinnedForUser              : IntPtr
        IsPinnedForUserByPolicy      : IntPtr
        IsPinnedForComputer          : IntPtr
        IsPinnedForFolderRedirection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesPinInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the item is pinned.
     * @remarks
     * When an item is pinned in the Offline Files cache, it is protected from automatic eviction and is guaranteed to be available offline.
     * @returns {BOOL} Receives <b>TRUE</b> if the item is pinned for any reason, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo-ispinned
     */
    IsPinned() {
        result := ComCall(3, this, BOOL.Ptr, &pbPinned := 0, "HRESULT")
        return pbPinned
    }

    /**
     * Determines whether the item was pinned by a user.
     * @remarks
     * When an item is pinned in the Offline Files cache, it is protected from automatic eviction and is guaranteed to be available offline.
     * 
     * This method corresponds to the OFFLINEFILES_PIN_CONTROL_FLAG_FORUSER pin control flag used by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-pin">IOfflineFilesCache::Pin</a> method.
     * @param {Pointer<BOOL>} pbPinnedForUser Receives  <b>TRUE</b> if the item was pinned by a user, or <b>FALSE</b> otherwise.
     * @param {Pointer<BOOL>} pbInherit Receives <b>TRUE</b> if the pinned state is inherited by new child items, or <b>FALSE</b> otherwise.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo-ispinnedforuser
     */
    IsPinnedForUser(pbPinnedForUser, pbInherit) {
        pbPinnedForUserMarshal := pbPinnedForUser is VarRef ? "int*" : "ptr"
        pbInheritMarshal := pbInherit is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pbPinnedForUserMarshal, pbPinnedForUser, pbInheritMarshal, pbInherit, "HRESULT")
        return result
    }

    /**
     * Determines whether the item was pinned for users by Group Policy.
     * @remarks
     * When an item is pinned in the Offline Files cache, it is protected from automatic eviction and is guaranteed to be available offline.
     * 
     * This method corresponds to the OFFLINEFILES_PIN_CONTROL_FLAG_FORUSER_POLICY pin control flag used by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-pin">IOfflineFilesCache::Pin</a> method.
     * @param {Pointer<BOOL>} pbPinnedForUser Receives  <b>TRUE</b> if the item was pinned for users by Group Policy, or <b>FALSE</b> otherwise.
     * @param {Pointer<BOOL>} pbInherit Receives <b>TRUE</b> if the pinned state is inherited by new child items, or <b>FALSE</b> otherwise.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo-ispinnedforuserbypolicy
     */
    IsPinnedForUserByPolicy(pbPinnedForUser, pbInherit) {
        pbPinnedForUserMarshal := pbPinnedForUser is VarRef ? "int*" : "ptr"
        pbInheritMarshal := pbInherit is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pbPinnedForUserMarshal, pbPinnedForUser, pbInheritMarshal, pbInherit, "HRESULT")
        return result
    }

    /**
     * Determines whether the item was pinned for all users on the computer by Group Policy.
     * @remarks
     * When an item is pinned in the Offline Files cache, it is protected from automatic eviction and is guaranteed to be available offline.
     * 
     * This method corresponds to the OFFLINEFILES_PIN_CONTROL_FLAG_FORALL pin control flag used by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-pin">IOfflineFilesCache::Pin</a> method.
     * @param {Pointer<BOOL>} pbPinnedForComputer Receives  <b>TRUE</b> if the item was pinned for users by Group Policy, or <b>FALSE</b> otherwise.
     * @param {Pointer<BOOL>} pbInherit Receives <b>TRUE</b> if the pinned state is inherited by new child items, or <b>FALSE</b> otherwise.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo-ispinnedforcomputer
     */
    IsPinnedForComputer(pbPinnedForComputer, pbInherit) {
        pbPinnedForComputerMarshal := pbPinnedForComputer is VarRef ? "int*" : "ptr"
        pbInheritMarshal := pbInherit is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pbPinnedForComputerMarshal, pbPinnedForComputer, pbInheritMarshal, pbInherit, "HRESULT")
        return result
    }

    /**
     * Determines whether the item was pinned by Folder Redirection.
     * @remarks
     * When an item is pinned in the Offline Files cache, it is protected from automatic eviction and is guaranteed to be available offline.
     * 
     * This method corresponds to the OFFLINEFILES_PIN_CONTROL_FLAG_FORREDIR pin control flag used by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-pin">IOfflineFilesCache::Pin</a> method.
     * @param {Pointer<BOOL>} pbPinnedForFolderRedirection Receives  <b>TRUE</b> if the item was pinned for users by Folder Redirection, or <b>FALSE</b> otherwise.
     * @param {Pointer<BOOL>} pbInherit Receives <b>TRUE</b> if the pinned state is inherited by new child items, or <b>FALSE</b> otherwise.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo-ispinnedforfolderredirection
     */
    IsPinnedForFolderRedirection(pbPinnedForFolderRedirection, pbInherit) {
        pbPinnedForFolderRedirectionMarshal := pbPinnedForFolderRedirection is VarRef ? "int*" : "ptr"
        pbInheritMarshal := pbInherit is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pbPinnedForFolderRedirectionMarshal, pbPinnedForFolderRedirection, pbInheritMarshal, pbInherit, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOfflineFilesPinInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsPinned := CallbackCreate(GetMethod(implObj, "IsPinned"), flags, 2)
        this.vtbl.IsPinnedForUser := CallbackCreate(GetMethod(implObj, "IsPinnedForUser"), flags, 3)
        this.vtbl.IsPinnedForUserByPolicy := CallbackCreate(GetMethod(implObj, "IsPinnedForUserByPolicy"), flags, 3)
        this.vtbl.IsPinnedForComputer := CallbackCreate(GetMethod(implObj, "IsPinnedForComputer"), flags, 3)
        this.vtbl.IsPinnedForFolderRedirection := CallbackCreate(GetMethod(implObj, "IsPinnedForFolderRedirection"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsPinned)
        CallbackFree(this.vtbl.IsPinnedForUser)
        CallbackFree(this.vtbl.IsPinnedForUserByPolicy)
        CallbackFree(this.vtbl.IsPinnedForComputer)
        CallbackFree(this.vtbl.IsPinnedForFolderRedirection)
    }
}
