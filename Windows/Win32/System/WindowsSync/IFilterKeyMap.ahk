#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncFilter.ahk
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
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncFilter} pISyncFilter 
     * @param {Pointer<Integer>} pdwFilterKey 
     * @returns {HRESULT} 
     */
    AddFilter(pISyncFilter, pdwFilterKey) {
        pdwFilterKeyMarshal := pdwFilterKey is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pISyncFilter, pdwFilterKeyMarshal, pdwFilterKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @returns {ISyncFilter} 
     */
    GetFilter(dwFilterKey) {
        result := ComCall(5, this, "uint", dwFilterKey, "ptr*", &ppISyncFilter := 0, "HRESULT")
        return ISyncFilter(ppISyncFilter)
    }

    /**
     * 
     * @param {Pointer<Integer>} pbFilterKeyMap 
     * @param {Pointer<Integer>} pcbFilterKeyMap 
     * @returns {HRESULT} 
     */
    Serialize(pbFilterKeyMap, pcbFilterKeyMap) {
        pbFilterKeyMapMarshal := pbFilterKeyMap is VarRef ? "char*" : "ptr"
        pcbFilterKeyMapMarshal := pcbFilterKeyMap is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pbFilterKeyMapMarshal, pbFilterKeyMap, pcbFilterKeyMapMarshal, pcbFilterKeyMap, "HRESULT")
        return result
    }
}
