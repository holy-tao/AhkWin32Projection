#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\ISClusPropertyValue.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusPropertyValues extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusPropertyValues
     * @type {Guid}
     */
    static IID => Guid("{f2e6071c-2631-11d1-89f1-00a0c90d061e}")

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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {ISClusPropertyValue} 
     */
    get_Item(varIndex) {
        result := ComCall(9, this, "ptr", varIndex, "ptr*", &ppPropertyValue := 0, "HRESULT")
        return ISClusPropertyValue(ppPropertyValue)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {VARIANT} varValue 
     * @returns {ISClusPropertyValue} 
     */
    CreateItem(bstrName, varValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "ptr", varValue, "ptr*", &ppPropertyValue := 0, "HRESULT")
        return ISClusPropertyValue(ppPropertyValue)
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
