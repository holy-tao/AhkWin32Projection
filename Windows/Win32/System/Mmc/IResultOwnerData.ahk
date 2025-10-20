#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IResultOwnerData interface supports the use of virtual lists, which are list-view controls that have the LVS_OWNERDATA style set.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iresultownerdata
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IResultOwnerData extends IUnknown{
    /**
     * The interface identifier for IResultOwnerData
     * @type {Guid}
     */
    static IID => Guid("{9cb396d8-ea83-11d0-aef1-00c04fb6dd2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<RESULTFINDINFO>} pFindInfo 
     * @param {Pointer<Int32>} pnFoundIndex 
     * @returns {HRESULT} 
     */
    FindItem(pFindInfo, pnFoundIndex) {
        result := ComCall(3, this, "ptr", pFindInfo, "int*", pnFoundIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nStartIndex 
     * @param {Integer} nEndIndex 
     * @returns {HRESULT} 
     */
    CacheHint(nStartIndex, nEndIndex) {
        result := ComCall(4, this, "int", nStartIndex, "int", nEndIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nColumn 
     * @param {Integer} dwSortOptions 
     * @param {LPARAM} lUserParam 
     * @returns {HRESULT} 
     */
    SortItems(nColumn, dwSortOptions, lUserParam) {
        result := ComCall(5, this, "int", nColumn, "uint", dwSortOptions, "ptr", lUserParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
