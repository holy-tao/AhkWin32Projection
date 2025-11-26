#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesShareItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Presents share-specific information about cached items.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesshareinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesShareInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesShareInfo
     * @type {Guid}
     */
    static IID => Guid("{7bcc43e7-31ce-4ca4-8ccd-1cff2dc494da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetShareItem", "GetShareCachingMode", "IsShareDfsJunction"]

    /**
     * Finds the cache item representing the closest ancestor share to the item.
     * @returns {IOfflineFilesShareItem} Receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesshareitem">IOfflineFilesShareItem</a> interface on the share item.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesshareinfo-getshareitem
     */
    GetShareItem() {
        result := ComCall(3, this, "ptr*", &ppShareItem := 0, "HRESULT")
        return IOfflineFilesShareItem(ppShareItem)
    }

    /**
     * Retrieves the caching mode configuration of the closest ancestor share to the item.
     * @returns {Integer} Receives a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_caching_mode">OFFLINEFILES_CACHING_MODE</a> enumeration that indicates the caching mode.
     * 
     * The following values can be returned:
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesshareinfo-getsharecachingmode
     */
    GetShareCachingMode() {
        result := ComCall(4, this, "int*", &pCachingMode := 0, "HRESULT")
        return pCachingMode
    }

    /**
     * Determines whether the share item is a DFS junction or a shared folder on a server.
     * @returns {BOOL} Receives <b>TRUE</b> if the item is a DFS junction, or <b>FALSE</b> if the share is a shared folder (\\server\share) on a server.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesshareinfo-issharedfsjunction
     */
    IsShareDfsJunction() {
        result := ComCall(5, this, "int*", &pbIsDfsJunction := 0, "HRESULT")
        return pbIsDfsJunction
    }
}
