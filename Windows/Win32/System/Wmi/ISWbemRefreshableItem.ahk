#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemRefreshableItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemRefreshableItem
     * @type {Guid}
     */
    static IID => Guid("{5ad4bf92-daab-11d3-b38f-00105a1f473a}")

    /**
     * The class identifier for SWbemRefreshableItem
     * @type {Guid}
     */
    static CLSID => Guid("{8c6854bc-de4b-11d3-b390-00105a1f473a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Index", "get_Refresher", "get_IsSet", "get_Object", "get_ObjectSet", "Remove"]

    /**
     * 
     * @param {Pointer<Integer>} iIndex 
     * @returns {HRESULT} 
     */
    get_Index(iIndex) {
        result := ComCall(7, this, "int*", iIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemRefresher>} objWbemRefresher 
     * @returns {HRESULT} 
     */
    get_Refresher(objWbemRefresher) {
        result := ComCall(8, this, "ptr*", objWbemRefresher, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bIsSet 
     * @returns {HRESULT} 
     */
    get_IsSet(bIsSet) {
        result := ComCall(9, this, "ptr", bIsSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemObjectEx>} objWbemObject 
     * @returns {HRESULT} 
     */
    get_Object(objWbemObject) {
        result := ComCall(10, this, "ptr*", objWbemObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemObjectSet>} objWbemObjectSet 
     * @returns {HRESULT} 
     */
    get_ObjectSet(objWbemObjectSet) {
        result := ComCall(11, this, "ptr*", objWbemObjectSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     */
    Remove(iFlags) {
        result := ComCall(12, this, "int", iFlags, "HRESULT")
        return result
    }
}
