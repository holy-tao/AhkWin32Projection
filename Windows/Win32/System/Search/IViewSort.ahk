#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IViewSort extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewSort
     * @type {Guid}
     */
    static IID => Guid("{0c733a9a-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSortOrder", "SetSortOrder"]

    /**
     * 
     * @param {Pointer<Pointer>} pcValues 
     * @param {Pointer<Pointer<Pointer>>} prgColumns 
     * @param {Pointer<Pointer<Integer>>} prgOrders 
     * @returns {HRESULT} 
     */
    GetSortOrder(pcValues, prgColumns, prgOrders) {
        pcValuesMarshal := pcValues is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcValuesMarshal, pcValues, "ptr*", prgColumns, "ptr*", prgOrders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cValues 
     * @param {Pointer<Pointer>} rgColumns 
     * @param {Pointer<Integer>} rgOrders 
     * @returns {HRESULT} 
     */
    SetSortOrder(cValues, rgColumns, rgOrders) {
        rgColumnsMarshal := rgColumns is VarRef ? "ptr*" : "ptr"
        rgOrdersMarshal := rgOrders is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", cValues, rgColumnsMarshal, rgColumns, rgOrdersMarshal, rgOrders, "HRESULT")
        return result
    }
}
