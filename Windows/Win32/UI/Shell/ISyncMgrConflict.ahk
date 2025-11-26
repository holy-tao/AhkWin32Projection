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
     * Gets a conflict property, given a property key.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the property key for which the property is being requested. Any property key is valid here, including but not limited to the following values.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this method returns, contains a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the requested property.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflict-getproperty
     */
    GetProperty(propkey) {
        ppropvar := PROPVARIANT()
        result := ComCall(3, this, "ptr", propkey, "ptr", ppropvar, "HRESULT")
        return ppropvar
    }

    /**
     * Gets information that identifies a conflict within a conflict store.
     * @returns {SYNCMGR_CONFLICT_ID_INFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-syncmgr_conflict_id_info">SYNCMGR_CONFLICT_ID_INFO</a>*</b>
     * 
     * A pointer to a conflict ID info structure. See <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-syncmgr_conflict_id_info">SYNCMGR_CONFLICT_ID_INFO</a>.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflict-getconflictidinfo
     */
    GetConflictIdInfo() {
        pConflictIdInfo := SYNCMGR_CONFLICT_ID_INFO()
        result := ComCall(4, this, "ptr", pConflictIdInfo, "HRESULT")
        return pConflictIdInfo
    }

    /**
     * Retrieves a conflict items array.
     * @returns {ISyncMgrConflictItems} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictitems">ISyncMgrConflictItems</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictitems">ISyncMgrConflictItems</a> array.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflict-getitemsarray
     */
    GetItemsArray() {
        result := ComCall(5, this, "ptr*", &ppArray := 0, "HRESULT")
        return ISyncMgrConflictItems(ppArray)
    }

    /**
     * Resolves the conflict using its own sync handler, controls UI.
     * @param {ISyncMgrConflictResolveInfo} pResolveInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictresolveinfo">ISyncMgrConflictResolveInfo</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictresolveinfo">ISyncMgrConflictResolveInfo</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflict-resolve
     */
    Resolve(pResolveInfo) {
        result := ComCall(6, this, "ptr", pResolveInfo, "HRESULT")
        return result
    }

    /**
     * Gets the resolution handler for the conflict.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the ID for the resolution handler.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflict-getresolutionhandler
     */
    GetResolutionHandler(riid) {
        result := ComCall(7, this, "ptr", riid, "ptr*", &ppvResolutionHandler := 0, "HRESULT")
        return ppvResolutionHandler
    }
}
