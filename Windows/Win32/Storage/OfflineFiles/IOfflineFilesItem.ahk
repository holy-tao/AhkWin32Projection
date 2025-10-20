#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a single item in the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesitem
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesItem
     * @type {Guid}
     */
    static IID => Guid("{4a753da6-e044-4f12-a718-5d14d079a906}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemType", "GetPath", "GetParentItem", "Refresh", "IsMarkedForDeletion"]

    /**
     * 
     * @param {Pointer<Integer>} pItemType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitem-getitemtype
     */
    GetItemType(pItemType) {
        result := ComCall(3, this, "int*", pItemType, "HRESULT")
        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Pointer<PWSTR>} ppszPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(ppszPath) {
        result := ComCall(4, this, "ptr", ppszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOfflineFilesItem>} ppItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitem-getparentitem
     */
    GetParentItem(ppItem) {
        result := ComCall(5, this, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwQueryFlags 
     * @returns {HRESULT} 
     */
    Refresh(dwQueryFlags) {
        result := ComCall(6, this, "uint", dwQueryFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbMarkedForDeletion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitem-ismarkedfordeletion
     */
    IsMarkedForDeletion(pbMarkedForDeletion) {
        result := ComCall(7, this, "ptr", pbMarkedForDeletion, "HRESULT")
        return result
    }
}
