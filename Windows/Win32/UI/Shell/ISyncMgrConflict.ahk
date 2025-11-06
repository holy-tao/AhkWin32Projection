#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include .\SYNCMGR_CONFLICT_ID_INFO.ahk
#Include .\ISyncMgrConflictItems.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide information about a conflict retrieved from a conflict store, and allows the conflict to be resolved.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrconflict
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrConflict extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrConflict
     * @type {Guid}
     */
    static IID => Guid("{9c204249-c443-4ba4-85ed-c972681db137}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperty", "GetConflictIdInfo", "GetItemsArray", "Resolve", "GetResolutionHandler"]

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflict-getproperty
     */
    GetProperty(propkey) {
        ppropvar := PROPVARIANT()
        result := ComCall(3, this, "ptr", propkey, "ptr", ppropvar, "HRESULT")
        return ppropvar
    }

    /**
     * 
     * @returns {SYNCMGR_CONFLICT_ID_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflict-getconflictidinfo
     */
    GetConflictIdInfo() {
        pConflictIdInfo := SYNCMGR_CONFLICT_ID_INFO()
        result := ComCall(4, this, "ptr", pConflictIdInfo, "HRESULT")
        return pConflictIdInfo
    }

    /**
     * 
     * @returns {ISyncMgrConflictItems} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflict-getitemsarray
     */
    GetItemsArray() {
        result := ComCall(5, this, "ptr*", &ppArray := 0, "HRESULT")
        return ISyncMgrConflictItems(ppArray)
    }

    /**
     * 
     * @param {ISyncMgrConflictResolveInfo} pResolveInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflict-resolve
     */
    Resolve(pResolveInfo) {
        result := ComCall(6, this, "ptr", pResolveInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflict-getresolutionhandler
     */
    GetResolutionHandler(riid) {
        result := ComCall(7, this, "ptr", riid, "ptr*", &ppvResolutionHandler := 0, "HRESULT")
        return ppvResolutionHandler
    }
}
