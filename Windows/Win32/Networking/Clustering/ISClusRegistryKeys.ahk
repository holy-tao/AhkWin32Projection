#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusRegistryKeys extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusRegistryKeys
     * @type {Guid}
     */
    static IID => Guid("{f2e6072a-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "Refresh", "get_Item", "AddItem", "RemoveItem"]

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
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {BSTR} 
     */
    get_Item(varIndex) {
        pbstrRegistryKey := BSTR()
        result := ComCall(10, this, "ptr", varIndex, "ptr", pbstrRegistryKey, "HRESULT")
        return pbstrRegistryKey
    }

    /**
     * 
     * @param {BSTR} bstrRegistryKey 
     * @returns {HRESULT} 
     */
    AddItem(bstrRegistryKey) {
        bstrRegistryKey := bstrRegistryKey is String ? BSTR.Alloc(bstrRegistryKey).Value : bstrRegistryKey

        result := ComCall(11, this, "ptr", bstrRegistryKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    RemoveItem(varIndex) {
        result := ComCall(12, this, "ptr", varIndex, "HRESULT")
        return result
    }
}
