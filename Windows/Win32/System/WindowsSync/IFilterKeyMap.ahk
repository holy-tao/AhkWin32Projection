#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFilterKeyMap extends IUnknown{
    /**
     * The interface identifier for IFilterKeyMap
     * @type {Guid}
     */
    static IID => Guid("{ca169652-07c6-4708-a3da-6e4eba8d2297}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetCount(pdwCount) {
        result := ComCall(3, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncFilter>} pISyncFilter 
     * @param {Pointer<UInt32>} pdwFilterKey 
     * @returns {HRESULT} 
     */
    AddFilter(pISyncFilter, pdwFilterKey) {
        result := ComCall(4, this, "ptr", pISyncFilter, "uint*", pdwFilterKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<ISyncFilter>} ppISyncFilter 
     * @returns {HRESULT} 
     */
    GetFilter(dwFilterKey, ppISyncFilter) {
        result := ComCall(5, this, "uint", dwFilterKey, "ptr", ppISyncFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbFilterKeyMap 
     * @param {Pointer<UInt32>} pcbFilterKeyMap 
     * @returns {HRESULT} 
     */
    Serialize(pbFilterKeyMap, pcbFilterKeyMap) {
        result := ComCall(6, this, "char*", pbFilterKeyMap, "uint*", pcbFilterKeyMap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
