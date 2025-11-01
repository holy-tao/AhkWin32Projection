#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISortColumnArray extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISortColumnArray
     * @type {Guid}
     */
    static IID => Guid("{6dfc60fb-f2e9-459b-beb5-288f1a7c7d54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "GetSortType"]

    /**
     * 
     * @param {Pointer<Integer>} columnCount 
     * @returns {HRESULT} 
     */
    GetCount(columnCount) {
        result := ComCall(3, this, "uint*", columnCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<SORTCOLUMN>} sortcolumn 
     * @returns {HRESULT} 
     */
    GetAt(index, sortcolumn) {
        result := ComCall(4, this, "uint", index, "ptr", sortcolumn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} type 
     * @returns {HRESULT} 
     */
    GetSortType(type) {
        result := ComCall(5, this, "int*", type, "HRESULT")
        return result
    }
}
