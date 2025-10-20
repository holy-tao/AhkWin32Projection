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
     * 
     * @param {Pointer<BOOL>} pbPinned 
     * @returns {HRESULT} 
     */
    IsPinned(pbPinned) {
        result := ComCall(3, this, "ptr", pbPinned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbPinnedForUser 
     * @param {Pointer<BOOL>} pbInherit 
     * @returns {HRESULT} 
     */
    IsPinnedForUser(pbPinnedForUser, pbInherit) {
        result := ComCall(4, this, "ptr", pbPinnedForUser, "ptr", pbInherit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbPinnedForUser 
     * @param {Pointer<BOOL>} pbInherit 
     * @returns {HRESULT} 
     */
    IsPinnedForUserByPolicy(pbPinnedForUser, pbInherit) {
        result := ComCall(5, this, "ptr", pbPinnedForUser, "ptr", pbInherit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbPinnedForComputer 
     * @param {Pointer<BOOL>} pbInherit 
     * @returns {HRESULT} 
     */
    IsPinnedForComputer(pbPinnedForComputer, pbInherit) {
        result := ComCall(6, this, "ptr", pbPinnedForComputer, "ptr", pbInherit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbPinnedForFolderRedirection 
     * @param {Pointer<BOOL>} pbInherit 
     * @returns {HRESULT} 
     */
    IsPinnedForFolderRedirection(pbPinnedForFolderRedirection, pbInherit) {
        result := ComCall(7, this, "ptr", pbPinnedForFolderRedirection, "ptr", pbInherit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
