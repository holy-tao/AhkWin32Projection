#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the pinned status of an item in the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilespininfo
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
     * 
     * @param {Pointer<BOOL>} pbPinned 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo-ispinned
     */
    IsPinned(pbPinned) {
        result := ComCall(3, this, "ptr", pbPinned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbPinnedForUser 
     * @param {Pointer<BOOL>} pbInherit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo-ispinnedforuser
     */
    IsPinnedForUser(pbPinnedForUser, pbInherit) {
        result := ComCall(4, this, "ptr", pbPinnedForUser, "ptr", pbInherit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbPinnedForUser 
     * @param {Pointer<BOOL>} pbInherit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo-ispinnedforuserbypolicy
     */
    IsPinnedForUserByPolicy(pbPinnedForUser, pbInherit) {
        result := ComCall(5, this, "ptr", pbPinnedForUser, "ptr", pbInherit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbPinnedForComputer 
     * @param {Pointer<BOOL>} pbInherit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo-ispinnedforcomputer
     */
    IsPinnedForComputer(pbPinnedForComputer, pbInherit) {
        result := ComCall(6, this, "ptr", pbPinnedForComputer, "ptr", pbInherit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbPinnedForFolderRedirection 
     * @param {Pointer<BOOL>} pbInherit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilespininfo-ispinnedforfolderredirection
     */
    IsPinnedForFolderRedirection(pbPinnedForFolderRedirection, pbInherit) {
        result := ComCall(7, this, "ptr", pbPinnedForFolderRedirection, "ptr", pbInherit, "HRESULT")
        return result
    }
}
