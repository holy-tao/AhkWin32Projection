#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolutionitems-getcount
     */
    GetCount(pCount) {
        result := ComCall(3, this, "uint*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<CONFIRM_CONFLICT_RESULT_INFO>} pItemInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolutionitems-getitem
     */
    GetItem(iIndex, pItemInfo) {
        result := ComCall(4, this, "uint", iIndex, "ptr", pItemInfo, "HRESULT")
        return result
    }
}
