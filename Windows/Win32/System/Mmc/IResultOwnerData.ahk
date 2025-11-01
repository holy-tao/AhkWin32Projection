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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindItem", "CacheHint", "SortItems"]

    /**
     * 
     * @param {Pointer<RESULTFINDINFO>} pFindInfo 
     * @param {Pointer<Integer>} pnFoundIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultownerdata-finditem
     */
    FindItem(pFindInfo, pnFoundIndex) {
        result := ComCall(3, this, "ptr", pFindInfo, "int*", pnFoundIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nStartIndex 
     * @param {Integer} nEndIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultownerdata-cachehint
     */
    CacheHint(nStartIndex, nEndIndex) {
        result := ComCall(4, this, "int", nStartIndex, "int", nEndIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nColumn 
     * @param {Integer} dwSortOptions 
     * @param {LPARAM} lUserParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultownerdata-sortitems
     */
    SortItems(nColumn, dwSortOptions, lUserParam) {
        result := ComCall(5, this, "int", nColumn, "uint", dwSortOptions, "ptr", lUserParam, "HRESULT")
        return result
    }
}
