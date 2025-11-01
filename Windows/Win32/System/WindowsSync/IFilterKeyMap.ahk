#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFilterKeyMap extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "AddFilter", "GetFilter", "Serialize"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     */
    GetCount(pdwCount) {
        result := ComCall(3, this, "uint*", pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncFilter} pISyncFilter 
     * @param {Pointer<Integer>} pdwFilterKey 
     * @returns {HRESULT} 
     */
    AddFilter(pISyncFilter, pdwFilterKey) {
        result := ComCall(4, this, "ptr", pISyncFilter, "uint*", pdwFilterKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<ISyncFilter>} ppISyncFilter 
     * @returns {HRESULT} 
     */
    GetFilter(dwFilterKey, ppISyncFilter) {
        result := ComCall(5, this, "uint", dwFilterKey, "ptr*", ppISyncFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbFilterKeyMap 
     * @param {Pointer<Integer>} pcbFilterKeyMap 
     * @returns {HRESULT} 
     */
    Serialize(pbFilterKeyMap, pcbFilterKeyMap) {
        result := ComCall(6, this, "char*", pbFilterKeyMap, "uint*", pcbFilterKeyMap, "HRESULT")
        return result
    }
}
