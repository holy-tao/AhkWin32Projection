#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISortColumnArray extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} columnCount 
     * @returns {HRESULT} 
     */
    GetCount(columnCount) {
        result := ComCall(3, this, "uint*", columnCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<SORTCOLUMN>} sortcolumn 
     * @returns {HRESULT} 
     */
    GetAt(index, sortcolumn) {
        result := ComCall(4, this, "uint", index, "ptr", sortcolumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} type 
     * @returns {HRESULT} 
     */
    GetSortType(type) {
        result := ComCall(5, this, "int*", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
