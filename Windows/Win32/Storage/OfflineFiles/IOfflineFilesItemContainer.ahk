#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to access item enumeration functionality in the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesitemcontainer
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesItemContainer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesItemContainer
     * @type {Guid}
     */
    static IID => Guid("{3836f049-9413-45dd-bf46-b5aaa82dc310}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumItems", "EnumItemsEx"]

    /**
     * 
     * @param {Integer} dwQueryFlags 
     * @param {Pointer<IEnumOfflineFilesItems>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitemcontainer-enumitems
     */
    EnumItems(dwQueryFlags, ppenum) {
        result := ComCall(3, this, "uint", dwQueryFlags, "ptr*", ppenum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOfflineFilesItemFilter} pIncludeFileFilter 
     * @param {IOfflineFilesItemFilter} pIncludeDirFilter 
     * @param {IOfflineFilesItemFilter} pExcludeFileFilter 
     * @param {IOfflineFilesItemFilter} pExcludeDirFilter 
     * @param {Integer} dwEnumFlags 
     * @param {Integer} dwQueryFlags 
     * @param {Pointer<IEnumOfflineFilesItems>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitemcontainer-enumitemsex
     */
    EnumItemsEx(pIncludeFileFilter, pIncludeDirFilter, pExcludeFileFilter, pExcludeDirFilter, dwEnumFlags, dwQueryFlags, ppenum) {
        result := ComCall(4, this, "ptr", pIncludeFileFilter, "ptr", pIncludeDirFilter, "ptr", pExcludeFileFilter, "ptr", pExcludeDirFilter, "uint", dwEnumFlags, "uint", dwQueryFlags, "ptr*", ppenum, "HRESULT")
        return result
    }
}
