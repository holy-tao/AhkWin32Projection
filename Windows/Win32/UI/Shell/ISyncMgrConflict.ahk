#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide information about a conflict retrieved from a conflict store, and allows the conflict to be resolved.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrconflict
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrConflict extends IUnknown{
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
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     */
    GetProperty(propkey, ppropvar) {
        result := ComCall(3, this, "ptr", propkey, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYNCMGR_CONFLICT_ID_INFO>} pConflictIdInfo 
     * @returns {HRESULT} 
     */
    GetConflictIdInfo(pConflictIdInfo) {
        result := ComCall(4, this, "ptr", pConflictIdInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncMgrConflictItems>} ppArray 
     * @returns {HRESULT} 
     */
    GetItemsArray(ppArray) {
        result := ComCall(5, this, "ptr", ppArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncMgrConflictResolveInfo>} pResolveInfo 
     * @returns {HRESULT} 
     */
    Resolve(pResolveInfo) {
        result := ComCall(6, this, "ptr", pResolveInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvResolutionHandler 
     * @returns {HRESULT} 
     */
    GetResolutionHandler(riid, ppvResolutionHandler) {
        result := ComCall(7, this, "ptr", riid, "ptr", ppvResolutionHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
