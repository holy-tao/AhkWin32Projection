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
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetCount(pCount) {
        result := ComCall(3, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<CONFIRM_CONFLICT_RESULT_INFO>} pItemInfo 
     * @returns {HRESULT} 
     */
    GetItem(iIndex, pItemInfo) {
        result := ComCall(4, this, "uint", iIndex, "ptr", pItemInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
