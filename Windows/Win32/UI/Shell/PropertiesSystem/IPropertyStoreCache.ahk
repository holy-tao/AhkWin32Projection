#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPropertyStore.ahk

/**
 * Exposes methods that allow a handler to manage various states for each property.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface, from which it inherits.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface is provided by CLSID_InMemoryPropertyStore. Users should never need to implement it themselves.
  * 
  *                 
  * 
  * CLSID_InMemoryPropertyStore implements <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecache">IPropertyStoreCache</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> so that it can store additional state information (<a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-psc_state">PSC_STATE</a>) about each of the properties in the cache. This information can be useful for property handler implementers. It can also be useful in other scenarios where a cache of property values is needed.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertystorecache
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyStoreCache extends IPropertyStore{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyStoreCache
     * @type {Guid}
     */
    static IID => Guid("{3017056d-9a91-4e90-937d-746c72abbf4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetState", "GetValueAndState", "SetState", "SetValueAndState"]

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Integer>} pstate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystorecache-getstate
     */
    GetState(key, pstate) {
        pstateMarshal := pstate is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ptr", key, pstateMarshal, pstate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @param {Pointer<Integer>} pstate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystorecache-getvalueandstate
     */
    GetValueAndState(key, ppropvar, pstate) {
        pstateMarshal := pstate is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", key, "ptr", ppropvar, pstateMarshal, pstate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Integer} state 
     * @returns {HRESULT} 
     */
    SetState(key, state) {
        result := ComCall(10, this, "ptr", key, "int", state, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @param {Integer} state 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystorecache-setvalueandstate
     */
    SetValueAndState(key, ppropvar, state) {
        result := ComCall(11, this, "ptr", key, "ptr", ppropvar, "int", state, "HRESULT")
        return result
    }
}
