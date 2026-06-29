#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\GETPROPERTYSTOREFLAGS.ahk" { GETPROPERTYSTOREFLAGS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPropertyStoreFactory.ahk" { IPropertyStoreFactory }

/**
 * Exposes a method to create a specified IPropertyStore object in circumstances where property access is potentially slow.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-idelayedpropertystorefactory
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IDelayedPropertyStoreFactory extends IPropertyStoreFactory {
    /**
     * The interface identifier for IDelayedPropertyStoreFactory
     * @type {Guid}
     */
    static IID := Guid("{40d4577f-e237-4bdb-bd69-58f089431b6a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDelayedPropertyStoreFactory interfaces
    */
    struct Vtbl extends IPropertyStoreFactory.Vtbl {
        GetDelayedPropertyStore : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDelayedPropertyStoreFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an IPropertyStore interface object, as specified.
     * @param {GETPROPERTYSTOREFLAGS} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * The GPS_XXX flags that modify the store that is returned. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a>.
     * @param {Integer} dwStoreId Type: <b>DWORD</b>
     * 
     * The property store ID. Valid values are.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-idelayedpropertystorefactory-getdelayedpropertystore
     */
    GetDelayedPropertyStore(flags, dwStoreId, riid) {
        result := ComCall(5, this, GETPROPERTYSTOREFLAGS, flags, "uint", dwStoreId, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IDelayedPropertyStoreFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDelayedPropertyStore := CallbackCreate(GetMethod(implObj, "GetDelayedPropertyStore"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDelayedPropertyStore)
    }
}
