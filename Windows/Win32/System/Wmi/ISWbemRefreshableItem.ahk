#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISWbemRefresher.ahk
#Include .\ISWbemObjectEx.ahk
#Include .\ISWbemObjectSet.ahk
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
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
    }

    /**
     * @type {ISWbemRefresher} 
     */
    Refresher {
        get => this.get_Refresher()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsSet {
        get => this.get_IsSet()
    }

    /**
     * @type {ISWbemObjectEx} 
     */
    Object {
        get => this.get_Object()
    }

    /**
     * @type {ISWbemObjectSet} 
     */
    ObjectSet {
        get => this.get_ObjectSet()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Index() {
        result := ComCall(7, this, "int*", &iIndex := 0, "HRESULT")
        return iIndex
    }

    /**
     * 
     * @returns {ISWbemRefresher} 
     */
    get_Refresher() {
        result := ComCall(8, this, "ptr*", &objWbemRefresher := 0, "HRESULT")
        return ISWbemRefresher(objWbemRefresher)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsSet() {
        result := ComCall(9, this, "short*", &bIsSet := 0, "HRESULT")
        return bIsSet
    }

    /**
     * 
     * @returns {ISWbemObjectEx} 
     */
    get_Object() {
        result := ComCall(10, this, "ptr*", &objWbemObject := 0, "HRESULT")
        return ISWbemObjectEx(objWbemObject)
    }

    /**
     * 
     * @returns {ISWbemObjectSet} 
     */
    get_ObjectSet() {
        result := ComCall(11, this, "ptr*", &objWbemObjectSet := 0, "HRESULT")
        return ISWbemObjectSet(objWbemObjectSet)
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
