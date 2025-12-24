#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CONFIRM_CONFLICT_RESULT_INFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get item info and item count.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrconflictresolutionitems
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrConflictResolutionItems extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrConflictResolutionItems
     * @type {Guid}
     */
    static IID => Guid("{458725b9-129d-4135-a998-9ceafec27007}")

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
     * Gets item count.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to an item count.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictresolutionitems-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets result information for a specified item, when successful.
     * @param {Integer} iIndex Type: <b>UINT</b>
     * 
     * The index of the item.
     * @returns {CONFIRM_CONFLICT_RESULT_INFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-confirm_conflict_result_info">CONFIRM_CONFLICT_RESULT_INFO</a>*</b>
     * 
     * On success, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-confirm_conflict_result_info">CONFIRM_CONFLICT_RESULT_INFO</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictresolutionitems-getitem
     */
    GetItem(iIndex) {
        pItemInfo := CONFIRM_CONFLICT_RESULT_INFO()
        result := ComCall(4, this, "uint", iIndex, "ptr", pItemInfo, "HRESULT")
        return pItemInfo
    }
}
