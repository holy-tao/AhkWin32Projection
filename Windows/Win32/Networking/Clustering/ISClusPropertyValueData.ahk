#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusPropertyValueData extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusPropertyValueData
     * @type {Guid}
     */
    static IID => Guid("{f2e6071e-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Item", "CreateItem", "RemoveItem"]

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(7, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(8, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    get_Item(varIndex, pvarValue) {
        result := ComCall(9, this, "ptr", varIndex, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varValue 
     * @param {Pointer<VARIANT>} pvarData 
     * @returns {HRESULT} 
     */
    CreateItem(varValue, pvarData) {
        result := ComCall(10, this, "ptr", varValue, "ptr", pvarData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    RemoveItem(varIndex) {
        result := ComCall(11, this, "ptr", varIndex, "HRESULT")
        return result
    }
}
