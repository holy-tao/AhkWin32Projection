#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CONFIRM_CONFLICT_ITEM.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get conflict item data and item count.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrconflictitems
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrConflictItems extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrConflictItems
     * @type {Guid}
     */
    static IID => Guid("{9c7ead52-8023-4936-a4db-d2a9a99e436a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetItem"]

    /**
     * Gets the conflict item count.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to the item count.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictitems-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets a specified conflict data item.
     * @param {Integer} iIndex Type: <b>UINT</b>
     * 
     * The index of the conflict item to retrieve.
     * @returns {CONFIRM_CONFLICT_ITEM} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-confirm_conflict_item">CONFIRM_CONFLICT_ITEM</a>*</b>
     * 
     * When this method returns successfully, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-confirm_conflict_item">CONFIRM_CONFLICT_ITEM</a> structure that contains information about the conflict.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictitems-getitem
     */
    GetItem(iIndex) {
        pItemInfo := CONFIRM_CONFLICT_ITEM()
        result := ComCall(4, this, "uint", iIndex, "ptr", pItemInfo, "HRESULT")
        return pItemInfo
    }
}
