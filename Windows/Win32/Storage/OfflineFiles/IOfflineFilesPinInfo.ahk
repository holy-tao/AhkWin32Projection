#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the pinned status of an item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilespininfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesPinInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesPinInfo
     * @type {Guid}
     */
    static IID => Guid("{5b2b0655-b3fd-497d-adeb-bd156bc8355b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsPinned", "IsPinnedForUser", "IsPinnedForUserByPolicy", "IsPinnedForComputer", "IsPinnedForFolderRedirection"]

    /**
     * Determines whether the item is pinned.
     * @remarks
     * When an item is pinned in the Offline Files cache, it is protected from automatic eviction and is guaranteed to be available offline.
     * @returns {BOOL} Receives <b>TRUE</b> if the item is pinned for any reason, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo-ispinned
     */
    IsPinned() {
        result := ComCall(3, this, "int*", &pbPinned := 0, "HRESULT")
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
}
