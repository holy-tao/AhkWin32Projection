#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the ghosting status of an item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesghostinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesGhostInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesGhostInfo
     * @type {Guid}
     */
    static IID => Guid("{2b09d48c-8ab5-464f-a755-a59d92f99429}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsGhosted"]

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
        result := ComCall(3, this, "int*", &pbGhosted := 0, "HRESULT")
        return pbGhosted
    }
}
