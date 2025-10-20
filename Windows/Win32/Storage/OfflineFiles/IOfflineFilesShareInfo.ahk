#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Presents share-specific information about cached items.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesshareinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesShareInfo extends IUnknown{
    /**
     * The interface identifier for IOfflineFilesShareInfo
     * @type {Guid}
     */
    static IID => Guid("{7bcc43e7-31ce-4ca4-8ccd-1cff2dc494da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IOfflineFilesShareItem>} ppShareItem 
     * @returns {HRESULT} 
     */
    GetShareItem(ppShareItem) {
        result := ComCall(3, this, "ptr", ppShareItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCachingMode 
     * @returns {HRESULT} 
     */
    GetShareCachingMode(pCachingMode) {
        result := ComCall(4, this, "int*", pCachingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbIsDfsJunction 
     * @returns {HRESULT} 
     */
    IsShareDfsJunction(pbIsDfsJunction) {
        result := ComCall(5, this, "ptr", pbIsDfsJunction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
