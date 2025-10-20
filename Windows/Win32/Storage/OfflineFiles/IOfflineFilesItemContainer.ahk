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
     * 
     * @param {Integer} dwQueryFlags 
     * @param {Pointer<IEnumOfflineFilesItems>} ppenum 
     * @returns {HRESULT} 
     */
    EnumItems(dwQueryFlags, ppenum) {
        result := ComCall(3, this, "uint", dwQueryFlags, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOfflineFilesItemFilter>} pIncludeFileFilter 
     * @param {Pointer<IOfflineFilesItemFilter>} pIncludeDirFilter 
     * @param {Pointer<IOfflineFilesItemFilter>} pExcludeFileFilter 
     * @param {Pointer<IOfflineFilesItemFilter>} pExcludeDirFilter 
     * @param {Integer} dwEnumFlags 
     * @param {Integer} dwQueryFlags 
     * @param {Pointer<IEnumOfflineFilesItems>} ppenum 
     * @returns {HRESULT} 
     */
    EnumItemsEx(pIncludeFileFilter, pIncludeDirFilter, pExcludeFileFilter, pExcludeDirFilter, dwEnumFlags, dwQueryFlags, ppenum) {
        result := ComCall(4, this, "ptr", pIncludeFileFilter, "ptr", pIncludeDirFilter, "ptr", pExcludeFileFilter, "ptr", pExcludeDirFilter, "uint", dwEnumFlags, "uint", dwQueryFlags, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
