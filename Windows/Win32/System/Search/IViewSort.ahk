#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IViewSort extends IUnknown{
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
     * 
     * @param {Pointer<UIntPtr>} pcValues 
     * @param {Pointer<UIntPtr>} prgColumns 
     * @param {Pointer<UInt32>} prgOrders 
     * @returns {HRESULT} 
     */
    GetSortOrder(pcValues, prgColumns, prgOrders) {
        result := ComCall(3, this, "ptr*", pcValues, "ptr*", prgColumns, "uint*", prgOrders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} cValues 
     * @param {Pointer<UIntPtr>} rgColumns 
     * @param {Pointer<UInt32>} rgOrders 
     * @returns {HRESULT} 
     */
    SetSortOrder(cValues, rgColumns, rgOrders) {
        result := ComCall(4, this, "ptr", cValues, "ptr*", rgColumns, "uint*", rgOrders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
