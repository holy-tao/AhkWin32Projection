#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\PSC_STATE.ahk" { PSC_STATE }
#Import ".\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * Exposes methods that allow a handler to manage various states for each property.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided by CLSID_InMemoryPropertyStore. Users should never need to implement it themselves.
 * 
 *                 
 * 
 * CLSID_InMemoryPropertyStore implements <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecache">IPropertyStoreCache</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> so that it can store additional state information (<a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-psc_state">PSC_STATE</a>) about each of the properties in the cache. This information can be useful for property handler implementers. It can also be useful in other scenarios where a cache of property values is needed.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertystorecache
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyStoreCache extends IPropertyStore {
    /**
     * The interface identifier for IPropertyStoreCache
     * @type {Guid}
     */
    static IID := Guid("{3017056d-9a91-4e90-937d-746c72abbf4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyStoreCache interfaces
    */
    struct Vtbl extends IPropertyStore.Vtbl {
        GetState         : IntPtr
        GetValueAndState : IntPtr
        SetState         : IntPtr
        SetValueAndState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyStoreCache.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the state of a specified property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @returns {PSC_STATE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-psc_state">PSC_STATE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-psc_state">PSC_STATE</a> enumeration value.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystorecache-getstate
     */
    GetState(key) {
        result := ComCall(8, this, PROPERTYKEY.Ptr, key, "int*", &pstate := 0, "HRESULT")
        return pstate
    }

    /**
     * Gets value and state data for a property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure identifying the property.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure for the property data.
     * @param {Pointer<PSC_STATE>} pstate Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-psc_state">PSC_STATE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-psc_state">PSC_STATE</a> enumeration value declaring the current state of the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystorecache-getvalueandstate
     */
    GetValueAndState(key, ppropvar, pstate) {
        pstateMarshal := pstate is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, PROPERTYKEY.Ptr, key, PROPVARIANT.Ptr, ppropvar, pstateMarshal, pstate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {PSC_STATE} state 
     * @returns {HRESULT} 
     */
    SetState(key, state) {
        result := ComCall(10, this, PROPERTYKEY.Ptr, key, PSC_STATE, state, "HRESULT")
        return result
    }

    /**
     * Sets value and state data for a property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure identifying the property.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure containing the property data.
     * @param {PSC_STATE} state Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-psc_state">PSC_STATE</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-psc_state">PSC_STATE</a> enumeration declaring the state of the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystorecache-setvalueandstate
     */
    SetValueAndState(key, ppropvar, state) {
        result := ComCall(11, this, PROPERTYKEY.Ptr, key, PROPVARIANT.Ptr, ppropvar, PSC_STATE, state, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPropertyStoreCache.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetState := CallbackCreate(GetMethod(implObj, "GetState"), flags, 3)
        this.vtbl.GetValueAndState := CallbackCreate(GetMethod(implObj, "GetValueAndState"), flags, 4)
        this.vtbl.SetState := CallbackCreate(GetMethod(implObj, "SetState"), flags, 3)
        this.vtbl.SetValueAndState := CallbackCreate(GetMethod(implObj, "SetValueAndState"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetState)
        CallbackFree(this.vtbl.GetValueAndState)
        CallbackFree(this.vtbl.SetState)
        CallbackFree(this.vtbl.SetValueAndState)
    }
}
